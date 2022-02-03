import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = HexColor("97A0E5");
    var path = Path();
    path.lineTo(0, size.height - size.height / 6);
    path.lineTo(size.width / 1.5, size.height);
    //Added this line//
    path.relativeQuadraticBezierTo(15, 3, 30, -4);
    path.lineTo(size.width, size.height - size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LogoClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.height / 6);
    path.lineTo(size.width / 1.5, size.height);
    //Added this line
    path.relativeQuadraticBezierTo(15, 3, 30, -4);
    path.lineTo(size.width, size.height - size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
