#方案一，for循环
#!/bin/bash
for i in {1..254}
do
 ping -c2 -i0.3 -W1 172.16.12.$i &> /dev/null
 if [ $? -eq 0 ];then
  echo "172.16.12.$i is up"
 else
  echo "172.16.12.$i is down"
 fi
done
#-------------------------------------------------------------------------#
#方案二，while循环
#!/bin/bash
#i=1
#while [ $i -le 254 ]
#do
#	ping -c2 -i0.3 -W1 172.16.12.$i &> /dev/null
#	if [ $? -eq 0 ];then
#		echo "172.16.12.$i is up"
#	else
#		echo "172.16.12.$i is down"
#	fi
#	let i++
#done
