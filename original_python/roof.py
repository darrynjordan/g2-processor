#!/usr/bin/env python

"""
=========================================================
FILE NAME: roof.py
DESCRIPTION:
RoofSAR integration script.

VERSION/AUTHOR/DATE : 1.0 / Richard Lord / 22-06-2001
=========================================================
"""

import sys, os

if (len(sys.argv) != 2) or (sys.argv[1] == '--help'):
    print """    
Usage: roof.py [roofsar_config_file_name]

To create a RoofSAR configuration template:
Usage: roof.py --template
"""
    sys.exit()
elif len(sys.argv) == 2 and sys.argv[1] == '--template':
    cmd = 'g2roof -tmpl'
    os.system(cmd)
    sys.exit()


cmd = 'g2roof ' + sys.argv[1]
if os.system(cmd) != 0:
    print """
Error: RoofSAR integration was unsuccessful!
"""
    sys.exit(1)
else:
    cmd = 'gedit proc.cfg'
    os.system(cmd)
    cmd = 'g2.py proc.cfg'
    os.system(cmd)

