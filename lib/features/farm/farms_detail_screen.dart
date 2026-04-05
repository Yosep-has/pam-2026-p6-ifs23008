// lib/features/farm/farms_detail_screen.dart

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/models/farm_model.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class FarmsDetailScreen extends StatefulWidget {
  const FarmsDetailScreen({super.key, required this.farmName});

  final String farmName;

  @override
  State<FarmsDetailScreen> createState() => _FarmsDetailScreenState();
}

class _FarmsDetailScreenState extends State<FarmsDetailScreen> {
  FarmModel? _farm;

  @override
  void initState() {
    super.initState();
    // Simulasi async data loading
    Future.microtask(() {
      final result = DummyData.getFarmData()
          .where((f) => f.nama == widget.farmName)
          .firstOrNull;
      if (mounted) {
        setState(() => _farm = result);
        // Kembali jika data tidak ditemukan
        if (result == null && mounted) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_farm == null) {
      return Scaffold(
        appBar: TopAppBarWidget(
          title: widget.farmName,
          showBackButton: true,
        ),
        body: const LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: TopAppBarWidget(
        title: _farm!.nama,
        showBackButton: true,
      ),
      body: _FarmsDetailBody(farm: _farm!),
    );
  }
}

class _FarmsDetailBody extends StatelessWidget {
  const _FarmsDetailBody({required this.farm});

  final FarmModel farm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Gambar dan nama
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  farm.gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      Icons.pets,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  farm.nama,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Section Deskripsi
          _InfoCard(title: 'Deskripsi', content: farm.deskripsi),
          const SizedBox(height: 16),

          // Section Keunggulan
          _InfoCard(title: 'Keunggulan', content: farm.keunggulan),
          const SizedBox(height: 16),

          // Section Nilai Jual
          _InfoCard(title: 'Nilai Jual', content: farm.nilaiJual),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Widget reusable untuk menampilkan info card
class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
