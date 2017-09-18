
#!/usr/bin/env bash

# 服务器用户
SERVER_USER=(
    [0]='root'
    [1]='root'
    [2]='root'
    [3]='root'
    [4]='root'
    [5]='root'
)

# 服务器地址
SERVER_HOST=(
    [0]='192.168.1.1'
    [1]='192.168.1.2'
    [2]='192.168.1.3'
    [3]='192.168.1.4'
    [4]='192.168.1.5'
    [5]='192.168.1.6'
)

# 服务器端口
SERVER_PORT=(
    [0]='2121'
    [1]='2122'
    [2]='2123'
    [3]='2124'
    [4]='2125'
    [5]='2126'
)

# 服务器密码
SERVER_PASS=(
    [0]='password1'
    [1]='password2'
    [2]='password3'
    [3]='password4'
    [4]='password5'
    [5]='password6'
)

# 服务器说明
SERVER_DESC=(
    [0]='开发服务器'
    [1]='测试服务器'
    [2]='仿真服务器'
    [3]='堡垒服务器'
    [4]='生产服务器'
    [5]='备份服务器'
)

# 服务器密钥
SERVER_KEYS=(
    [0]='密钥文件的绝对路径'
    [1]=NULL
    [2]=NULL
    [3]=NULL
    [4]=NULL
    [5]=NULL
)

# 统计服务器数量
COUNT=${#SERVER_HOST[@]}

# 提示信息函数
function message() {
    printf "| %-05s\t" '序号'
    printf "| %-18s\t" '主机'
    printf "| %-28s\t\n" '说明'

    S='\033[31;1m'
    E='\033[0m'

    for ((i=0; i<$COUNT; i++)); do
        printf "| $S%-05s$E\t" "$i"
        printf "| %-18s\t" "${SERVER_HOST[$i]}"
        printf "| %-28s\t\n" "${SERVER_DESC[$i]}"
    done
}

message

while true; do

    # 让用户选择所需要登陆服务器的所属序号
    read -p '请输入要登陆的服务器所属序号: ' SERVER_NUM

    # 检查输入是否为空或者回车
    if [ ! ${SERVER_NUM} ]; then
        echo '请输入序号'
        continue
    fi

    # 检查输入是否为数字
    if [[ "${SERVER_NUM}" =~ [^0-9]+ ]]; then
        echo '序号必须是数字'
        continue
    fi

    # 检查输入是否有效
    if [[ "${SERVER_NUM}" =~ ^0[0-9]+ ]] || [ ${SERVER_NUM} -ge ${COUNT} ] || [ ${SERVER_NUM} -lt 0 ]; then
        echo '请输入列表中存在的序号'
        continue
    fi

    # 跳出循环
    break
done

# 自动登录函数
function auto_login_ssh() {
    if [ NULL = $5 ]; then
        expect -c "
            set timeout 10;
            spawn -noecho ssh -o StrictHostKeyChecking=no $1@$2 -p $3;
            expect {
                *yes/no* {
                    send yes\r
                    exp_continue
                }
                *password* {
                    send $4\r
                }
            }
            interact
        ";
    else
        expect -c "
            set timeout 10;
            spawn -noecho ssh -o StrictHostKeyChecking=no -i $5 $1@$2 -p $3;
            interact
        ";
    fi

    return 0
}

auto_login_ssh ${SERVER_USER[$SERVER_NUM]} ${SERVER_HOST[$SERVER_NUM]} ${SERVER_PORT[$SERVER_NUM]} ${SERVER_PASS[$SERVER_NUM]} ${SERVER_KEYS[$SERVER_NUM]}
