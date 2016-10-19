#!/usr/bin/env python
import sys
import re
import logging

level = logging.ERROR
logging.basicConfig(level=level, format='    %(levelname)s %(message)s')
logger = logging.getLogger(__name__)

filename = sys.argv[1]

def purge_dates(str):
    return str.replace("s:\d+-\d+-\d+", "")

def sanitize_links(str):
    m = re.search("\[([\w\s\+-]+)\]\([\w\s\+-]+\)", str)
    if m:
        return re.sub("\[[\w\s\+-]+\]\([\w\s\+-]+\)", m.group(1), str);
    return str

for line in open(filename).readlines():
    if len(line) and line != '':
        line = line.strip()
        logger.debug("'%s'" % line)
        if not "[X]" in line and "due:" in line:
            line = sanitize_links(line)
            line = purge_dates(line)
            reminder = re.sub(".*due:", "REM ", line)
            if "AT" in reminder:
                print(reminder + " %b %1")
            else:
                print(reminder + " %b")
        else:
            logger.debug('skipping')
