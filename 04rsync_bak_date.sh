#!/bin/bash
#备份日期,年月日时分
DATA=`date +"%F-%H-%M"`
#备份源主机IP提取
IP_Addr=`ifconfig |grep netmask| awk '{print $2}'|grep -v 127.0.0.1`
#键盘输入需要备份使用的用户和主机
read -p "请你输入需要备份的源目录（形式：/home): " rsync_s
read -p "请你输入备份使用的目的用户:" user_name
read -p "请你输入备份使用的主机:" host_name
read -p "备份到哪里（路径输入,格式：home/）：" Dest_path
Dest_Dir=$(hostname)_${IP_Addr}_${DATA}.bak
ssh $user_name@$host_name rm -rf $Dest_path/*$IP_Addr* && mkdir $Dest_path/$Dest_Dir
rsync --delete -a $rsync_s/ $user_name@$host_name:$Dest_path/$Dest_Dir/
#加入计划任务
if ! grep -q '04rsync_bak_date.sh' /etc/crontab
then
    echo "0 0 * * * /shell_100/04rsync_bak_date.sh" >> /etc/crontab
fi

