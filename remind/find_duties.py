#!/usr/bin/env python
'''
usage:
    find_duties --file=<file> [--context=<ctx>] [--format=<fmt>]

options:
    -h --help                   show this message
    -f <file> --file=<file>     duties file path
    -c <ctx> --context=<ctx>    additional context (e.g. home, work)
    --format=<fmt>              convertion format (e.g. todo, remind)
    --debug                     enable debug logging
'''
import sys
import re
import logging
import docopt

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
                return self.compose(t[0], t[1])
        return None

    def compose(self, date, message):
        return "REM %s @%s %s %s" % (date, self.context, message, '%b')

    def __skip(self, string):
        '''Return True if the string is to be skipped, False otherwise'''
        if len(string) and line!= '':
            return ("[X]" in line)
        return False

    def __get_due_date(self, string):
        '''
        Return tuple: (<due date>, <string without due date>)
        None if it cannot find due date
        '''
        m = re.findall('due:(\d{4}-\d{2}-\d{2}|\w+)( AT d{2}:\d{2})?', string)
        # It is not expected to have more than one due date, so
        # keeping only the first
        if len(m) > 0:
            due_date = m[0]
            date = ''.join(due_date)
            string = string.replace('due:' + date, '').strip()
            return (date, string)
        return None

    def __sanitize_toggle(self, string):
        string = string.replace('* ', '').strip()
        return string.replace('[ ] ', '').strip()

    def __sanitize_links(self, string):
        '''
        Converts markdown links
        '''
        m = re.search("\[([\w\s\-]+)\]\(http.*\)", string)
        if m:
            return re.sub("\[[\w\s\+-]+\]\(http.*\)", m.group(1), string)
        return string


class TodoConverter(Converter):

    def compose(self, date, message):
        return '%s @%s %s' % (date, self.context, message)


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
        return re.sub("\[[\w\s\+-]+\]\([\w\s\+-]+\)", m.group(1), str)
    return str

if __name__ == '__main__':
    level = logging.INFO
    logging.basicConfig(level=level, format='    %(levelname)s %(message)s')
    logger = logging.getLogger(__name__)
    arguments = docopt.docopt(__doc__)

    if arguments['--context']:
        context = arguments['--context']
    else:
        context = ''

    if arguments['--format'] == 'todo':
        c = TodoConverter(context)
    else:
        c = Converter(context)

    for line in open(arguments['--file']).readlines():
        if len(line) and line != '':
            line = line.strip()
            reminder = c.convert(line)
            if reminder:
                print(reminder)


