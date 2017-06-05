#!/usr/bin/env python
import os

# Show path up to 20 chars or smart strip instead
def smartPath():
    pwd = os.getcwd()
    homedir = os.path.expanduser('~')
    pwd = pwd.replace(homedir, '~', 1)
    if len(pwd) > 20:
        pwd = pwd[:5]+'...'+pwd[-15:]  # first 10 chars+last 20 chars
    return pwd


if __name__ == '__main__':
    print(smartPath())
