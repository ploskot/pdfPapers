#!/bin/env python
# installation: pip install git+https://github.com/LIAAD/yake

import yake

with open('S5.txt', 'r') as file:
    full_text = file.read()

    kw_extractor = yake.KeywordExtractor(top=20, stopwords=None)
    keywords = kw_extractor.extract_keywords(full_text)
    for kw, v in keywords:
        # print("%.5f %s" % (v,kw))
        print(kw)
        
