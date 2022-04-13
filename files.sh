#!/bin/bash

for i in $(seq 1 3) # 从 1 到 100，连续整数

do
cd /Users/juuuz/demo/platform-login
pwd
#time=$(date "+%Y%m%d-%H%M%S")
#echo "${time}"
#filename=test_lj_"$time"
filename=test_lj_$i
#touch "$filename".txt
#echo "hello,$filename" > $filename.txt
echo ${filename}

git checkout ${filename}
sed -i -e 's/^/ababbaiueghasighszadfawfewafarsgasadfwsaeggraegbaegrbegghrgadrgh/' ${filename}.txt

git add .
git commit -m "提交${i}次"
git push --set-upstream  origin ${filename}

done



# sed -i  's/^/aaaa/' text.txt