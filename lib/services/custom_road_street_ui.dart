import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CustomRoadStreet extends CustomPainter {
  double sizeWidth;

  CustomRoadStreet({required this.sizeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    //paint.color = Colors.black;
    paint.color = const Color(0xff43485e);
    paint.strokeWidth = 40;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var path = Path();

    ///WE WILL PAINT CURVED ROAD
    path.moveTo(0, size.height / 2); //Ax, Ay
    //path.lineTo(size.width/32, size.height/2);

    for (int i = 1; i <= 6; i++) {
      path.quadraticBezierTo(
          (2 * i - 1) * sizeWidth / 6,
          (i % 2 == 1 ? 2 : 4) * size.height / 6,
          2 * i * sizeWidth / 6,
          3 * size.height / 6);
    }

    // for (int i = 1; i <= 6; i++) {
    //   path.quadraticBezierTo(
    //       (2 * i - 1) * sizeWidth / 6,
    //       (i % 2 == 1 ? 2 : 4) * size.height / 6,
    //       2 * i * sizeWidth / 6,
    //       3 * size.height / 6);
    // }

    // path.quadraticBezierTo(sizeWidth / 6, 2 * size.height / 6,
    //     2 * sizeWidth / 6, 3 * size.height / 6);
    // path.quadraticBezierTo(3 * sizeWidth / 6, 4 * size.height / 6,
    //     4 * sizeWidth / 6, 3 * size.height / 6);
    // path.quadraticBezierTo(5 * sizeWidth / 6, 2 * size.height / 6,
    //     6 * sizeWidth / 6, 3 * size.height / 6);
    // path.quadraticBezierTo(7 * sizeWidth / 6, 4 * size.height / 6,
    //     8 * sizeWidth / 6, 3 * size.height / 6);
    // path.quadraticBezierTo(9 * sizeWidth / 6, 2 * size.height / 6,
    //     10 * sizeWidth / 6, 3 * size.height / 6);
    // path.quadraticBezierTo(11 * sizeWidth / 6, 4 * size.height / 6,
    //     12 * sizeWidth / 6, 3 * size.height / 6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DottedBorderLine extends CustomPainter {
  double sizeWidth;

  DottedBorderLine({required this.sizeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 4;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var path = Path();

    ///WE WILL PAINT ROAD LINE
    path.moveTo(0, size.height / 2); //Ax, Ay
    for (int i = 1; i <= 6; i++) {
      path.quadraticBezierTo(
          (2 * i - 1) * sizeWidth / 6,
          (i % 2 == 1 ? 2 : 4) * size.height / 6,
          2 * i * sizeWidth / 6,
          3 * size.height / 6);
    }
    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList(<double>[15.0, 10.5])),
        paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
