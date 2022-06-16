# web_demo

Flutter 3.0 快速构建的一个站点样例，长期维护。

- github ci 构建的版本(每次代码提交，自动构建)：[http://webdemo.oldbird.run](http://webdemo.oldbird.run), 采用 hash 路由策略

更多精彩，请关注官方微信公众号: **Oldbirds**

> 星数达 **100+**, 开源后端代码

## 安装

0. git clone https://github.com/swiftdo/web-demo
1. 安装 fvm 工具: [leoafarias/fvm](https://github.com/leoafarias/fvm)
2. 运行

   ```sh
   $ cd web-demo
   $ fvm install
   $ fvm flutter run -d Chrome --web-port=53794
   ```

## TODO

- [ ] 分类
- [ ] 搜索

## 配套课程

- [1. 网络请求篇](https://juejin.cn/post/6940962419355156494)
- [2. 跨域篇](https://juejin.cn/post/6941744845803225102)
- 3.状态管理篇: [Provider 中文文档](https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md)
- 4.路由篇 [go_router](https://gorouter.dev/)
- 5.url 策略篇：[配置 Web 应用的 URL 策略](https://flutter.cn/docs/development/ui/navigation/url-strategies)
- 6.上线部署篇
  - [在 Github 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t5-flutter-web-deploy.html#flutter-web)
  - [在 Docker 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t6-docker-web-deploy.html)

## web 开发存在的一些问题

### 1.包体积太大

可通过编译选项控制，[【编译渲染项】](https://flutter.cn/docs/development/tools/web-renderers)

### 2.手机端滑动太卡

待解决

### 3.中文显示有问题

flutter bug, 解决进度可关注：[Load fonts as soon as detecting browser locale](https://github.com/flutter/flutter/issues/77023)

### 4.页面刷新，或者指定 url 无法打开页面

跟 url 策略有关

- HashUrlStrategy，hash 路由，带有`#`, 可直接 github 静态托管
- PathUrlStrategy, histroy 路由，也可以直接 github 托管，但是刷新页面会出问题，此类，需要 nginx 做个配置，单页面实际上只有一个页面 index.html，因此将所有的页面都 rewirte 到 index 页面，即可完成配置

```nginx
location @router {
    rewrite ^.*$ /index.html break;
}
```

### 5. SEO 问题

建立一个 seo 友好的网站意味着谷歌和其他搜索引擎可以高效地抓取网站上的每个页面，有效地解释内容，并将其索引到数据库中。一旦编入索引，他们就可以根据用户搜索的主题向用户提供最相关、最有价值的网页。

Flutter Web 的 SEO 能力支持不友好。

可关注该问题 [How Manage SEO In flutter web?](https://stackoverflow.com/questions/71634738/how-manage-seo-in-flutter-web)
