#!/usr/bin/env python3

import sys
import json

'''
Quick script to compare to JSON files that might not necessarily be in the same order.
Input
'''


if __name__ == "__main__":
    _, ref_filename, test_filename = sys.argv
    with open(ref_filename, "r") as ref, open(test_filename, "r") as test:
        ref_json = json.load(ref)
        test_json = json.load(test)

        print("JSON FILES ARE EQUAL." if sorted(ref_json.items()) == sorted(test_json.items()) \
                else "JSON FILES ARE NOT EQUAL.")
        sys.exit()

    sys.exit("FILES COULD NOT BE OPENED.")

