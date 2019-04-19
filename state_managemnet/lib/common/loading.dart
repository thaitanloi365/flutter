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
enum AnimationType { fromLeft, fromRight, fromBottom, shrink, grow }

class Loading {
  final VoidCallback onClose;
  final VoidCallback onShow;
  final bool barrierDismissible;
  final Color barrierColor;
  final Duration duration;
  final BuildContext context;
  final AnimationType animationType;

  Loading(
      {@required this.context,
      this.animationType,
      this.onClose,
      this.onShow,
      this.barrierColor = const Color.fromARGB(100, 0, 0, 0),
      this.duration = const Duration(milliseconds: 2500),
      this.barrierDismissible = false});

  show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildDialog();
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

  Widget _buildDialog() {
    return Center(child: CircularProgressIndicator());
  }

  _showAnimation(animation, secondaryAnimation, child) {
    if (animationType == AnimationType.fromRight) {
      return AnimationTransition.fromRight(
          animation, secondaryAnimation, child);
    } else if (animationType == AnimationType.fromLeft) {
      return AnimationTransition.fromLeft(animation, secondaryAnimation, child);
    } else if (animationType == AnimationType.fromBottom) {
      return AnimationTransition.fromBottom(
          animation, secondaryAnimation, child);
    } else if (animationType == AnimationType.grow) {
      return AnimationTransition.grow(animation, secondaryAnimation, child);
    } else if (animationType == AnimationType.shrink) {
      return AnimationTransition.shrink(animation, secondaryAnimation, child);
    } else {
      return AnimationTransition.fromTop(animation, secondaryAnimation, child);
    }
  }
}
