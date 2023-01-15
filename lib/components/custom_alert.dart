import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAlert {
  CustomAlert({required this.context});
  final BuildContext context;

  Future alertDialog({
    required String text,
    AlertType? type,
  }) {
    return Alert(
      context: context,
      type: type,
      content: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
        ),
      ],
    ).show();
  }
}
