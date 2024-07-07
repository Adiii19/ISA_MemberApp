import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/main_app/add_component/NewEntry_nonConsumable.dart';
import 'package:inventory/src/features/authentication/screens/scanner_screen/scanner_screen.dart';

Future<dynamic> AddCompBottomSheet(BuildContext context) {
  final componentcontroller = Get.put(Componentcontroller(), permanent: true);
  componentcontroller.reset();
  return showModalBottomSheet(
    sheetAnimationStyle:
        AnimationStyle(curve: Curves.bounceInOut, duration: Durations.long4),
    context: context,
    useSafeArea: true,
    constraints: BoxConstraints.expand(),
    isScrollControlled: true,
    elevation: 10,
    backgroundColor: Color(0xffC5E3FF),
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async {
        Get.delete<Componentcontroller>();
        return true;
      },
      child: Newentry(),
    ),
  );
}
