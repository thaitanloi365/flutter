import 'package:flutter/material.dart';
import 'transition.dart';

// showLoading(BuildContext context) {
//   Widget loading = Center(
//     child: CircularProgressIndicator(),
//   );

//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return loading;
//     },
//   );
// }

// hideLoading(BuildContext context, [VoidCallback onHide]) {
//   Navigator.of(context).pop();
//   if (onHide != null) {
//     onHide();
//   }
// }
enum AnimationType {
  FromLeft,
  FromRight,
  FromBottom,
  FromTop,
  Shrink,
  Grow,
  None
}

abstract class ModalBaseBuilder {
  Widget dialogBuilder();
}

class ModalBase implements ModalBaseBuilder {
  final VoidCallback onClose;
  final VoidCallback onShow;
  final bool barrierDismissible;
  final Color barrierColor;
  final Duration duration;
  final BuildContext context;
  final AnimationType animationType;

  ModalBase(
      {@required this.context,
      this.onClose,
      this.onShow,
      this.barrierColor = const Color.fromARGB(100, 0, 0, 0),
      this.duration = const Duration(milliseconds: 250),
      this.barrierDismissible = false,
      this.animationType = AnimationType.None});

  hide() {
    Navigator.of(context).pop();
    if (onClose != null) {
      onClose();
    }
  }

  show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return dialogBuilder();
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: duration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

  @override
  Widget dialogBuilder() {
    return Center(child: CircularProgressIndicator());
  }

  _showAnimation(animation, secondaryAnimation, child) {
    switch (animationType) {
      case AnimationType.FromRight:
        return AnimationTransition.fromRight(
            animation, secondaryAnimation, child);
      case AnimationType.FromLeft:
        return AnimationTransition.fromLeft(
            animation, secondaryAnimation, child);
      case AnimationType.FromBottom:
        return AnimationTransition.fromBottom(
            animation, secondaryAnimation, child);
      case AnimationType.FromTop:
        return AnimationTransition.fromTop(
            animation, secondaryAnimation, child);
      case AnimationType.Shrink:
        return AnimationTransition.shrink(animation, secondaryAnimation, child);
      case AnimationType.Grow:
        return AnimationTransition.grow(animation, secondaryAnimation, child);
      default:
        return AnimationTransition.none(animation, secondaryAnimation, child);
    }
  }
}
