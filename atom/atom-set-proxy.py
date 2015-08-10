#!/usr/bin/env python
# Python script to set/unset Atom Package Manager proxy setting.
# Jim Lawton, 29th June, 2015.

from __future__ import print_function
import os
import os.path
import sys
from optparse import OptionParser

_APM_CFGFILE = ".atom/.apmrc"
_NPM_CFGFILE = ".npmrc"


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

    for cfgfile in [_APM_CFGFILE, _NPM_CFGFILE]:
        cfgfile = os.path.join(os.getenv("HOME"), cfgfile)
        if not os.path.exists(cfgfile):
            # print("Config file %s does not exist!" % cfgfile)
            return

        lines = newlines = []
        with open(cfgfile, 'r') as f:
            lines = f.readlines()
        for line in lines:
            newline = None
            if "proxy" in line:
                if not opts.proxy:
                    continue
            else:
                newline = line
            if newline:
                newlines.append(newline)
        if opts.proxy:
            newlines.append("proxy = %s" % opts.proxy)
            newlines.append("https-proxy = %s" % opts.proxy)
        with open(cfgfile, 'w') as f:
            f.writelines(lines)


if __name__ == '__main__':
    main()
