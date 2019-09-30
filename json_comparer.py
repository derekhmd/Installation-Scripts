#!/usr/bin/env python3

import sys
import json

'''
Quick script to compare to JSON files that might not necessarily be in the same order.
Input
'''

def ordered(obj):
    if isinstance(obj, dict):
        return sorted((k, ordered(v)) for k, v in obj.items())
    if isinstance(obj, list):
        return sorted(ordered(x) for x in obj)
    else:
        return obj


if __name__ == "__main__":
    _, ref_filename, test_filename = sys.argv
    with open(ref_filename, "r") as ref, open(test_filename, "r") as test:
        ref_json = json.load(ref)
        test_json = json.load(test)

        print("JSON FILES ARE EQUAL." if ordered(ref_json) == ordered(test_json) \
                else "JSON FILES ARE NOT EQUAL.")
        sys.exit()

    sys.exit("FILES COULD NOT BE OPENED.")

