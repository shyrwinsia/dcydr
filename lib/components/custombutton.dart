import 'package:flutter/material.dart';

class CustomFlatIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function callback;

  CustomFlatIconButton({this.label, this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      textColor: const Color(0xFF2A86CB),
      padding: EdgeInsets.all(12),
      icon: Icon(
        this.icon,
        size: 12,
      ),
      label: Text(
        this.label,
      ),
      onPressed: this.callback,
    );
  }
}
