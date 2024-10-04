import 'package:flutter_riverpod/flutter_riverpod.dart';

final nextDayProvider = StateNotifierProvider<NextDayController, int>((ref) {
  return NextDayController();
});

class NextDayController extends StateNotifier<int> {
  NextDayController() : super(0);

  void nextDay() {
    state++;
    if (state > 3) {
      state = 0;
    }
  }
}
