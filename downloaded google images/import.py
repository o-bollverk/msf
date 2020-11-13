import sys
import urllib.request
from csv import reader
import os.path

csv_filename = sys.argv[1]
i=0
path = str(csv_filename)+ '/'
os.mkdir(path)
with open(csv_filename+".csv".format(csv_filename), 'r') as csv_file:
    for line in reader(csv_file):
    	if len(line) != 0:
    		i+=1
    		try:
    			urllib.request.urlretrieve(line[0], path + str(csv_filename) + str(i) + ".jpg")
    		except:
    			continue
    	
