## typecho-docker
每天凌晨3点定时打包typecho仓库最新代码为docker镜像

## 快速使用
```
cd /home/
git clone https://github.com/odyf/typecho-docker.git
docker-compose up -d
chown -R www-data:www-data typecho/
```
访问 ```http://ip:8001```



## 额外教程

### docker安装阿里源国内安装
```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
### docker-compose国内源安装（更新了替换版本号）
```
curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```