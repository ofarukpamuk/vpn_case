import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case/features/home/custom_list_tile.dart';

import '../../core/init/theme/app_colors.dart';

class VpnHomeScreen extends StatelessWidget {
  const VpnHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          _CustomHeader(),
          SizedBox(height: 20),
          _LocationListWidget(),
        ],
      ),
    );
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
            Row(
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
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/crown.svg',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Arama kutusu
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for country or city',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black45,
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

class _StatusItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatusItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
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
      height: 550,
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
    );
  }
}

class _ConnectButton extends StatelessWidget {
  const _ConnectButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Bağlanma işlemi burada olacak
      },
      icon: SvgPicture.asset(
        'assets/icons/connection.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
      label: const Text('Bağlan'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
