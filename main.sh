account="Your Account"
passwd="Your Password"
logdir="~/drcom.log"

# 获取登陆状态
response=$(curl -s "http://172.30.255.42/drcom/chkstatus?callback=dr1002")
# 检查响应中是否包含"result":1（是否已经登陆）
if [[ $response != *"result\":1"* ]]; then
    # 发送登陆请求
    login_response=$(curl -s "http://172.30.255.42:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C0%2C$account&user_password=$passwd&wlan_ac_ip=&wlan_ac_name=&jsVersion=4.1.3&terminal_type=1&lang=zh-cn&v=4121&lang=zh")
    echo "Login response: $login_response" >> /root/test.log
else
    echo "已经登陆" >> /root/test.log
fi
