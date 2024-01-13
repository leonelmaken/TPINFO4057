import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/Inscription.dart';
import 'package:unieduc/Screen/Login.dart';

import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Screen/Welcome.dart';
import 'package:unieduc/Utils/theme.dart';

import 'Screen/LogoPage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([]);
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landflight',
      home:  LogoPage(),
     //home:  CreateAccount(),
      //darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
     // theme: lightTheme(),
     theme: ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'poppins'),
        bodyText2: TextStyle(fontFamily: 'poppins')
      )
      //fontFamily: 'poppins'
     ),
    );
  }
}
