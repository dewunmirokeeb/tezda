import 'package:flutter/material.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/space_constant.dart';
import 'package:tezda_assessment/constant/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    this.buttonText = "button text",
    this.isLoading = false,
    super.key,
  });
  final Function() onTap;
  final bool isLoading;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(5),
        backgroundColor: AppColors.primary5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: Size(SpaceConstants.screenWidth() - 40, 48),
      ),
      onPressed: onTap,
      child: Visibility(
        visible: isLoading,
        replacement: Text(
          buttonText,
          style: TextStyles.buttonTextStyle.copyWith(
            color: AppColors.complementary400,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
