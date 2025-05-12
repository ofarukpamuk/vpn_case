import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_case/features/home/connect_time.dart';
import 'package:vpn_case/features/home/custom_list_tile.dart';
import '../../core/enums/bottom_nav_item.dart';
import '../../core/init/theme/app_colors.dart';
import '../../core/widgets/custom_bottom_nav_bar.dart';

class VpnHomeScreen extends StatefulWidget {
  const VpnHomeScreen({super.key});

  @override
  State<VpnHomeScreen> createState() => _VpnHomeScreenState();
}

class _VpnHomeScreenState extends State<VpnHomeScreen> {
  BottomNavItem _currentItem = BottomNavItem.countries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _buildBody(_currentItem),
      bottomNavigationBar: CustomBottomNavBar(
        selectedItem: _currentItem,
        onItemSelected: (item) {
          setState(() {
            _currentItem = item;
          });
        },
      ),
    );
  }

  Widget _buildBody(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.countries:
        return Column(
          children: [
            _CustomHeader(),
            const SizedBox(height: 20),
            const ConnectingTimeWidget(),
            const Location(
              flagAsset: 'assets/flags/netherlands.svg',
              countryName: 'Netherlands',
              cityName: 'Amsterdam',
              percentageText: '%22',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Speed(
                  iconAsset: 'assets/icons/download.svg',
                  label: 'Download',
                  value: '435 MB',
                ),
                SizedBox(width: 12),
                Speed(
                  iconAsset: 'assets/icons/upload.svg',
                  label: 'Upload',
                  value: '122 MB',
                ),
              ],
            ),
            const _LocationListWidget(),
          ],
        );

      case BottomNavItem.disconnect:
        return const Center(
          child: Text(
            'Disconnected',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );

      case BottomNavItem.settings:
        return const Center(
          child: Text(
            'Settings Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}

class _CustomHeader extends StatelessWidget {
  const _CustomHeader();

  @override
  Widget build(BuildContext context) {
    return
    // Mavi arka plan + beyaz dalga SVG
    Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: // İçerik
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Üst ikonlar ve başlık
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/grid.svg',
                    width: 40,
                    height: 40,
                  ),
                  const Text(
                    'Countries',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/crown.svg',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Arama kutusu
            Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for country or city',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  final String flagAsset;
  final String countryName;
  final String cityName;
  final String percentageText; // örn: "%22"

  const Location({
    Key? key,
    required this.flagAsset,
    required this.countryName,
    required this.cityName,
    required this.percentageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.6,
      height: 64,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Flag
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.asset(flagAsset, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          // Country + City
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
                  cityName, // ör: "Amsterdam"
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Stealth",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                percentageText, // ör: "%22"
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Speed extends StatelessWidget {
  final String iconAsset;
  final String label;
  final String value;

  const Speed({
    Key? key,
    required this.iconAsset,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (screenWidth * 0.6 - 12) / 2,
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconAsset, width: 28, height: 28),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationListWidget extends StatelessWidget {
  const _LocationListWidget();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> countries = [
      {'name': 'Germany', 'flag': 'assets/flags/germany.svg', 'locations': 8},
      {'name': 'Italy', 'flag': 'assets/flags/italy.svg', 'locations': 5},
      {
        'name': 'Netherlands',
        'flag': 'assets/flags/netherlands.svg',
        'locations': 12,
      },
    ];

    return SizedBox(
      height: 260,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Free locations (2)',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.info, size: 16, color: Colors.black45),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return CustomCountryTile(
                    flagAsset: country['flag']!,
                    countryName: country['name']!,
                    locationCount: country['locations'] as int,
                    onConnectTap: () {
                      print('${country['name']} ülkesine bağlanılıyor...');
                    },
                    onDetailsTap: () {
                      print('${country['name']} detayları açılıyor...');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
