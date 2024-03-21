import 'package:flutter/material.dart';

class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class ViewStateWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTextData;
  final VoidCallback onPressed;

  ViewStateWidget(
      {Key? key,
      this.image,
      this.title,
      this.message,
      this.buttonText,
      required this.onPressed,
      this.buttonTextData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle =
        Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey);
    var messageStyle = titleStyle?.copyWith(
        color: titleStyle.color?.withOpacity(0.7), fontSize: 14);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        image ?? Icon(Icons.error, size: 80, color: Colors.grey[500]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? '页面错误',
                style: titleStyle,
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
                child: SingleChildScrollView(
                  child: Text(message ?? '', style: messageStyle),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ViewStateButton(
            child: buttonText,
            textData: buttonTextData,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}

/// ErrorWidget
class ViewStateErrorWidget extends StatelessWidget {
  final String error;
  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget({
    Key? key,
    required this.error,
    this.image,
    this.title,
    this.message,
    this.buttonText,
    this.buttonTextData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage;
    var defaultTitle;
    var errorMessage = error;
    String defaultTextData = '重新加载';
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? defaultImage,
      title: title ?? defaultTitle,
      message: message ?? errorMessage,
      buttonTextData: buttonTextData ?? defaultTextData,
      buttonText: buttonText,
    );
  }
}

/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget(
      {Key? key,
      this.image,
      this.message,
      this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? const Icon(Icons.refresh, size: 100, color: Colors.grey),
      title: message ?? '暂无数据',
      buttonText: buttonText,
      buttonTextData: '重新加载',
    );
  }
}

/// 页面未授权
class ViewStateUnAuthWidget extends StatelessWidget {
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final VoidCallback onPressed;

  const ViewStateUnAuthWidget(
      {Key? key,
      this.image,
      this.message,
      this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? ViewStateUnAuthImage(),
      title: message ?? '未授权',
      buttonText: buttonText,
      buttonTextData: '登录',
    );
  }
}

/// 未授权图片
class ViewStateUnAuthImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'loginLogo',
      child: Image.asset(
        'login_logo.png',
        width: 130,
        height: 100,
        fit: BoxFit.fitWidth,
        color: Theme.of(context).colorScheme.secondary,
        colorBlendMode: BlendMode.srcIn,
      ),
    );
  }
}

/// 公用Button
class ViewStateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final String? textData;

  const ViewStateButton({required this.onPressed, this.child, this.textData})
      : assert(child == null || textData == null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: child ??
            Text(
              textData ?? '重试',
            ),
      ),
      onTap: onPressed,
    );
  }
}
