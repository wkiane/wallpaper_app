import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
