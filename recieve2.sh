#!/bin/bash
whatever=`ncat -l 42069`

user=`echo $whatever |cut -d: -f1`
pass=`echo $whatever |cut -d: -f2`
num=`echo $whatever |cut -d: -f3`

echo $user
echo $pass
echo $num
echo $whatever

for i in `seq 1 $num`; do
casperjs killer2.js --user=$user --pass=$pass #> /dev/null;
done

