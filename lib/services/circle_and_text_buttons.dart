import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:roadmap_create_pagee/pages/%C2%A0%20%20horizontal_home.dart';
import 'package:roadmap_create_pagee/services/bottomsheet_lessons.dart';
import 'package:touchable/touchable.dart';

class CircleModuleButton extends CustomPainter {
  double sizeWidth;
  double sizeHeight;
  Widget circleText;
  final BuildContext context;

  CircleModuleButton(
      {required this.sizeWidth,
      required this.circleText,
      required this.sizeHeight,
      required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    //  var myCanvas = TouchyCanvas(context, canvas);
    var paint = Paint();
    paint.color = Colors.brown;
    paint.strokeWidth = 15;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var path = Path();

    ///WE WILL  PAINT CIRCLE
    path.addOval(Rect.fromCircle(
        center: Offset(sizeWidth / 6 - 5, 2 * sizeHeight / 7), radius: 50));
    // path.addOval(Rect.fromCircle(
    //     center: Offset(3 * sizeWidth / 6 - 5, 5 * sizeHeight / 7), radius: 50));
    // path.addOval(Rect.fromCircle(
    //     center: Offset(5 * sizeWidth / 6 - 5, 2 * sizeHeight / 7), radius: 50));
    // for (int i = 1; i <= 6; i++) {
    //   path.addOval(Rect.fromCircle(
    //       center: Offset((2 * i - 1) * sizeWidth / 6 - 5,
    //           (i % 2 == 0 ? 5 : 2) * sizeHeight / 7),
    //       radius: 50));
    // }

    ///WE WILL PAINT TRIANGLE BOTTOM OF THE CIRCLE
    // path.addPolygon([
    //   Offset(sizeWidth / 8 + 20, sizeHeight / 3 + 10),
    //   Offset(sizeWidth / 8 + 40, sizeHeight / 3 + 10),
    //   Offset(sizeWidth / 8 + 30, sizeHeight / 3 + 25),
    // ], true);
    //
    // path.addPolygon([
    //   Offset(11 * sizeWidth / 24 + 20, 16 * sizeHeight / 21 - 100),
    //   Offset(11 * sizeWidth / 24 + 40, 16 * sizeHeight / 21 - 100),
    //   Offset(11 * sizeWidth / 24 + 30, 16 * sizeHeight / 21 - 115)
    // ], true);
    //
    // path.addPolygon([
    //   Offset(19 * sizeWidth / 24 + 20, sizeHeight / 3 + 10),
    //   Offset(19 * sizeWidth / 24 + 40, sizeHeight / 3 + 10),
    //   Offset(19 * sizeWidth / 24 + 30, sizeHeight / 3 + 25)
    // ], true);
    // for (int i = 0; i <= 6; i++) {
    //   double offsetX = (3 / 24 + i * 8 / 24) * sizeWidth;
    //   path.addPolygon([
    //     Offset(
    //         offsetX + 20,
    //         (i % 2 == 0)
    //             ? (sizeHeight / 3 + 10)
    //             : (16 * sizeHeight / 21 - 100)),
    //     Offset(
    //         offsetX + 40,
    //         (i % 2 == 0)
    //             ? (sizeHeight / 3 + 10)
    //             : (16 * sizeHeight / 21 - 100)),
    //     Offset(offsetX + 30,
    //         (i % 2 == 0) ? (sizeHeight / 3 + 25) : (16 * sizeHeight / 21 - 115))
    //   ], true);
    // }

    canvas.drawPath(path, paint);

    /// WE WILL ADD DEFINITION(TEXTS) FOR EVERY MODULES
    var underModuleName =
        const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold);
    final ParagraphBuilder paragraphBuilder = ParagraphBuilder(ParagraphStyle(
      fontSize: sizeWidth / 32,
    ))
      ..pushStyle(underModuleName.getTextStyle())
      ..addText("Results\nLorem ipsum Colors");
    Paragraph paragraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: sizeWidth / 6));

    // for (int i = 0; i <= 6; i++) {
    //   canvas.drawParagraph(
    //       paragraph,
    //       Offset(((2 + i * 6) / 18) * sizeWidth,
    //           (i % 2 == 0) ? (sizeHeight / 2) : (sizeHeight / 3)));
    // }
    canvas.drawParagraph(paragraph, Offset(2 * sizeWidth / 18, sizeHeight / 2));
    // canvas.drawParagraph(paragraph, Offset(8 * sizeWidth / 18, sizeHeight / 3));
    // canvas.drawParagraph(
    //     paragraph, Offset(14 * sizeWidth / 18, sizeHeight / 2));

    var moduleNumbers =
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);
    final ParagraphBuilder paragraphBuilder2 = ParagraphBuilder(
      ParagraphStyle(
        fontSize: sizeWidth / 30,
      ),
    )
      ..pushStyle(moduleNumbers.getTextStyle())
      ..addText("   01\n");
    Paragraph paragraph2 = paragraphBuilder2.build()
      ..layout(ParagraphConstraints(width: sizeWidth / 8));

    canvas.drawParagraph(
        paragraph2, Offset(2 * sizeWidth / 18, sizeHeight / 3.7));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// @override
// bool hitTest(Offset position) {
//   Path path = Path();
//   path.addOval(Rect.fromCircle(
//       center: Offset(sizeWidth / 6 - 5, 2 * sizeHeight / 7), radius: 50));
//
//   return path.contains(position);
//}
}

class TextInCircle extends StatelessWidget {
  const TextInCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeOfWidth = 2 * MediaQuery.of(context).size.width;
    final sizeOfHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        bottomLessons(context);
      },
      child: CustomPaint(
        painter: CircleModuleButton(
            sizeWidth: sizeOfWidth / 2,
            context: context,
            sizeHeight: sizeOfHeight,
            circleText: circleTexts()),
      ),
    );
  }
}
