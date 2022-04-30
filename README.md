<!--
 * @Description: Editor's info in the top of the file
 * @Author: p1ay8y3ar
 * @Date: 2021-10-10 23:45:54
 * @LastEditor: p1ay8y3ar
 * @LastEditTime: 2021-10-13 00:48:49
 * @Email: p1ay8y3ar@gmail.com
-->
# luci-app-webguide ![hope useful](https://visitor-badge.glitch.me/badge?page_id=luci-app-webguide)
一个简单的openwrt导航页luci插件 

## 设置示例

<details>
<summary>以uhttpd为web服务器的设置 <---点这里</summary>
   
   
1. web服务器uhttpd设置
   uhttpd添加一个新的web服务,示例配置如下图所示：
   **基本设置**只需要设置http端口
   ![](./imgs/uhttpd1.png)
   **高级设置**文档根目录一定设置为`/www/webguide`
   ![](./imgs/uhttpd2.png)
   保存修改后**重启**.
    推荐使用80端口,可先行修改MIAN的端口为其他端口

2. [下载](https://github.com/p1ay8y3ar/luci-app-webguide/releases)并上传插件到op安装,如果服务栏目没有出现`WebGuide`,请尝试重启op或者删一下LuCi缓存`rm -rf /tmp/luci-*`.


</details>

<details>
<summary>以nginx为web服务器的设置     <---点这里</summary>
   
   
示例openwrt:[kiddin9版本的op](https://github.com/kiddin9/OpenWrt_x86-r2s-r4s)
   
1. [下载](https://github.com/p1ay8y3ar/luci-app-webguide/releases)并上传插件到op安装,安装成功之后使用终端删除一下luci缓存  `rm -rf /tmp/luci-*`. 
2. nginx设置
   - `vim /etc/config/nginx` 把80改成81，这样访问路由器后台就是`x.x.x.x:81`, 运行命令`/etc/init.d/nginx reload` 重载配置文件，`/etc/init.d/nginx restart`重启nginx
   - cd 到 `/www`目录,依次运行 `mv index.html index.html.old`, `ln -s /www/webguide/index.html index.html`,`ln -s /www/webguide/index.js index.js`
   - 安装python3，依次运行`opkg install python3-base`,`opkg install python3-pip`
   - 添加一个nginx的配置文件, `cd /etc/nginx/conf.d`,新建一个配置文件，比如叫`guide.conf`,复制下面内容 
   ```
   server {
    
    listen 80;
    listen [::]:80;
    server_name  _;
    charset utf-8;
    location / {
        root /www/webguide;
        index index.html;
        autoindex on;
        autoindex_exact_size off;
        autoindex_localtime on;
        add_header Cache-Control no-store;
        }
   }
   ```
   
   保存后运行`/etc/init.d/nginx reload` 和 `/etc/init.d/nginx restart`
   

</details>

   
**WebGuide**配置
   
配置界面如下
![](./imgs/webguide1.png)
   
url要填写完整的协议，比如`https://www.baidu.com`
   
主要是图标文件的设置:推荐使用阿里巴巴旗下的[iconfont](https://www.iconfont.cn/)
 选中心仪的图标
   
 ![](./imgs/webguide2.png)

 复制svg代码粘贴到设置界面即可
   
 ![](./imgs/webguide3.png)

 底部和主页都至少配置一个,大概的显示效果如下:
   
 ![](./imgs/webguide4.png)

html页面来自[nas-home-page](https://github.com/blqw/nas-home-page),再次感谢！
