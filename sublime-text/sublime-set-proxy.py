#!/usr/bin/env python
# Python script to set/unset SublimeText Package Control proxy setting..
# Jim Lawton, 26th April, 2014.

from __future__ import print_function
import os
import os.path
import sys
from optparse import OptionParser
import json

_CFGFILE = ".config/sublime-text-3/Packages/User/Package Control.sublime-settings"


def _getOpts():
    """Parse command line options and arguments."""
    usage = "%prog [options] [proxy-url]"
    parser = OptionParser(usage=usage,
                          description="Update the CMF "
                          "master configuration file.")
    (opts, args) = parser.parse_args()
    opts.proxy = None
    if len(args) > 0:
        opts.proxy = args[0]
    return (opts, args)


def main():
    "Main function."
    opts, args = _getOpts()

    cfgfile = os.path.join(os.getenv("HOME"), _CFGFILE)
    config = {}
    if os.path.exists(cfgfile):
        with open(cfgfile, 'r') as f:
            config = json.load(f)

    if "http_proxy" in config.keys():
        if opts.proxy:
            #print("Setting SublimeText proxy to %s" % opts.proxy)
            config["http_proxy"] = opts.proxy
        else:
            #print("Clearing SublimeText proxy setting")
            del config["http_proxy"]
    else:
        if opts.proxy:
            #print("Setting SublimeText proxy to %s" % opts.proxy)
            config["http_proxy"] = opts.proxy

    with open(cfgfile, 'w') as f:
        json.dump(config, f, indent=8, sort_keys=True)


if __name__ == '__main__':
    main()
    sys.exit(0)
