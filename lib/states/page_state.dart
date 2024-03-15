import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Pages {
  login,
  register,
  home,
}

final StateProvider<Pages> pageStateProvider = StateProvider<Pages>((ref) => Pages.login);
