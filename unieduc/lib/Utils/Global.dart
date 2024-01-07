import 'package:flutter/material.dart';

import '../Widget/Loading.dart';

String root='https://c414-41-202-207-3.ngrok-free.app';
int selected_drawer=1;
 loading_popup(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return const Loading();
      }));
}