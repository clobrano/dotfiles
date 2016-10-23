#!/usr/bin/env python
import sys
import re
import logging

level = logging.ERROR
logging.basicConfig(level=level, format='    %(levelname)s %(message)s')
logger = logging.getLogger(__name__)


class Converter(object):
    def __init__(self, context):
        self.context = context

    def convert(self, string):
        logger.debug('converter: ' + string)
        if not self.__skip(string):
            string = self.__sanitize_toggle(string)
            string = self.__sanitize_links(string)
            t = self.__get_due_date(string)
            if t:
                res = "REM %s @%s %s" % (t[0], context, t[1])
                logger.info(res)
                return res
        return None

    def __skip(self, string):
        '''Return True if the string is to be skipped, False otherwise'''
        return ("[X]" in line)

    def __get_due_date(self, string):
        '''
        Return tuple: (<due date>, <string without due date>)
        None if it cannot find due date
        '''
        m = re.findall('due:\d{4}-\d{2}-\d{2} AT \d{2}:\d{2}', string)
        if len(m) == 0:
            m = re.findall('due:\d{4}-\d{2}-\d{2}', string)
        # It is not expected to have more than one due date, so
        # keeping only the first
        if len(m) > 0:
            due_date = m[0]
            date = due_date[4:]
            string = string.replace(due_date, '').strip()
            logger.debug('due date: %s' % due_date)
            return (date, string)
        return None

    def __sanitize_toggle(self, string):
        string = string.replace('* ', '').strip()
        return string.replace('[ ] ', '').strip()

    def __sanitize_links(self, string):
        '''
        Converts markdown links
        '''
        m = re.search("\[([\w\s\+-]+)\]\([#\w\s\+-]+\)", string)
        if m:
            return re.sub("\[[\w\s\+-]+\]\([\w\s\+-]+\)", m.group(1), string);
        return string


if len(sys.argv) > 1:
    context = sys.argv[1]
else:
    context = None

filename = sys.argv[2]

def purge_dates(str):
    return str.replace("s:\d+-\d+-\d+", "")

def sanitize_links(str):
    m = re.search("\[([\w\s\+-]+)\]\([#\w\s\+-]+\)", str)
    if m:
        return re.sub("\[[\w\s\+-]+\]\([\w\s\+-]+\)", m.group(1), str);
    return str

c = Converter(context)

for line in open(filename).readlines():
    if len(line) and line != '':
        line = line.strip()
        reminder = c.convert(line)
        if reminder:
            print(reminder + " %b")
