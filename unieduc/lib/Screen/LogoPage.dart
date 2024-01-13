import 'dart:async';


import 'package:flutter/material.dart';
import 'package:unieduc/Screen/HomePage.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        // Column(
        //   children: [
        //     // // Row(
        //     // //   children: const [
        //     // //     HalfCircle(
        //     // //       radius: 50.0,
        //     // //       color: Colors.blue,
        //     // //     )
        //     // //   ],
        //     // // ),
        //     // const SizedBox(
        //     //   height: 30,
        //     // ),
            Center(child: Image.asset( "assets/images/logo1.png")),
          //],
        );
  }
}
