#!/usr/bin/python

import sys

# ---------------------------
#
# Parse command-line options
#
# - - - - - - - - - - - - - - 
# ===========
# = = = = = = = = 


#print sys.argv
#print len(sys.argv)

#print '%d %s' % (0, sys.argv[0])
#print '%d %s' % (1, sys.argv[1])
#print '%d %s' % (2, sys.argv[2])


trans_tabl_fname = sys.argv[1]
seq_fname        = sys.argv[2]
codonlen         = 3


#print "Translation Table: %s" % trans_tabl_fname
#print "Sequence Table: %s" % seq_fname


#####################
#
# Read translation table into a Python dictionary
#
#####################


transtable = {}
transtable ["TA"] = "*"

tfile = open(trans_tabl_fname, "r")
for line in tfile: 
#	print line.strip()
	linearr = line.split()
#	print linearr
	codon = linearr[0]
	codonlen = len(codon)
	aa    = linearr[1]
#	print "codon: %s, aa: %s" % (codon, aa)
	transtable[codon] = aa
tfile.close()

"""
for codon in transtable.keys():
	print "%s -> %s" % (codon,transtable[codon])
"""

#####################
#
# Read sequence data in FASTA format and 
# translate to amino acids using the
# translation table
#
#####################


seqf = open(seq_fname, "r")
line = seqf.readline()
while line:
	if line[0] == ">":
		id = line[1:len(line)].strip()
		seq = ""
		line = seqf.readline()
		while line and line[0] != ">":
			seq += line.strip()
			line = seqf.readline()
#		print "%s %s" % (id, seq)

		"""Now translate the codons to aa"""
#		print range(0,len(seq),codonlen)
		sys.stdout.write(">%s\n" %  id)
		for i in range(0,len(seq),codonlen):
			codon = seq[i:i+codonlen]
			aa = transtable[codon]
			sys.stdout.write("%s " % aa)
#			print "%s %s" % (codon, aa)
		sys.stdout.write("\n")
seqf.close()

print('\n')
