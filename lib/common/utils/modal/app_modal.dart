import 'package:flutter/material.dart';

class AppModal {
  final BuildContext context;
  AppModal(this.context);

  void openDialog(
    Widget content,
  ) {
    try {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 400),
        context: context,
        pageBuilder: (BuildContext buildContext, __, ___) {
          return Container(
            margin: const EdgeInsets.only(bottom: 100),
            alignment: Alignment.center,
            child: content,
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0.0))
                    .animate(anim),
            child: child,
          );
        },
      );
    } catch (e) {
      print('=================================');
      print('modal-global');
      print('showAlert => invalid context');
    }
  }
}
