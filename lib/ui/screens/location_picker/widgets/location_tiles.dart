// import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/models/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationTiles extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;
  const LocationTiles({super.key, required this.location, required this.onTap});

  String get title => location.name;
  String get subtitle => location.country.name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
      ),
      subtitle: Text(
        subtitle,
        style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: BlaColors.iconLight,
        size: 16,
      ),
    );
  }
}
