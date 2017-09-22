#!/usr/bin/env python
'''Smart path shortener'''
import os


def smart_path():
    '''Returns a short view of cwd full path'''
    pwd = os.getcwd()
    homedir = os.path.expanduser('~')
    pwd = pwd.replace(homedir, '~', 1)

    if len(pwd) > 20:
        tokens = pwd.split('/')
        pwd = '~/%s/.../%s' % (tokens[1], tokens[-1])
        # pwd = pwd[:5] + '...' + pwd[-15:]  # first 10 chars+last 20 chars

    return pwd


if __name__ == '__main__':
    print(smart_path())
