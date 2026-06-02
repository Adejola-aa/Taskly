import 'package:flutter/widgets.dart';

class KeyboardDismissObserver extends NavigatorObserver {
  void _dismiss() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _dismiss();
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _dismiss();
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _dismiss();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _dismiss();
    super.didRemove(route, previousRoute);
  }
}

class TKeyboard {
  static void close(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
