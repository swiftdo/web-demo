# web_demo

Flutter 2.0 快速构建的一个站点样例

* 在线预览：[http://webdemo.loveli.site](http://webdemo.loveli.site)
* github ci构建的版本：[http://webdemo.oldbird.run](http://webdemo.oldbird.run), hash 路由

更多精彩，请关注官方微信公众号: **Oldbirds**


## 安装

0. git clone https://github.com/swiftdo/web-demo
1. 安装 fvm 工具: [leoafarias/fvm](https://github.com/leoafarias/fvm)
2. 运行 

   ```sh
   $ cd web-demo
   $ fvm install
   $ fvm flutter run -d Chrome
   ```
   有跨域问题，可关注配套课程解决

## 配套课程

* [1. 网络请求篇](https://juejin.cn/post/6940962419355156494)
* [2. 跨域篇](https://juejin.cn/post/6941744845803225102)
* 3. 状态管理篇
* 4. 路由篇
* 5. url 策略篇
* 6. 上线部署篇
    * [在 Github 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t5-flutter-web-deploy.html#flutter-web)
    * [在 Docker 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t6-docker-web-deploy.html)


## web 开发存在的一些问题
### 包体积太大
[【编译渲染项】](https://flutter.cn/docs/development/tools/web-renderers)
### 手机端滑动太卡

### 中文显示有问题
webgl 不能渲染文本，所以在加载谷歌字体

### 页面刷新，无法访问

跟 url 策略有关
 * HashUrlStrategy，hash 路由，带有`#`, 可直接 github 静态托管
 * PathUrlStrategy, histroy 路由，也可以直接github托管，但是刷新页面会出问题，此类，需要 nginx 做个配置，单页面实际上只有一个页面index.html，因此将所有的页面都rewirte到index页面，即可完成配置

   ```nginx
   location @router {
       rewrite ^.*$ /index.html break;
   } 
   ```
