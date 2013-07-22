export USER=`whoami`

for FILE1 in "$@"
do
   omf-5.4 load -i baseline.ndz -t $FILE1
done

