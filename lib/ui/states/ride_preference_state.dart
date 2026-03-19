import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? currentPreference;
  List<RidePreference> history = [];

  RidePreferenceState(this.repository) {
    _init();
  }

  Future<void> _init() async {
    notifyListeners();
  }

  void selectedPreference(RidePreference preference){
    if (preference != currentPreference) {
      currentPreference = preference;
      history.add(preference);
      notifyListeners(); 
    }
  }
}
