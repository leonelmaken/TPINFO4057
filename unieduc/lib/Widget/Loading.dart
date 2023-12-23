import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  const Center(
        child: SpinKitThreeBounce(
          duration: Duration(milliseconds: 1000),
          size: 40,
          color: Colors.white,
        ),
      ),

    );
  }
}