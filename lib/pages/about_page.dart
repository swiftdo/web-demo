import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_demo/pages/template_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: Container(
        color: Colors.white,
        child: MarkdownWidget(
          data: _aboutme,
          padding: EdgeInsets.only(bottom: 50, left: 16, right: 16, top: 16),
          config: MarkdownConfig(
            configs: [
              LinkConfig(
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
                onTap: (url) {
                  launch(url);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

const _aboutme = '''
# 关于 OldBirds

建立本站的初衷是想在学习 Flutter for web 的时候，能够产出成果，一来可以体验 Flutter 在 web 端的开发效率，二来可以将自己微信小程序的内容通过 web 端展示出来，方便读者在 pc 端阅读。

OldBirds 是一个微信公众号。早期没怎么去管理，荒废了挺久。后面代码写多了，文章看多了，觉得文字上的总结不可或缺，**输入必须要有输出**。所以在 2020 年开始正式开启公众号写作之旅。

## 介绍自己：

本人 2014年10月到2018年中，先后在上海、深圳就职（公司倒闭居多），从事 iOS 开发。
18 年中，因一些原因来南昌工作，当然还是做 iOS 开发（薪水惨不忍睹）。
2019年，开始转向 Flutter 开发，前期走 Flutter 嵌入原生方案，需要写很多原生插件，恶补了 Android 知识，当然也还是写插件的水平。
现基本上用 Flutter 开发项目（后续的博文也会偏向 Flutter）。

这几年，前端的 React、Vue、小程序都捣腾了一段时间，当然还有 Python。对技术的好奇心至今未减。
自己也不是聪明人，在学这方面，走了也走了很多曲线，浪费了挺多时间的。所以想在自己采坑的地方记录下来，形成专题，分享给那些需要的人————这也是 OldBirds 现在做、将来做、一直做的事情。

**怎么联系到我？**

您就扫左边二维码，关注公众号，里面有微信联系方式，可入微信群。

* [swiftdo](https://github.com/swiftdo)
* [个人博客](https://oldbird.run/)

**后面规划**
* 将会进一步探索 Flutter for Web，总结出系列最佳实践。
* 学习学习再学习
* 写出更多优质文章
* 认识更多优秀的你们
* 做减法

## 本站点源码
* [swiftdo/web-demo](https://github.com/swiftdo/web-demo)

## 个人学习经验

* 保持技术好奇心，多读书
* 输入必须要有输出，输出必须是个成品
* 必须熟练掌握稳定的工具，尽早认知到这点，会节省你很多宝贵的时间
''';
