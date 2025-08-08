import 'package:flutter/material.dart';

class ChatListChat  extends StatelessWidget {
  const ChatListChat ({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Sansain Official',
        'message': 'Segera Memesan Sebelum Kehabisan',
        'time': '10:00',
        'avatar': 'assets/images/avatar/5.png',
      },
      {
        'name': 'Danish Official',
        'message': 'Segera Memesan Sebelum Kehabisan',
        'time': '10:00',
        'avatar': 'assets/images/avatar/6.png',
      },
      {
        'name': 'Toshiba Official',
        'message': 'Segera Memesan Sebelum Kehabisan',
        'time': '10:00',
        'avatar': 'assets/images/avatar/7.png',
      },
      {
        'name': 'Asus Official',
        'message': 'Segera Memesan Sebelum Kehabisan',
        'time': '10:00',
        'avatar': 'assets/images/avatar/8.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF6B512),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFFF6B512)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Semua',
                    style: TextStyle(
                      color: Color(0xFFF6B512),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Belum Dibaca',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 200, 63),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat['avatar']),
                    radius: 25,
                  ),
                  title: Text(
                    chat['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat['message']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat['time'],
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                   onTap: () {
                    Navigator.pushNamed(
                      context,
                      "DetailChat",
                      // arguments: {
                      //   'contactName': chat['name'],
                      //   'avatarAsset': chat['avatar'],
                      // },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
