import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleSearchBoxProvider =
    StateNotifierProvider<ToggleSearchBoxController, bool>((ref) {
  return ToggleSearchBoxController();
});

// UI Controller
class ToggleSearchBoxController extends StateNotifier<bool> {
  ToggleSearchBoxController() : super(false);

  void toggleSearchBox() {
    state = !state;
  }
}
