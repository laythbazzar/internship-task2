d=$(date +"%Y-%m-%d-%H:%M")

echo "   <p>-------------------------------------<p>" >> /root/task2/data/CPUDataLog
echo "   <p>$d<p>" >> /root/task2/data/CPUDataLog
mpstat -P ALL |awk 'NR>1 {printf"\t<p> %s\t %s <p>\n",$3,$4}'>> /root/task2/data/CPUDataLog

cp /root/task2/header.html /var/www/html/CPU.html


cat /root/task2/data/CPUDataLog| grep all |awk 'BEGIN {availSum=0.0;counter=0} {usedSum=usedSum+$3;counter=counter+1} END {printf"\t<p> average CPU usage:  %s<p>\n",usedSum/counter}'>> /var/www/html/CPU.html

cat /root/task2/data/CPUDataLog >> /var/www/html/CPU.html

echo "</body>" >>/var/www/html/CPU.html
echo "</html>" >>/var/www/html/CPU.html
