import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ClipType { bottom, semiCircle, halfCircle, multiple }

class MyCustomClipper extends CustomClipper<Path> {
  ClipType clipType;

  MyCustomClipper({this.clipType});

  @override
  getClip(Size size) {
    var path = new Path();
    if (clipType == ClipType.bottom) {
      createBottom(size, path);
    } else if (clipType == ClipType.semiCircle) {
      createSemiCirle(size, path);
    } else if (clipType == ClipType.halfCircle) {
      createHalfCircle(size, path);
    } else if (clipType == ClipType.multiple) {
      createMultiple(size, path);
    }
    path.close();
    return path;
  }

  createSemiCirle(Size size, Path path) {
    path.lineTo(size.width / 1.40, 0);

    var firstControlPoint = new Offset(size.width / 1.30, size.height / 2.5);
    var firstEndPoint = new Offset(size.width / 1.85, size.height / 1.85);

    var secondControlPoint = new Offset(size.width / 4, size.height / 1.45);
    var secondEndPoint = new Offset(0, size.height / 1.75);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0, size.height / 1.75);
  }

  createBottom(Size size, Path path) {
    path.lineTo(0, size.height / 1.19);
    var secondControlPoint = new Offset((size.width / 2), size.height);
    var secondEndPoint = new Offset(size.width, size.height / 1.19);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
  }

  createHalfCircle(Size size, Path path) {
    path.lineTo(size.width / 2, 0);
    var firstControlPoint = new Offset(size.width / 1.10, size.height / 2);
    var firstEndPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(0, size.height);
  }

  createMultiple(Size size, Path path) {
    path.lineTo(0, size.height);

    var curXPos = 0.0;
    var curYPos = size.height;
    Random rnd = new Random();

    var increment = size.width / 40;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - rnd.nextInt(50 - 0) : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
