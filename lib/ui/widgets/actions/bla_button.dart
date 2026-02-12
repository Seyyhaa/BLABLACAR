import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback onPressed;
  const BlaButton({
    super.key,
    this.isPrimary = true,
    this.icon,
    required this.onPressed,
    required this.label,
  });

  Color get _backgroundcolor => isPrimary ? BlaColors.primary : BlaColors.white;
  Color get _textcolor => isPrimary ? BlaColors.white : BlaColors.primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundcolor,
          foregroundColor: _textcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            side: isPrimary? BorderSide.none : BorderSide(color: BlaColors.greyLight)
          ),
          padding: const EdgeInsets.symmetric(
            vertical: BlaSpacings.l,
            horizontal: BlaSpacings.l,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Icon(icon), SizedBox(width: BlaSpacings.s)],
            Text(label, style: BlaTextStyles.button.copyWith(color: _textcolor)),
          ],
        ),
      ),
    );
  }
}
