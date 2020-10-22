#!/bin/python

import sys
import json

import matplotlib.pyplot as plt


if __name__ == "__main__":

  json_file = sys.argv[1]

  with open(json_file) as f:
    data = json.load(f)
    date = json_file.split('.')[0]

    quantiles = data['quantiles']    
    for q in quantiles:
      plt.plot(quantiles[q], label=q)


    plt.ylabel('thresholds')
    plt.xlabel('# days from %s' % date)
    plt.legend(loc="upper right")
    plt.show()

