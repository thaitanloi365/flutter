import 'package:flutter/material.dart';
import "modalBase.dart";

class Alert extends ModalBase {
  final String title;
  final String message;
  final VoidCallback onOK;
  final VoidCallback onCancel;

  Alert(
      {@required BuildContext context,
      @required this.message,
      this.title,
      this.onOK,
      this.onCancel})
      : super(context: context, animationType: AnimationType.Grow);

  @override
  show() {
    return super.show();
  }

  buildOkButton() {
    return FlatButton(
      child: Text("OK"),
      onPressed: () {
        hide();
        if (onOK != null) {
          onOK();
        }
      },
    );
  }

  buildCancelButton() {
    if (onCancel == null) {
      return null;
    }

    return FlatButton(
      child: Text("OK"),
      onPressed: () {
        hide();
        onCancel();
      },
    );
  }

  buildAlert() {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(message),
      actions: [
        buildOkButton(),
        buildCancelButton(),
      ],
    );
  }

  @override
  Widget dialogBuilder() {
    return buildAlert();
  }
}
