#!/usr/bin/env python
# Python script to set/unset Atom Package Manager proxy setting.
# Jim Lawton, 29th June, 2015.

from __future__ import print_function
import os
import os.path
import sys
from optparse import OptionParser

_CFGFILE = ".atom/.apmrc"


def _getOpts():
    """Parse command line options and arguments."""
    usage = "%prog [options] [proxy-url]"
    parser = OptionParser(usage=usage,
                          description="Set/unset Atom Package Manager "
                          "proxy setting.")
    (opts, args) = parser.parse_args()
    opts.proxy = None
    if len(args) > 0:
        opts.proxy = args[0]
    return (opts, args)


def main():
    "Main function."
    opts, args = _getOpts()

    cfgfile = os.path.join(os.getenv("HOME"), _CFGFILE)
    if not os.path.exists(cfgfile):
        sys.exit("Config file %s does not exist!" % cfgfile)

    lines = newlines = []
    with open(cfgfile, 'r') as f:
        lines = cfgfile.readlines()
    found = False
    for line in lines:
        newline = None
        if "https_proxy" in line:
            found = True
            if opts.proxy:
                newline = "https_proxy = %s" % opts.proxy
        else:
            newline = line
        if newline:
            newlines.append(newline)
    if not found:        
        if opts.proxy:
            newline = "https_proxy = %s" % opts.proxy
            newlines.append(newline)
    with open(cfgfile, 'w') as f:
        f.writelines(lines)


if __name__ == '__main__':
    main()
    sys.exit(0)
