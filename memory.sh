d=$(date +"%Y-%m-%d-%H:%M")

echo "   <p>-------------------------------------<p>" >> /root/task2/data/MemoryDataLog
echo "   <p>$d<p>" >> /root/task2/data/MemoryDataLog
free -m --total |awk '{printf"\t<p> %s\t %s\t %s <p>\n",$1,$2,$3}'>> /root/data/task2/MemoryDataLog

cp /root/task2/header.html /var/www/html/Memory.html


cat /root/task2/data/MemoryDataLog| grep Total |awk 'BEGIN {usedSum=0;availSum=0;counter=0} {usedSum=usedSum+$3;availSum=availSum+$4;counter=counter+1} END {printf"\t<p> average used:  %s\t average free: %s <p>\n",usedSum/counter,availSum/counter}'>> /var/www/html/Memory.html

cat /root/task2/data/MemoryDataLog >> /var/www/html/Memory.html

echo "</body>" >>/var/www/html/Memory.html
echo "</html>" >>/var/www/html/Memory.html
