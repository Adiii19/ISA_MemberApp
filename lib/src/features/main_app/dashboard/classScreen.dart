import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:member/src/data/Actuators&Motors.dart';
import 'package:member/src/data/Communication%20Modules.dart';
import 'package:member/src/data/DisplaysandIndicators.dart';
import 'package:member/src/data/TransistorsandDiodes.dart';
import 'package:member/src/data/audiomodules.dart';
import 'package:member/src/data/microControllerList.dart';
import 'package:member/src/data/model.dart';
import 'package:member/src/data/sensors.dart';
import 'package:member/src/features/main_app/search_screen/search_screen.dart';
import 'package:member/src/features/authentication/controllers/componentController.dart';

class Classscreen extends StatefulWidget {
  const Classscreen({required this.title, super.key});

  final String title;

  //final List<Map<String,String>> componentList;

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  final ComponentController controller = Get.put(ComponentController());
  @override
  void initState() {
    super.initState();
    // Add some sample data for demonstration purposes
    controller.Classcomponents.clear();
    List<Component> componentList = getComponentListbytitle(widget.title);
    for (Component elem in componentList) {
      controller.addComponent(elem);
    }
  }

  List<Component> getComponentListbytitle(String title) {
    switch (title) {
      case 'Microcontroller':
        return Microcontrollers().components;

      case 'Communication Modules':
        return CommunicationModules().components;

      case 'Sensors':
        return Sensors().components;

      case 'Displays & Indicators':
        return Displaysandindicators().components;

      case 'Transistors and Diodes':
        return Transistorsanddiodes().components;

      case 'Actuators and Motors':
        return ActuatorsandMotors().components;

      case 'Audio Modules':
        return Audiomodules().components;

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC5E3FF),
        title: Text(
          widget.title,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 210, 255),
              Color.fromARGB(255, 213, 245, 252),
              Color.fromARGB(255, 242, 254, 255)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.Classcomponents.length,
              itemBuilder: (context, index) {
                final component = controller.Classcomponents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      component.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Box No: ${component.boxNo}\nStock: ${component.stock}'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
