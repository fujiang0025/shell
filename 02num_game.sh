#!/bin/bash
#猜数字游戏
num=$[RANDOM%100+1]
while :
do

	read -p "计算机生成了一个100以内的数字，你猜: " cat
	echo "num=$num,#为了测试"
        if [ $cat -eq $num ];then
	    echo " 恭喜你，猜对了 "
            break
        elif [ $cat -le $num ];then
	    echo "太小了"
        else
	    echo "太大了"
	fi
done
