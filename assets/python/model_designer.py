# -*- coding: utf-8 -*-
import json

json_file = "../math-magik-lpp.json"

def load_json():
    with open(json_file) as fin:
        jdata = json.load(fin)

    lpp_data = jdata["lpp"]

    for item in lpp_data:
        print(item["name"])

load_json()
