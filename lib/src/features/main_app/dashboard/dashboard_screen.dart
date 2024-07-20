import 'package:flutter/material.dart';
import 'package:member/src/features/main_app/dashboard/classes_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClassContainer(label: "Microcontroller", stock: 22),
            ClassContainer(label: "Communication Modules", stock: 19),
            ClassContainer(label: "Sensors", stock: 26),
            ClassContainer(label: "Display & Indicators", stock: 13),
            ClassContainer(label: "Audio Modules", stock: 5),
            ClassContainer(label: "Transistors and Diodes", stock: 8),
            ClassContainer(label: "Actuators and Motors", stock: 7),
          ],
        ),
      ),
    );
  }
}
