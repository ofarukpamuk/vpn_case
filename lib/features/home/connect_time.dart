import 'package:flutter/material.dart';
import 'package:vpn_case/core/init/theme/app_colors.dart';

class ConnectingTimeWidget extends StatelessWidget {
  const ConnectingTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Connecting Time',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '10:23:66',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
