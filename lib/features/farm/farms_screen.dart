// lib/features/farm/farms_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/route_constants.dart';
import '../../data/dummy_data.dart';
import '../../data/models/farm_model.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class FarmsScreen extends StatefulWidget {
  const FarmsScreen({super.key});

  @override
  State<FarmsScreen> createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  List<FarmModel> _farms = DummyData.getFarmData();
  String _searchQuery = '';

  void _onSearchQueryChange(String query) {
    setState(() {
      _searchQuery = query;
      _farms = DummyData.getFarmData()
          .where((f) => f.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarWidget(
        title: 'Farm',
        withSearch: true,
        searchQuery: _searchQuery,
        onSearchQueryChange: _onSearchQueryChange,
      ),
      body: _FarmsBody(
        farms: _farms,
        onOpen: (farmName) {
          // Navigasi ke detail dengan path parameter
          context.go('${RouteConstants.farm}/$farmName');
        },
      ),
    );
  }
}

class _FarmsBody extends StatelessWidget {
  const _FarmsBody({required this.farms, required this.onOpen});

  final List<FarmModel> farms;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    if (farms.isEmpty) {
      return Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Tidak ada data!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: farms.length,
      itemBuilder: (context, index) {
        return _FarmItemCard(
          farm: farms[index],
          onOpen: onOpen,
        );
      },
    );
  }
}

class _FarmItemCard extends StatelessWidget {
  const _FarmItemCard({required this.farm, required this.onOpen});

  final FarmModel farm;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onOpen(farm.nama),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Gambar hewan
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  farm.gambar,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: colorScheme.primaryContainer,
                    child: Icon(Icons.pets, color: colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Nama dan deskripsi
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      farm.nama,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      farm.deskripsi,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
