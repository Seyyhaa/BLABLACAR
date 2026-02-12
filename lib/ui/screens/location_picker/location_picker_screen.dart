import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/models/ride/locations.dart';

import 'package:blabla/ui/screens/location_picker/widgets/location_tiles.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  final Function(Location) onSelected;
  const LocationPickerScreen({super.key, required this.onSelected});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  List<Location> filterLocations = [];

  _onSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        return ;
      } else {
        filterLocations = fakeLocations
            .where(
              (location) =>
                  location.name.toLowerCase().startsWith(value.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: BlaColors.backgroundAccent,
              borderRadius: BorderRadius.circular(BlaSpacings.radius),
            ),
            child: TextField(
              onChanged: _onSearch,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: BlaColors.neutralLight,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Find the Location",
                hintStyle: BlaTextStyles.body.copyWith(
                  color: BlaColors.textLight,
                ),
                border: InputBorder.none,
              ),
              style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterLocations.length,
              itemBuilder: (context, index) {
                return LocationTiles(
                  location: filterLocations[index],
                  onTap: () {
                    widget.onSelected(filterLocations[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
