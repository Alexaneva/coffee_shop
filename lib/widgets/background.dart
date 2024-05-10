import 'dart:math';

import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: const Stack(
        children: [
          CoffeeBean(
            degree: 57,
            right: 75,
            top: 0,
          ),
          CoffeeBean(
            degree: 150,
            left: 75,
            top: 0,
          ),
          CoffeeBean(
            degree: 60,
            left: 20,
            top: 120,
          ),
          CoffeeBean(
            degree: 35,
            right: 30,
            top: 110,
          ),
        ],
      ),
    );
  }
}

class CoffeeBean extends StatelessWidget {
  final double? top, left, right, bottom, degree;

  const CoffeeBean(
      {super.key, this.top, this.left, this.right, this.bottom, this.degree});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: Transform.rotate(
        angle: degree! * pi / 180,
        child: Image.asset(
          'assets/images/coffee-beans.jpg',
          width: 70,
        ),
      ),
    );
  }
}
