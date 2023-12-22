import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService(this.navigatorKey);

  BuildContext get currentContext =>
      navigatorKey.currentState!.overlay!.context;

  void navigate(dynamic destination) {
    navigatorKey.currentState!.push(
      MaterialPageRoute(
          builder: (context) => destination,
          fullscreenDialog: false,
          maintainState: false),
    );
  }

  void pushNamed(String routeName, {bool replace = false}) {
    if (replace) {
      navigatorKey.currentState!.pushReplacementNamed(routeName);
      return;
    }

    navigatorKey.currentState!.pushNamed(routeName);
  }

  popNavigate() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  popToRoot() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!
          .popUntil((Route<dynamic> route) => route.isFirst);
    }
  }

  showBottomSheet(
    dynamic child, {
    Function? closed,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    var modal = showModalBottomSheet(
      context: currentContext,
      backgroundColor: backgroundColor = Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return child;
      },
    );
    modal.then((value) {
      if (closed != null) {
        closed();
      }
    });
  }
}
