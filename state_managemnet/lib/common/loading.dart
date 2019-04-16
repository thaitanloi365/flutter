import 'package:flutter/material.dart';

showLoading(
    {@required BuildContext context,
    @required String message,
    String title = null,
    VoidCallback onShow = null}) {
  Widget loading = Center(
    child: CircularProgressIndicator(),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return loading;
    },
  );
}

hideLoading({@required BuildContext context, VoidCallback onHide = null}) {
  Navigator.of(context).pop();
  if (onHide != null) {
    onHide();
  }
}
