import 'package:flutter/material.dart';
import 'package:member/src/constants/image_strings.dart';
import 'package:member/src/constants/text_strings.dart';
import 'package:member/src/features/authentication/models/model_onboarding.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({super.key, required this.model});

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(image: AssetImage(model.image)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                model.counterTitile,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
