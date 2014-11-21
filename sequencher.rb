#!/usr/bin/ruby

=begin
        Sequencher.rb
        Copyright © 2014 Andres Breton

        Sequence Cruncher: Returns reverse complement, complement, and/or reverse sequence
 
        ** Additional tools coming **
=end



##  USER
if ARGV.length == 0
    print("\nSequencher returns reverse complement, complement, and/or reverse sequence\n")
    print("Example:\n$ sequencher.pl ATGCATG\n")
    print("You can also add flags such as '-rc', '-c', '-r' to return only reverse complement, complement, or reverse sequence\n")

end

## CONSTANTS
$nucls = ['A','T','G','C','U']

DNAcomp = {
'A' => 'T',
'T' => 'A',
'C' => 'G',
'G' => 'C',
 }

RNAcomp = {
'A' => 'U',
'U' => 'A',
'C' => 'G',
'G' => 'C',
 }

def reverseComp(sequence)
    sequence = sequence.reverse
    letters = sequence.split(//)
    print("\nReverse Complement Sequence (5'->3'): ")
    for letter in letters
        if letter == 'A'
            print $nucls[1]
            elsif letter == 'T' || letter == 'U'
            print $nucls[0]
            elsif letter == 'G'
            print $nucls[3]
            elsif letter == 'C'
            print $nucls[2]
            else
            print"N"
        end
    end
end

def complementary(sequence)
    letters = sequence.split(//)
    print("\nComplementary Sequence (3'->5'): ")
    for letter in letters
        if letter == 'A'
            print $nucls[1]
            elsif letter == 'T' || letter == 'U'
            print $nucls[0]
            elsif letter == 'G'
            print $nucls[3]
            elsif letter == 'C'
            print $nucls[2]
            else
            print"N"
        end
    end
end
    
def reverse(sequence)
    sequence = sequence.reverse
    print("\nReverse Sequence (3'->5'): ", sequence)
end

        #print("This is ARGF ", ARGF.argv)

####################################################

if ARGV.length == 1
    $seq = ARGV[0].upcase
    $revseq = ARGV[0].upcase
    reverseComp($revseq)    ## PRINT REVERSE COMPLEMENT
    complementary($seq)     ## PRINT COMPLEMENTARY SEQUENCE
    reverse($revseq)        ## PRINT REVERSE SEQUENCE
    
## DEALS W/ COMMAND LINE PARAMATER'S OPTIONS AND PLACEMENT
elsif ARGV.length > 1
    #print("This is index number of paramater: ", ARGV.index{|x| x == "-rc"})
    ARGV.cycle(1) {|x|
    if x == "-rc"
        ARGV.delete("-rc")
        reverseComp(ARGV[0].upcase)
    elsif x == "-c"
        ARGV.delete("-c")
        complementary(ARGV[0])
    elsif x == "-r"
        ARGV.delete("-r")
        reverse(ARGV[0].upcase)
    end
    }
end


print "\n\n"



