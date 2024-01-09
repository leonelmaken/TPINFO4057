import 'package:flutter/material.dart';

import '../Widget/Loading.dart';

String root='https://97f2-41-202-219-168.ngrok-free.app';
int selected_drawer=1;
 loading_popup(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return const Loading();
      }));
}