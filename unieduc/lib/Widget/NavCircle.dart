import 'package:flutter/material.dart';
// Widget _buildDot(int index, int _currentPage) {
// return Container(
//   width: 10.0,
//   height: 10.0,
//   decoration: BoxDecoration(
//     shape: BoxShape.circle,
//     color: _currentPage == index ? Colors.blue : Colors.grey,
//   ),
// );
//}

class Navcircle extends StatelessWidget {
  final int index;
  final int currentPage;
  const Navcircle({
    Key? key,
    required this.index,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: currentPage == index ? 15.0 : 10.0,
      height: currentPage == index ? 15.0 : 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.white : Colors.grey,
      ),
      // child: Center(
      //   child: Text(
      //     "${index + 1}",
      //     style: TextStyle(
      //         fontSize: currentPage == index ? 10 : 5,
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
