import 'package:dcydr/data/types.dart';
import 'package:flutter/material.dart';

class ChooseIconDialog extends StatefulWidget {
  final Function setIcon;

  ChooseIconDialog({@required this.setIcon});

  @override
  State<ChooseIconDialog> createState() => _ChooseIconDialogState();
}

class _ChooseIconDialogState extends State<ChooseIconDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                'Choose an icon',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              children: RandomListTypes.types.map((icon) {
                return IconButton(
                  padding: EdgeInsets.all(24),
                  icon: RandomList.iconFromType(icon.name),
                  onPressed: () {
                    this.widget.setIcon(icon.name);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
