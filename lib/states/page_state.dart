import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/states/register_state.dart';

enum Pages {
  login,
  register,
  home,
}

class PageNotifier extends StateNotifier<Pages> {
  PageNotifier() : super(Pages.login);

  void setPage(WidgetRef ref, Pages next) {
    if (state == Pages.login || next == Pages.home) {
      ref.read(loginProvider.notifier).clear();
    } else if (state == Pages.register || next == Pages.home) {
      ref.read(registerProvider.notifier).clear();
    }

    state = next;
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, Pages>(
  (ref) => PageNotifier(),
);
