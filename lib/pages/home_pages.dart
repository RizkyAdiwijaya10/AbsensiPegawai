import '/pages/izin_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/pages/profil_pages.dart';
import '/pages/absen_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  // Format jam saat ini
  String getCurrentTime() {
    return DateFormat.Hm().format(DateTime.now());
  }

  // Format tanggal hari ini dalam bahasa Indonesia
  String getCurrentDate() {
    initializeDateFormatting('id_ID', null);
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderProfil(context),
            _buildDateTimeInfo(),
            _buildMainMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderProfil(BuildContext context) {
    return Container(
      height: 275,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE45D0B),
            Color(0xFFFFDE59),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilPage()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/c (1).jpeg'),
              radius: 50,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Rizky Adiwijaya S.kom, M.H',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Text(
            '12123242345526',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Kepala Dinas Kominfo',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getCurrentDate(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                getCurrentTime(),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Jam Masuk: 07:30',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Jam Pulang: 16:00',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenu(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Baris pertama (Absensi dan Izin)
            Expanded(
              child: Row(
                children: [
                  _buildMenuCard(
                    icon: Icons.fingerprint,
                    title: 'Absensi',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AbsensiPage()),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  _buildMenuCard(
                    icon: Icons.assignment_outlined,
                    title: 'Izin',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IzinPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Baris kedua (Statistik dan Riwayat)
            Expanded(
              child: Row(
                children: [
                  _buildMenuCard(
                    icon: Icons.bar_chart,
                    title: 'Statistik',
                    color: Colors.green,
                    onTap: () =>
                        _showSnackbar(context, 'Menu Statistik diklik'),
                  ),
                  const SizedBox(width: 15),
                  _buildMenuCard(
                    icon: Icons.history,
                    title: 'Riwayat',
                    color: Colors.purple,
                    onTap: () => _showSnackbar(context, 'Menu Riwayat diklik'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}