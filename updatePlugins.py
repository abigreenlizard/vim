#!/bin/python

from os import chdir, listdir, getcwd, environ
from subprocess import call

bundle = environ['HOME'] + '/.vim/bundle'
chdir(bundle)
for dirname in listdir(getcwd()):
    chdir(dirname)
    print(dirname)
    call(['git', 'pull', 'origin', 'master'])
    chdir('..')

call(['figlet', "Update complete."])
