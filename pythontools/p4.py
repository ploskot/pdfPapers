#!/bin/env python
# installation: pip install keybert

from keybert import KeyBERT

kw_model = KeyBERT(model='all-mpnet-base-v2')

with open('S5.txt', 'r') as file:
    full_text = file.read()

    keywords = kw_model.extract_keywords(full_text, 
                                         keyphrase_ngram_range=(1, 3), 
                                         stop_words='english', 
                                         highlight=False,
                                         top_n=20)
    for kw,v in list(keywords):
        # print("%.4f %s" % (v,kw))
        print(kw)
