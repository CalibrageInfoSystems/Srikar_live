import 'package:flutter/material.dart';

class ProgressDialog {
  final BuildContext context;
  late bool _isShowing;

  ProgressDialog(this.context) {
    _isShowing = false;
    show();
  }

  Future<void> show() async {
    if (!_isShowing) {
      _isShowing = true;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const CircularProgressIndicator.adaptive()));
        },
      );
      _isShowing = false; // Set isShowing back to false after dialog is dismissed
    }
  }

  void dismiss() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(context).pop();
    }
  }
}