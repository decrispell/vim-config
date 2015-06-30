""" Specify compiler flags for the YouCompleteMe plugin in Vim.
"""
import os.path

default_flags = [
    '-DUSE_CLANG_COMPLETER',
    '-std=c++11',
    '-I',
    '.'
]


def FlagsForFile(filename):
    """ given the source filename, return the compiler flags """
    opt_basename = '.clang_complete'
    curr_dir = os.path.dirname(filename)
    opt_fname = os.path.join(curr_dir, opt_basename)
    # keep traversing up the tree until we find the file, or hit the root
    while not os.path.exists(opt_fname):
        new_dir = os.path.dirname(curr_dir)
        if new_dir == curr_dir:
            # we've reached the root of the tree
            break
        curr_dir = new_dir
        opt_fname = os.path.join(curr_dir, opt_basename)
    try:
        fd = open(opt_fname, 'r')
    except IOError:
        return {'flags': default_flags, 'do_cache': True}
    flags = [line.strip() for line in fd.readlines()]
    flags.append('-DUSE_CLANG_COMPLETER')
    flags.append('-std=c++11')
    return {
        'flags': flags, 'do_cache': True
    }

