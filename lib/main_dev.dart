import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:provider/provider.dart';

List<InheritedProvider> get devProviders {
  final ridePreferenceRepository = RidePreferenceRepositoryMock();

  return [

    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),

  
    Provider<RidePreferenceRepository>(create: (_) => RidePreferenceRepositoryMock()),


    ChangeNotifierProvider<RidePreferenceState>(
      create: (_) => RidePreferenceState(repository: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
