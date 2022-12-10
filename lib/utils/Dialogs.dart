import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  ///
  /// Alert Dialog
  static void showOkAlertDialog(String title, String body) {
    BuildContext context = Get.context!;
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: Colors.orange),
      ),
      content: Text(
        body,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  ///
  /// yes | no dialog
  static Future<bool> showDeleteYesNoDialog(String title, String txt) async {
    BuildContext context = Get.context!;
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
      content: Text(
        txt,
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Yes",
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        TextButton(
          child: const Text("NO", style: TextStyle(color: Colors.grey)),
          onPressed: () {
            Navigator.pop(context, false);
          },
        )
      ],
    );

    // show the dialog
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return result;
  }
}
