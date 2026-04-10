import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState state;

  HomeViewModel(this.state) {
    state.addListener(_onStateChanged);
  }

  RidePreference? get currentPreference => state.currentPreference;

  List<RidePreference> get history => state.history;

  int get maxSeats => state.maxSeats;
  void selectPreference(RidePreference pref) {
    state.selectPreference(pref);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    state.removeListener(_onStateChanged);
    super.dispose();
  }
}
