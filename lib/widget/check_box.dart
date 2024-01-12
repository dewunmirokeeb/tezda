import 'package:flutter/material.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/styles.dart';

class PassWordValidatorCheckBox extends StatelessWidget {
  const PassWordValidatorCheckBox({
    required this.checked,
    required this.text,
    super.key,
  });

  final bool checked;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: checked ? Colors.white : AppColors.neutral,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            value: checked,
            onChanged: (value) {},
            activeColor: AppColors.primaryColor,
            checkColor: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyles.regular12,
          ),
        ),
      ],
    );
  }
}
