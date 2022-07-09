import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roadway/core/constants/colors.dart';

void showToast({required String msg, Color bgcolor = ksuccess}) {
  Fluttertoast.showToast(
    msg: msg, // messageitem
    toastLength: Toast.LENGTH_SHORT, // length
    gravity: ToastGravity.CENTER, // location
    backgroundColor: bgcolor,
  );
}
