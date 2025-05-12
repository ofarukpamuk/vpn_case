import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case/core/enums/bottom_nav_item.dart';
import 'package:vpn_case/core/init/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavItem selectedItem;
  final ValueChanged<BottomNavItem> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedItem.index,
      onTap: (index) => onItemSelected(BottomNavItem.values[index]),
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      backgroundColor: AppColors.backgroundColor,
      items:
          BottomNavItem.values.map((item) {
            final isSelected = item == selectedItem;
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.assetPath,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primaryBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: item.label,
            );
          }).toList(),
    );
  }
}
