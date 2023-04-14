pathName=$1
iters=$2

echo "Payload to encode: $pathName"
echo "Number of iterations: $iters"

echo "Generating iteration #1"
base64code=$( gzip -c -9 $pathName | base64 -w0 )
for (( i=2; i<=$iters; i++ )); do
    echo "Generating iteration #$i"
    base64code_=$( echo `echo $base64code | base64 -w0 `)
    base64code=$base64code_
done

outfile=$pathName"."$iters"b64"
echo "New encoded file generated as $outfile"
echo $base64code > $outfile 

#Not working in WSL
#echo $base64code | xclip -i