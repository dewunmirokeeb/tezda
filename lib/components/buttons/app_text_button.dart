import 'package:flutter/material.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onTap,
    this.buttontext = 'button text',
    Key? key,
  }) : super(key: key);
  final String buttontext;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(30, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.topLeft,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          buttontext,
          style: TextStyles.regular14.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
