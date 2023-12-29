import 'package:flutter/material.dart';

import '../Widget/Loading.dart';

String root='https://eaaa-154-72-160-237.ngrok-free.app';
int selected_drawer=1;
 loading_popup(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return const Loading();
      }));
}