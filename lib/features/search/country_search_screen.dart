import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/data/mock/mock_data.dart';
import '../../core/data/models/country.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  State<CountrySearchScreen> createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Country> _filteredCountries;

  @override
  void initState() {
    super.initState();
    _filteredCountries = mockCountries;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCountries =
          mockCountries.where((country) {
            return country.name.toLowerCase().contains(query);
          }).toList();
    });
  }

  Widget _buildFlag(String flagPath) {
    if (flagPath.endsWith('.svg')) {
      return SvgPicture.asset(flagPath, height: 32, width: 42);
    } else {
      return Image.asset(flagPath, height: 32, width: 42, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Country"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search country...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child:
                _filteredCountries.isEmpty
                    ? const Center(child: Text("No countries found"))
                    : ListView.builder(
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = _filteredCountries[index];
                        return ListTile(
                          leading: _buildFlag(country.flag),
                          title: Text(country.name),
                          subtitle: Text('${country.locationCount} locations'),
                          trailing:
                              country.isConnected
                                  ? const Chip(
                                    label: Text("Connected"),
                                    backgroundColor: Colors.greenAccent,
                                  )
                                  : null,
                          onTap: () {
                            Navigator.pop(
                              context,
                              country,
                            ); // Seçimi geri döndür
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
