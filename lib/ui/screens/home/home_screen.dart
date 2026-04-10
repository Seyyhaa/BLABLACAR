import 'package:blabla/ui/screens/home/view_model/home_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<RidePreferenceState>();
    final vm = HomeViewModel(state);
    return Scaffold(body: HomeContent(viewModel: vm));
  }
}
