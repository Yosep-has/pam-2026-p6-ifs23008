// lib/data/dummy_data.dart

import 'models/farm_model.dart';

/// Kelas untuk menyimpan data statis (dummy)
/// Menggunakan static method agar tidak perlu instansiasi
class DummyData {
  DummyData._();

  static List<FarmModel> getFarmData() {
    return const [
      FarmModel(
        nama: 'Ayam',
        gambar: 'assets/images/img_ayam.png',
        deskripsi:
        'Ayam merupakan unggas ternak yang paling umum dipelihara karena mudah dibudidayakan dan memiliki siklus produksi yang cepat.',
        keunggulan:
        'Pertumbuhan cepat, mudah dipelihara, dan cocok untuk usaha peternakan skala kecil maupun besar.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging dan telur yang menjadi sumber protein tinggi.',
      ),
      FarmModel(
        nama: 'Kambing',
        gambar: 'assets/images/img_kambing.png',
        deskripsi:
        'Kambing adalah hewan ruminansia kecil yang banyak dipelihara oleh peternak karena perawatannya relatif mudah.',
        keunggulan:
        'Tahan terhadap berbagai kondisi lingkungan dan biaya pemeliharaan relatif rendah.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging dan susu kambing yang bernutrisi.',
      ),
      FarmModel(
        nama: 'Sapi',
        gambar: 'assets/images/img_sapi.png',
        deskripsi:
        'Sapi merupakan hewan ternak besar yang banyak dimanfaatkan dalam industri peternakan dan pangan.',
        keunggulan:
        'Memiliki ukuran tubuh besar sehingga menghasilkan produk ternak dalam jumlah banyak.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging dan susu sapi.',
      ),
      FarmModel(
        nama: 'Domba',
        gambar: 'assets/images/img_domba.png',
        deskripsi:
        'Domba adalah hewan ternak yang sering dipelihara untuk diambil daging serta bulunya.',
        keunggulan:
        'Cepat berkembang biak dan dapat beradaptasi dengan berbagai kondisi lingkungan.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging dan wol.',
      ),
      FarmModel(
        nama: 'Kerbau',
        gambar: 'assets/images/img_kerbau.png',
        deskripsi:
        'Kerbau adalah hewan ternak besar yang sering dimanfaatkan dalam kegiatan pertanian tradisional.',
        keunggulan:
        'Memiliki tenaga kuat dan mampu bekerja di lahan berlumpur.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging dan tenaga untuk membantu pekerjaan pertanian.',
      ),
      FarmModel(
        nama: 'Bebek',
        gambar: 'assets/images/img_bebek.png',
        deskripsi:
        'Bebek adalah unggas ternak yang sering dipelihara untuk produksi telur dan daging.',
        keunggulan:
        'Tahan terhadap penyakit dan mampu menghasilkan telur dalam jumlah banyak.',
        nilaiJual:
        'Nilai jual utamanya berasal dari telur bebek dan dagingnya.',
      ),
      FarmModel(
        nama: 'Babi',
        gambar: 'assets/images/img_babi.png',
        deskripsi:
        'Babi merupakan hewan ternak yang memiliki pertumbuhan cepat dan produktivitas tinggi.',
        keunggulan:
        'Konversi pakan efisien dan reproduksi cepat.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging babi yang banyak digunakan dalam berbagai olahan makanan.',
      ),
      FarmModel(
        nama: 'Lebah',
        gambar: 'assets/images/img_lebah.png',
        deskripsi:
        'Lebah merupakan serangga yang dibudidayakan dalam peternakan lebah untuk menghasilkan madu.',
        keunggulan:
        'Membantu proses penyerbukan tanaman dan membutuhkan lahan yang relatif kecil.',
        nilaiJual:
        'Nilai jual utamanya berasal dari madu yang kaya manfaat kesehatan.',
      ),
      FarmModel(
        nama: 'Ikan',
        gambar: 'assets/images/img_ikan.png',
        deskripsi:
        'Ikan merupakan hewan air yang banyak dibudidayakan dalam kolam, tambak, maupun keramba.',
        keunggulan:
        'Siklus panen relatif cepat dan permintaan pasar tinggi.',
        nilaiJual:
        'Nilai jual utamanya berasal dari daging ikan yang kaya protein dan omega-3.',
      ),
      FarmModel(
        nama: 'Kuda',
        gambar: 'assets/images/img_kuda.png',
        deskripsi:
        'Kuda adalah hewan ternak yang dikenal memiliki kekuatan dan kecepatan tinggi.',
        keunggulan:
        'Memiliki stamina kuat dan sering digunakan untuk olahraga maupun transportasi.',
        nilaiJual:
        'Nilai jual utamanya berasal dari tenaga dan kemampuannya dalam aktivitas olahraga atau wisata.',
      ),
    ];
  }
}
