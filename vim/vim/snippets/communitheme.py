import os
import sys

project = sys.argv[1]
home = os.path.expanduser('~')
builddir = os.path.join(home, 'workspace', 'canonical', project, 'build')
os.chdir(builddir)
os.system('sudo ninja install')
