import 'package:flutter/material.dart';
import 'package:tezda_assessment/constant/styles.dart';
import 'package:tezda_assessment/models/onboarding_model/onboarding_data.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    required this.data,
    super.key,
  });

  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 290,
          height: 290,
          child: Image.asset(data.image),
        ),
        const SizedBox(height: 40),
        Text(
          data.title,
          style: TextStyles.bold24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 300,
          child: Text(
            data.description,
            style: TextStyles.regular14,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
