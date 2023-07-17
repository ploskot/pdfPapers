#!/bin/env python
# installation: pip install multi-rake

from multi_rake import Rake

with open('S5x.txt', 'r') as file:
    full_text = file.read()

    rake = Rake()
    keywords = rake.apply(full_text)
    for kw,v in keywords[:20]:
        # print("%.1f %s" % (v,kw))
        print(kw)

