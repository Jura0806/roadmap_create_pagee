import 'package:flutter/material.dart';

bottomLessons(BuildContext context) {
  final sizeHeight = MediaQuery.of(context).size.height;
  final sizeWidth = MediaQuery.of(context).size.width;

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter myState) {
        return SizedBox(
          height: sizeHeight / 1.2,
          width: sizeWidth,
          child: const Center(
            child: Text("Lessons"),
          ),
        );
      });
    },
  );
}
