import '/pages/login_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEBA17),
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/c (1).jpeg'),
              ),
              const SizedBox(height: 10),
              const ListTile(
                title: Text(
                  'Rizky Adiwijaya',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  '0813 4335 8738',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              _buildProfileItem(
                context,
                'Pengaturan Profil',
                'Ubah foto, informasi pribadi, dll',
                CupertinoIcons.person,
              ),
              _buildProfileItem(
                context,
                'Pengaturan Keamanan',
                'Ubah kata sandi atau aktivasi 2FA',
                CupertinoIcons.lock,
              ),
              _buildProfileItem(
                context,
                'Pengaturan Notifikasi',
                'Kelola notifikasi yang diterima',
                CupertinoIcons.bell,
              ),
              _buildProfileItem(
                context,
                'Pusat Bantuan',
                'Baca artikel bantuan atau hubungi kami',
                CupertinoIcons.question_circle,
              ),
              _buildProfileItem(
                context,
                'Syarat & Ketentuan',
                'Baca syarat dan ketentuan kami',
                CupertinoIcons.book,
              ),
              _buildProfileItem(
                context,
                'Privacy Notice',
                'Baca kebijakan privasi kami',
                CupertinoIcons.shield,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Aksi logout
                    _showLogoutDialog(context);
                  },
                  child: const Text(
                    'Keluar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData iconData,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Aksi ketika item diklik
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title diklik')),
          );
        },
      ),
    );
  }

 void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              // Navigasi ke halaman Home dengan menghapus semua halaman sebelumnya
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Anda telah logout')),
              );
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
}