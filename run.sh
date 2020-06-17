
user=$1
pwd=$2

user_list=()
pwd_list=()

IFS=","

for u in ${user[*]}
do
user_list[${#user_list[*]}]=${u}
done

for p in ${pwd[*]}
do
pwd_list[${#pwd_list[*]}]=${p}
done

user_num=${#user_list[*]}
pwd_num=${#pwd_list[*]}

if [ $user_num != $pwd_num ];then
echo "账号和密码个数不对应"
exit 1
else
echo "共有 $user_num 个账号，即将开始签到"
fi

for ((i=0;i<=$user_num;i++))
do
python C189Checkin.py --user ${user_list[$i]} --pwd ${pwd_list[$i]}
done
