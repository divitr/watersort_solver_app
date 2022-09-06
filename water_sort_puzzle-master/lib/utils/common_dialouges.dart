import 'package:flutter/material.dart';

class CommonDialogues {
  Future<void> showPopup(
      BuildContext context, String title, bool shouldDoAction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
                // }
              },
            ),
          ],
        );
      },
    );
  }
}
