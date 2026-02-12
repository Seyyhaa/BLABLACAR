import 'package:blabla/ui/screens/location_picker/location_picker_screen.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:blabla/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

import '../../../../models/ride/locations.dart';
import '../../../../models/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departure = widget.initRidePref?.departure;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    arrival = widget.initRidePref?.arrival;
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  _onSwapLocation() {
    setState(() {
      //use for swap the Location
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  _selectedLocation({required bool isDeparture}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickerScreen(
          onSelected: (Location selectedLocation) {
            setState(() {
              if (isDeparture) {
                departure = selectedLocation;
              } else {
                arrival = selectedLocation;
              }
            });
          },
        ),
      ),
    );
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  Widget _buildChooseTile({
    required IconData icon,
    required String label,
    bool isPlaceholder = false,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: BlaColors.neutral),
      title: Text(
        label,
        style: BlaTextStyles.body.copyWith(
          color: isPlaceholder ? BlaColors.textLight : BlaColors.textNormal,
        ),
      ),
      trailing: trailing,
    );
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildChooseTile(
          label: departure?.name ?? "Leaving from",
          icon: Icons.radio_button_unchecked,
          isPlaceholder: departure == null,
          onTap: () => _selectedLocation(isDeparture: true),
          trailing: IconButton(
            icon: Icon(Icons.swap_vert, color: BlaColors.primary),
            onPressed: _onSwapLocation,
          ),
        ),
        BlaDivider(),
        _buildChooseTile(
          label: arrival?.name ?? "Going to",
          icon: Icons.radio_button_unchecked,
          isPlaceholder: arrival == null,
          onTap: () => _selectedLocation(isDeparture: false),
        ),
        BlaDivider(),
        _buildChooseTile(
          icon: Icons.date_range,
          label: DateTimeUtils.formatDateTime(departureDate),
          onTap: () {},
        ),
        BlaDivider(),
        _buildChooseTile(
          icon: Icons.person,
          label: requestedSeats.toString(),
          onTap: () {},
        ),
        BlaDivider(),
        BlaButton(onPressed: () {}, label: "Search"),
      ],
    );
  }
}
