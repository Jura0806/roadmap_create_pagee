import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import '../services/bottomsheet_lessons.dart';
import '../services/circle_and_text_buttons.dart';
import '../services/custom_road_street_ui.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

Widget circleTexts() {
  return const Text("01 \n Module");
}

class _NewHomeState extends State<NewHome> {
  final GlobalKey _circleKey = GlobalKey();

  List<String> circleModules = ["01", "03", "05", "07"];
  List<String> circleModules2 = ["02", "04", "06", "08"];

  @override
  Widget build(BuildContext context) {
    final sizeOfWidth = 2 * MediaQuery.of(context).size.width;
    final sizeOfHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: 2 * sizeOfWidth,
                  //color: Colors.white,
                  child: CustomPaint(
                    painter: CustomRoadStreet(sizeWidth: sizeOfWidth),
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 2 * sizeOfWidth,
                  child: CustomPaint(
                    painter: DottedBorderLine(sizeWidth: sizeOfWidth),
                  )),
              //     CustomPaint(
              //       key: _circleKey,
              //       painter: CircleModuleButton(
              //       sizeWidth: sizeOfWidth ,
              //       circleText: circleTexts(),
              //       sizeHeight: sizeOfHeight,
              //       context: context),
              //       // child: Container(
              //       //   height: 200,
              //       //   width: 300,
              //       //   color: Colors.red,
              //       // )
              //   //child: Text("HI"),
              // ),
              // TextInCircle(),

              Positioned(
                left: 80,
                top: 200,
                child: Column(
                  children: [
                    Row(
                        children: circleModules
                            .map((e) => Container(
                                  child: CircleButton(e),
                                  padding:
                                      EdgeInsets.only(right: sizeOfWidth / 2),
                                ))
                            .toList()),
                  ],
                ),
              ),
              Positioned(
                left: sizeOfWidth / 2 - 70,
                top: 5 * sizeOfHeight / 7 - 70,
                child: Row(
                    children: circleModules2
                        .map((e) => Container(
                              padding: EdgeInsets.only(right: sizeOfWidth / 2),
                              child: CircleButton(e),
                            ))
                        .toList()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CircleButton(String textModule) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            bottomLessons(context);
          },
          child: Container(
            height: 140,
            width: 140,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.brown),
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Center(
                  child: Text(
                    "    ${textModule} \nModule",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 150,
        ),
        Text(
          "Flutter",
          style: TextStyle(color: Colors.brown, fontSize: 20),
        )
      ],
    );
  }

  Widget Modules(
      {required double leftPosition,
      required double rightPosition,
      required double widthScreen}) {
    return Positioned(
      left: 80,
      top: 200,
      child: Row(
          children: circleModules
              .map((e) => Container(
                    child: CircleButton(e),
                    padding: EdgeInsets.only(right: widthScreen / 2),
                  ))
              .toList()),
    );
  }
}
