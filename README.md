# web_demo

Flutter 3.19.3 快速构建的一个站点样例，长期维护。

在线预览：[https://webdemo.oldbird.run](https://webdemo.oldbird.run)

## 安装

1. git clone https://github.com/swiftdo/web-demo
2. 安装 fvm 工具: [leoafarias/fvm](https://github.com/leoafarias/fvm)

   ```sh
   $ cd web-demo
   $ fvm install
   $ fvm flutter run -d Chrome
   ```

## 支持运行到 macos 上

```
$ cd web-demo
$ fvm flutter run -d macos
```

## 功能

* [x] 文章的添加
* [x] 文章详情
* [x] 文章搜索
* [x] 文章管理，添加和删除
* [ ] 分类管理，添加和删除
* [ ] 文章的阅读数
* [ ] 站点UI设计修改
* [ ] 添加站点的留言功能
* [ ] 站点字体修改?
* [ ] 文章是否需要添加评论功能？
* [ ] 人员管理，是否要支持多用户?

## 配套课程

- [1. 网络请求篇](https://juejin.cn/post/6940962419355156494)
- [2. 跨域篇](https://juejin.cn/post/6941744845803225102)
- 3.状态管理篇: [Provider 中文文档](https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md)
- 4.路由篇 [go_router](https://gorouter.dev/)
- 5.url 策略篇：[配置 Web 应用的 URL 策略](https://flutter.cn/docs/development/ui/navigation/url-strategies)
- 6.上线部署篇
  - [在 Github 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t5-flutter-web-deploy.html#flutter-web)
  - [在 Docker 上部署一个 Flutter Web 应用](https://oldbird.run/flutter/t6-docker-web-deploy.html)
- [7.自定义启动加载页](https://oldbird.run/flutter/flutter-web-launch-page.html)

## web 开发存在的一些问题

### 1.包体积太大

可通过编译选项控制，[【编译渲染项】](https://flutter.cn/docs/development/tools/web-renderers)

### 2.中文显示有问题

flutter bug, 解决进度可关注：[Load fonts as soon as detecting browser locale](https://github.com/flutter/flutter/issues/77023)

编译渲染项设置为 html，不会出现该问题。

### 3.页面刷新，或者指定 url 无法打开页面

跟 url 策略有关

- HashUrlStrategy，hash 路由，带有`#`, 可直接 github 静态托管
- PathUrlStrategy, history 路由，也可以直接 github 托管，但是刷新页面会出问题，此类，需要 nginx 做个配置，单页面实际上只有一个页面 index.html，因此将所有的页面都 rewirte 到 index 页面，即可完成配置

```nginx
location @router {
    rewrite ^.*$ /index.html break;
}
```

### 4. SEO 问题

建立一个 seo 友好的网站意味着谷歌和其他搜索引擎可以高效地抓取网站上的每个页面，有效地解释内容，并将其索引到数据库中。一旦编入索引，他们就可以根据用户搜索的主题向用户提供最相关、最有价值的网页。

Flutter Web 的 SEO 能力支持不友好。

可关注该问题 [How Manage SEO In flutter web?](https://stackoverflow.com/questions/71634738/how-manage-seo-in-flutter-web)


## Stargazers over time
[![Stargazers over time](https://starchart.cc/swiftdo/web-demo.svg?variant=adaptive)](https://starchart.cc/swiftdo/web-demo)

