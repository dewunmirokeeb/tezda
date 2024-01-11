import 'package:flutter/material.dart';
import 'package:tezda_assessment/constant/colors.dart';

class ProfileImageViewer extends StatelessWidget {
  const ProfileImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      child: Icon(
        Icons.person,
        color: AppColors.neutral,
        size: 40,
      ),
    );
  }
}
