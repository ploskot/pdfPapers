#!/bin/env python
# installation: pip install summa

from summa import keywords

with open('S2.txt', 'r') as file:
    full_text = file.read()

    xkeywords = keywords.keywords(full_text, scores=True)
    for kw,v in xkeywords[:20]:
        # print("%.5f %s" % (v,kw))
        print("%s" % kw)


