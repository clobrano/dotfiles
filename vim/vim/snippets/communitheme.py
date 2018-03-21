import os
import sys

project = sys.argv[1]
home = os.path.expanduser('~')
builddir = os.path.join(home, 'workspace', project, 'build')
os.system('sudo ninja install -C {}'.format(builddir))
