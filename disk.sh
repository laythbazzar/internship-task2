d=$(date +"%Y-%m-%d-%H:%M")
#uSum=0

echo "   <p>-------------------------------------<p>" >> /root/task2/data/DiskDataLog
echo "   <p>$d<p>" >> /root/task2/data/DiskDataLog
df -m --total |awk '{printf"\t<p> %s\t %s\t %s <p>\n",$1,$3,$4}'>> /root/task2/data/DiskDataLog

#echo "   <p>-------------------------------------<p>" >> /var/www/html/Disk.html
#echo "   <p>$d<p>" >> /var/www/html/Disk.html
#df -m --total |awk '{printf"\t<p> %s\t %s\t %s <p>\n",$1,$3,$4}'>>/var/www/html/Disk.html

#usedSum=$(cat /var/www/html/Disk.html| grep total |awk 'BEGIN {usedSum=0} {usedSum=usedSum+$2} END {print usedSum}')
#availSum=$(cat /var/www/html/Disk.html| grep total |awk 'BEGIN {availSum=0} {availSum=availSum+$3} END {print availSum}')
#sed -i '2i ${uSum}' /var/www/html/Disk.html

cp /root/task2/header.html /var/www/html/Disk.html


cat /root/task2/data/DiskDataLog| grep total |awk 'BEGIN {usedSum=0;availSum=0;counter=0} {usedSum=usedSum+$3;availSum=availSum+$4;counter=counter+1} END {printf"\t<p> average used: %s\t average free: %s <p>\n",usedSum/counter,availSum/counter}'>> /var/www/html/Disk.html

cat /root/task2/data/DiskDataLog >> /var/www/html/Disk.html

echo "</body>" >>/var/www/html/Disk.html
echo "</html>" >>/var/www/html/Disk.html
#cat /root/task2/Diskdatalog| grep total |awk 'BEGIN {availSum=0} {availSum=availSum+$3} END {print availSum}'>>
#sed -i '2i ${uSum}' /var/www/html/Disk.html

#sed '1 s/^/total\in/' /var/www/html/Disk.html
#df -m --total |awk 'END {print $2 }'> /root/task2/data/Disk-$d
#echo "$usedSum $availSum"
