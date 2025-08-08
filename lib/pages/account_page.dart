import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: const Color(0xFFF6B512),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildProfileSection(),
                const SizedBox(height: 30),
                _buildSettingSection(context),
                const SizedBox(height: 100),
              ],
            ),
          ),

          // // ✅ Custom Bottom Navigation
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Stack(
          //     clipBehavior: Clip.none,
          //     children: [
          //       Container(
          //         height: 80,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(30),
          //             topRight: Radius.circular(30),
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black12,
          //               blurRadius: 10,
          //               offset: Offset(0, -1),
          //             ),
          //           ],
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             IconButton(
          //               icon: const Icon(Icons.home_outlined, color: Colors.grey),
          //               onPressed: () {
          //                 Navigator.pushNamed(context, '/home');
          //               },
          //             ),
          //             IconButton(
          //               icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          //               onPressed: () {
          //                 Navigator.pushNamed(context, 'CartPage');
          //               },
          //             ),
          //             const SizedBox(width: 60), // Kosong untuk profile
          //           ],
          //         ),
          //       ),

          //       // ✅ Floating Profile Button
          //       Positioned(
          //         right: 50,
          //         bottom: 30,
          //         child: Container(
          //           height: 60,
          //           width: 60,
          //           decoration: const BoxDecoration(
          //             color: Color(0xFFF6B512),
          //             shape: BoxShape.circle,
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black26,
          //                 blurRadius: 6,
          //                 offset: Offset(0, 3),
          //               ),
          //             ],
          //           ),
          //           child: IconButton(
          //             icon: const Icon(Icons.person_outline, color: Colors.white),
          //             onPressed: () {
          //               // Profil sudah aktif, bisa kasih toast
          //               ScaffoldMessenger.of(context).showSnackBar(
          //                 const SnackBar(
          //                   content: Text("You're on Profile page"),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF6B512), Color(0xFFE67E22)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/profile.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Husain A',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'husain.abdurrahim.30@gmail.com', // danishnurwahid1022011
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFFF6B512), size: 28),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSettingSection(BuildContext context) {
    return Column(
      children: [
        _buildSettingItem(
          context,
          icon: Icons.person_outline,
          title: 'Profile',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("You are already on the Profile page"),
              ),
            );
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.lock_outline,
          title: 'Change Password',
          onTap: () {
            Navigator.pushNamed(context, '/changePassword');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.notifications_outlined,
          title: 'Notification',
          onTap: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {
            Navigator.pushNamed(context, '/help');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.logout,
          title: 'Logout',
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Logout Successful"),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pushNamed(context, 'LoginPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6B512),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
