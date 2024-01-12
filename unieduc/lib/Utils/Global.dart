import 'package:flutter/material.dart';

import '../Widget/Loading.dart';

String root = 'https://335d-154-72-162-196.ngrok-free.app';
int selected_drawer = 1;

//-------------Drawer----------
bool isVisiblecreateAccount = true;
bool isVisibleLogin = true;
bool isVisibleHomePage = true;
bool isVisibleInscription = false;
bool isVisiblePreinscription = true;
bool isVisiblePersonalGestion = false;
bool isVisibleSettings = true;
bool isVisibleShareApp = true;
bool isVisibleAbout = true;
bool isVisibleLogOut = false;

//-------------create teacher account---------
bool isVisibleCreateTeacherAccount=false;
bool isVisibleCreateStudentAccount = true;

loading_popup(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return const Loading();
      }));
}

