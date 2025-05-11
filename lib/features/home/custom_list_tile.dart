import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case/core/init/theme/app_colors.dart';

class CustomCountryTile extends StatelessWidget {
  final String flagAsset; // Örn: 'assets/flags/germany.svg'
  final String countryName;
  final int locationCount;
  final VoidCallback? onConnectTap;
  final VoidCallback? onDetailsTap;

  const CustomCountryTile({
    Key? key,
    required this.flagAsset,
    required this.countryName,
    required this.locationCount,
    this.onConnectTap,
    this.onDetailsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.asset(flagAsset, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  countryName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$locationCount bağlantı',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/connection.svg',
              width: 64,
              height: 32,
              colorFilter: const ColorFilter.mode(
                AppColors.buttonColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: onConnectTap,
          ),

          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/arrow.svg',
              width: 64,
              height: 32,
              colorFilter: const ColorFilter.mode(
                AppColors.buttonColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: onDetailsTap,
          ),
        ],
      ),
    );
  }
}
