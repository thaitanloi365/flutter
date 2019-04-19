import 'package:flutter/material.dart';
import 'dart:async';

enum ToastType {
  Error,
  Success,
  Info,
  Warn,
}

class Toast extends StatefulWidget {
  final String title;
  final String message;
  final Duration duration;
  final ToastType type;
  final VoidCallback onClose;
  Toast(
      {Key key,
      @required this.title,
      @required this.message,
      this.duration = const Duration(seconds: 3),
      this.type = ToastType.Info,
      this.onClose})
      : super(key: key);

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> translate;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            this.setState(() {});
          });
    translate = Tween(begin: Offset(0, -0.2), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _controller.forward();

    Future.delayed(widget.duration).then((onValue) {
      _controller.reverse();
      if (widget.onClose != null) {
        widget.onClose();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  buildIcon() {
    switch (widget.type) {
      case ToastType.Warn:
        return Icon(Icons.warning, color: Colors.orangeAccent, size: 48);
      case ToastType.Error:
        return Icon(Icons.error, color: Colors.redAccent, size: 48);
      case ToastType.Info:
        return Icon(Icons.info, color: Colors.blueAccent, size: 48);
      case ToastType.Success:
        return Icon(Icons.info, color: Colors.greenAccent, size: 48);
    }
  }

  buildTitle(BuildContext context) {
    final style =
        Theme.of(context).textTheme.title.copyWith(color: Colors.white);
    return Padding(
        child: Text(
          widget.title,
          style: style,
        ),
        padding: EdgeInsets.only(top: 30, bottom: 10));
  }

  buildMessage(BuildContext context) {
    final style =
        Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white);
    return Padding(
        child: Text(
          widget.message,
          style: style,
        ),
        padding: EdgeInsets.only(bottom: 10));
  }

  buildToast(BuildContext context) {
    return Wrap(children: <Widget>[
      Material(
        color: Colors.redAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(alignment: Alignment.bottomCenter, child: buildIcon()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTitle(context),
                buildMessage(context),
              ],
            )
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: translate, child: buildToast(context));
  }
}
