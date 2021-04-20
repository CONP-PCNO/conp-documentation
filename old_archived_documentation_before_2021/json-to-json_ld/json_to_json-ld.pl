#!/usr/bin/perl
#
#  json_to_json-ld.pl - reading in CONP/NeuroHub DATS JSON files and updating them to JSON-LD format
#                     - EOB - Nov 01 2019
#
# usage: json_to_json-ld.pl $reference_filename $in_json_filename $out_jsonld_filename
#
########################################

$reference_filename   = $ARGV[0];
$in_json_filename     = $ARGV[1];
$out_jsonld_filename  = $ARGV[2];

# read in reference data

%output_types;
%output_schemas;

open (IN_REF, "$reference_filename") || die "Can't open $reference_filename to read\n";

while ($line = <IN_REF>) {
    chomp ($line);
    $line =~ /(.*?)\t(.*?)\t(.*)/;
    $output_types{$1}   = $2;
    $output_schemas{$1} = $3;
}

close IN_REF;

# read input JSON file

@in_json = ();

open (IN_JSON, "$in_json_filename") || die "Can't open $in_json_filename to read\n";

$in_json_linecount = 0;
while ($line =<IN_JSON>) {
    chomp($line);
    $in_json[$in_json_linecount] = $line;
    ++$in_json_linecount;
}

close IN_JSON;

# and write out, adding schema and type lines where apt

open (OUT_JSONLD, ">$out_jsonld_filename") || die "Can't open $out_jsonld_filename to write\n";

$counter = 0;
while ($counter < $in_json_linecount) {
    if ($in_json[$counter] =~ /"(.*?)":/) {     # if there is an entity in the line
        $entity = $1;
        print "$entity\n";
        if(exists($output_types{$entity})) {    # see whether that entity has schema and type defined
            until ($in_json[$counter] =~ /\{/) {   # print out everything until the next {
                print OUT_JSONLD $in_json[$counter]."\n";
                ++$counter;
            }
            $in_json[$counter] =~ /^(\t*?)\S/;    # read the indentation level
            $indent = $1."\t";                    # and add one
		
print "$entity||$output_types{$entity}||$output_schemas{$entity}\n";

            print OUT_JSONLD $in_json[$counter]."\n";
            $schema_line = $indent.'"@id": "'.$output_schemas{$entity}.'",';
            print OUT_JSONLD $schema_line."\n";
            $type_line   = $indent.'"@type": "'.$output_types{$entity}.'",';
            print OUT_JSONLD $type_line."\n";
        }
        else {
            print OUT_JSONLD $in_json[$counter]."\n";
        }
    }
    else {
        print OUT_JSONLD $in_json[$counter]."\n"; # this repetition is not elegant!
    }
    ++$counter;
}

close OUT_JSONLD;

exit();
