#!/bin/python3
import taglib
import sys

if (len(sys.argv)) != 3:
    raise ValueError('Please pass two audio files')

origin = taglib.File(sys.argv[1])
dest = taglib.File(sys.argv[2])
for tag in origin.tags:
    dest.tags[tag] = origin.tags[tag]
if len(origin.unsupported) > 0:
    for tag in origin.unsupported:
        if tag == "----:com.apple.iTunes:albumartists":
            dest.tags['ALBUMARTISTS'] = origin.tags['ALBUMARTIST']
        elif tag == "----:com.apple.iTunes:originalyear":
            dest.tags['ORIGINALYEAR'] = origin.tags['DATE'][0][:4]
dest.save()
