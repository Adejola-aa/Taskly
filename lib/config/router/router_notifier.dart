import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Ref ref, dynamic listenable) {
    ref.listen(listenable, (_, _) => notifyListeners());
  }
}
