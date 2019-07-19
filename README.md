ReadMe
一、基本环境搭建
1.创建用户并赋予sudo权限（需root）
./createuser.sh

2.中转机初始化jenkins、ansible环境
使用tq用户登录并执行./preinit.sh

3.分发密钥，首次需要输入tq密码：“tq”
ssh-copy-id -i ~/.ssh/id_rsa.pub tq@主机1_IP
ssh-copy-id -i ~/.ssh/id_rsa.pub tq@主机2_IP

4.部署本地git服务器并创建代码库与Jenkinsfile关联
./mygit.sh

5配置主机列表/etc/ansible/hosts
[prd]
主机1_IP
[test]
主机2_IP
[deploy]
localhost

6.应用首次部署
ansible-playbook yaml/build.yaml 


7.在Jenkins中创建Pipelines
  （1）浏览器访问http://ip:8080
  （2）登录jenkins并按照提示安装推荐插件
  （3）创建Pipelines，构建触发器选择轮询 SCM
  （4）pipelines选择Git并配置Repository URL：tq@ip:/home/tq/hub/hello.git

8.git提交将触发Pipelines