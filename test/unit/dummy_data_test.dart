// test/unit/dummy_data_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:pam_2026_p6_ifs23008/data/dummy_data.dart';
import 'package:pam_2026_p6_ifs23008/data/models/farm_model.dart';

void main() {
  group('DummyData.getFarmData()', () {
    late List<FarmModel> farms;

    setUp(() {
      farms = DummyData.getFarmData();
    });

    test('mengembalikan list yang tidak kosong', () {
      expect(farms, isNotEmpty);
    });

    test('mengembalikan minimal 10 hewan ternak', () {
      expect(farms.length, greaterThanOrEqualTo(10));
    });

    test('semua hewan memiliki nama yang tidak kosong', () {
      for (final farm in farms) {
        expect(farm.nama, isNotEmpty,
            reason: 'Nama tidak boleh kosong untuk: ${farm.nama}');
      }
    });

    test('semua hewan memiliki path gambar yang valid', () {
      for (final farm in farms) {
        expect(farm.gambar, startsWith('assets/images/'),
            reason: 'Path gambar tidak valid untuk: ${farm.nama}');
        expect(farm.gambar, endsWith('.png'),
            reason: 'Gambar harus berformat .png untuk: ${farm.nama}');
      }
    });

    test('semua hewan memiliki deskripsi yang tidak kosong', () {
      for (final farm in farms) {
        expect(farm.deskripsi, isNotEmpty,
            reason: 'Deskripsi kosong untuk: ${farm.nama}');
      }
    });

    test('semua hewan memiliki keunggulan yang tidak kosong', () {
      for (final farm in farms) {
        expect(farm.keunggulan, isNotEmpty,
            reason: 'Keunggulan kosong untuk: ${farm.nama}');
      }
    });

    test('semua hewan memiliki nilaiJual yang tidak kosong', () {
      for (final farm in farms) {
        expect(farm.nilaiJual, isNotEmpty,
            reason: 'NilaiJual kosong untuk: ${farm.nama}');
      }
    });

    test('tidak ada nama hewan yang duplikat', () {
      final namaList = farms.map((f) => f.nama).toList();
      final namaSet = namaList.toSet();
      expect(namaSet.length, equals(namaList.length),
          reason: 'Ditemukan nama hewan yang duplikat');
    });

    test('data "Sapi" terdapat dalam list', () {
      final sapi = farms.where((f) => f.nama == 'Sapi').firstOrNull;
      expect(sapi, isNotNull);
      expect(sapi!.gambar, contains('sapi'));
    });

    test('data "Ayam" terdapat dalam list', () {
      final ayam = farms.where((f) => f.nama == 'Ayam').firstOrNull;
      expect(ayam, isNotNull);
      expect(ayam!.gambar, contains('ayam'));
    });

    test('filter pencarian berdasarkan nama bekerja dengan benar', () {
      final hasil = farms
          .where((f) => f.nama.toLowerCase().contains('kambing'))
          .toList();
      expect(hasil.length, equals(1)); // hanya Kambing
    });

    test('memanggil getFarmData dua kali menghasilkan data yang sama', () {
      final farms2 = DummyData.getFarmData();
      expect(farms.length, equals(farms2.length));
      for (int i = 0; i < farms.length; i++) {
        expect(farms[i].nama, equals(farms2[i].nama));
      }
    });
  });
}
