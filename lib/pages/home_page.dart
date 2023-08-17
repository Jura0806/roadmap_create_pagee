import 'package:flutter/material.dart';
import 'dart:math' show pi;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 2,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: StreetPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class StreetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.grey;
    paint.strokeWidth = 50;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke; // Change this to fill

    var path = Path();

    // You can use  in  this  place for_loop
    path.moveTo(size.width / 2, 0); //Ax, Ay
    path.quadraticBezierTo(size.width, size.height / 8, size.width / 2,
        size.height / 4); //Bx, By, Cx, Cy
    path.quadraticBezierTo(
        0, 3 * size.height / 8, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width, 5 * size.height / 8, size.width / 2, 3 * size.height / 4);
    path.quadraticBezierTo(
        0, 7 * size.height / 8, size.width / 2, size.height );
    // path.quadraticBezierTo(0, 3 * size.height / 8, size.width / 2,
    //     size.height / 2); //Dx, Dy, Ex, Ey

    // path.moveTo(size.width / 2, 200);
    // path.lineTo(size.width / 2, size.width / 3);

    // path.lineTo(300, 300);
    // path.lineTo(400, 800);
    // path.arcTo(
    //     Rect.fromPoints(Offset(170,400), Offset(400,800)),
    //     pi/2,
    //     pi ,
    //     true);
    // path.arcTo(
    //     Rect.fromPoints(Offset(170,800), Offset(400,  1200)),
    //     pi/2,
    //     -pi ,
    //     true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
