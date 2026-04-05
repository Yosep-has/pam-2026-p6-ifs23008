// test/unit/farm_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:pam_2026_p6_ifs23008/data/models/farm_model.dart';

void main() {
  group('FarmModel', () {
    const farm = FarmModel(
      nama: 'Sapi',
      gambar: 'assets/images/img_sapi.png',
      deskripsi: 'Hewan ternak besar penghasil susu dan daging.',
      keunggulan: 'Ukuran besar, menghasilkan produk ternak berlimpah.',
      nilaiJual: 'Daging dan susu sapi bernilai ekonomi tinggi.',
    );

    test('membuat objek dengan semua field yang benar', () {
      expect(farm.nama, equals('Sapi'));
      expect(farm.gambar, equals('assets/images/img_sapi.png'));
      expect(farm.deskripsi, equals('Hewan ternak besar penghasil susu dan daging.'));
      expect(farm.keunggulan, equals('Ukuran besar, menghasilkan produk ternak berlimpah.'));
      expect(farm.nilaiJual, equals('Daging dan susu sapi bernilai ekonomi tinggi.'));
    });

    test('copyWith mengubah hanya field yang diberikan', () {
      final updated = farm.copyWith(nama: 'Kambing');
      expect(updated.nama, equals('Kambing'));
      // Field lain tetap sama
      expect(updated.gambar, equals(farm.gambar));
      expect(updated.deskripsi, equals(farm.deskripsi));
      expect(updated.keunggulan, equals(farm.keunggulan));
      expect(updated.nilaiJual, equals(farm.nilaiJual));
    });

    test('copyWith mengubah gambar saja', () {
      final updated = farm.copyWith(gambar: 'assets/images/img_kambing.png');
      expect(updated.gambar, equals('assets/images/img_kambing.png'));
      expect(updated.nama, equals(farm.nama));
    });

    test('copyWith tanpa argumen menghasilkan objek yang identik', () {
      final copy = farm.copyWith();
      expect(copy.nama, equals(farm.nama));
      expect(copy.gambar, equals(farm.gambar));
      expect(copy.deskripsi, equals(farm.deskripsi));
      expect(copy.keunggulan, equals(farm.keunggulan));
      expect(copy.nilaiJual, equals(farm.nilaiJual));
    });

    test('dua objek dengan nama sama dianggap equal', () {
      const other = FarmModel(
        nama: 'Sapi',
        gambar: 'assets/images/img_lain.png',
        deskripsi: 'Deskripsi berbeda.',
        keunggulan: 'Keunggulan lain.',
        nilaiJual: 'Nilai lain.',
      );
      expect(farm, equals(other));
    });

    test('dua objek dengan nama berbeda tidak equal', () {
      const other = FarmModel(
        nama: 'Kambing',
        gambar: 'assets/images/img_sapi.png',
        deskripsi: 'Hewan ternak besar penghasil susu dan daging.',
        keunggulan: 'Ukuran besar, menghasilkan produk ternak berlimpah.',
        nilaiJual: 'Daging dan susu sapi bernilai ekonomi tinggi.',
      );
      expect(farm, isNot(equals(other)));
    });

    test('hashCode konsisten dengan equality', () {
      const same = FarmModel(
        nama: 'Sapi',
        gambar: 'assets/images/img_lain.png',
        deskripsi: '-',
        keunggulan: '-',
        nilaiJual: '-',
      );
      expect(farm.hashCode, equals(same.hashCode));
    });

    test('toString menampilkan nama hewan', () {
      expect(farm.toString(), contains('Sapi'));
    });
  });
}
