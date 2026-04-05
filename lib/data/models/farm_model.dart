// lib/data/models/farm_model.dart

/// Model data untuk hewan ternak
/// Menggunakan immutable class (best practice Flutter/Dart)
class FarmModel {
  const FarmModel({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.keunggulan,
    required this.nilaiJual,
  });

  final String nama;
  final String gambar; // Path asset, contoh: 'assets/images/img_ayam.png'
  final String deskripsi;
  final String keunggulan;
  final String nilaiJual;

  /// Metode copyWith memudahkan pembuatan objek baru dengan data yang diubah sebagian
  FarmModel copyWith({
    String? nama,
    String? gambar,
    String? deskripsi,
    String? keunggulan,
    String? nilaiJual,
  }) {
    return FarmModel(
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      deskripsi: deskripsi ?? this.deskripsi,
      keunggulan: keunggulan ?? this.keunggulan,
      nilaiJual: nilaiJual ?? this.nilaiJual,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FarmModel &&
              runtimeType == other.runtimeType &&
              nama == other.nama;

  @override
  int get hashCode => nama.hashCode;

  @override
  String toString() => 'FarmModel(nama: $nama)';
}
