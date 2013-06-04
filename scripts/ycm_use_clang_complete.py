# Specify compiler flags for the YouCompleteMe plugin in Vim.
import os.path

default_flags = [
    '-Wc++98-compat',
    '-DUSE_CLANG_COMPLETER',
    '-std=c++11',
    '-I',
    '.'
    ]

def FlagsForFile(filename):
    (dirname, basename) = os.path.split(filename)
    opt_fname = os.path.join(dirname,'.clang_complete')
    try:
        fd = open(opt_fname,'r')
    except IOError:
        return {'flags': default_flags, 'do_cache' : True}
    flags = [line.strip() for line in fd.readlines()]
    flags.append('-DUSE_CLANG_COMPLETER')
    return {
      'flags': flags, 'do_cache': True
    }

