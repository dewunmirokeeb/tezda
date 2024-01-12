import 'package:flutter/material.dart';
import 'package:tezda_assessment/components/buttons/app_button.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/local_database/local_db.dart';
import 'package:tezda_assessment/core/local_database/local_db_string.dart';
import 'package:tezda_assessment/features/authentication/views/login_page.dart';
import 'package:tezda_assessment/features/onboarding/widgets/onboarding_widget.dart';
import 'package:tezda_assessment/models/onboarding_model/onboarding_data.dart';
import 'package:tezda_assessment/widget/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "intro/onboarding";

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController onboardingController = PageController();
  @override
  void dispose() {
    onboardingController.dispose();
    super.dispose();
  }

  int currentindex = 0;
  changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      title: "Tezda Assessment \nTitle 1",
      description: "Tezda Assessment Body 1",
      image: "asset/images/onboarding1.png",
    ),
    OnboardingData(
      title: "Tezda Assessment \nTitle 2",
      description: "Tezda Assessment Body 2",
      image: "asset/images/onboarding1.png",
    ),
    OnboardingData(
      title: "Tezda Assessment \nTitle 3",
      description: "Tezda Assessment Body 3",
      image: "asset/images/onboarding1.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: PageView(
                  controller: onboardingController,
                  onPageChanged: (value) {
                    changeIndex(value);
                  },
                  children: [
                    ...onboardingData.map(
                      (e) => OnboardingWidget(data: e),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: currentindex == 2
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentindex != 2,
                    replacement: const SizedBox(),
                    child: PageIndicator(
                      controller: onboardingController,
                    ),
                  ),
                  AppButton(
                    onTap: () {
                      if (currentindex < 2) {
                        onboardingController.animateToPage(
                          currentindex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        StorageUtil.putInt(
                          key: LocalDataBaseKeys.userOnboardingState,
                          value: 1,
                        );
                        navigator.pushReplaceMent(
                          routeName: LoginPage.routeName,
                        );
                      }
                    },
                    buttonWidth: currentindex < 2 ? 100 : null,
                    buttonText: currentindex != 2 ? "Next" : "Get Started",
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
