  import 'package:flutter/material.dart';
  import 'pages/register_page.dart';
  import 'pages/login_page.dart';
  import 'pages/account_page.dart';
  import 'pages/cart_page.dart';
  import 'pages/home_page.dart';
  import 'pages/list_chat.dart';
  import 'pages/detail_chat.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'LoginPage',
        routes: {
            'LoginPage': (context) => const LoginPage(),
            'RegisterPage': (context) => const RegisterPage(),
            'AccountPage': (context) => const AccountPage(),
            'CartPage': (context) => const CartPage(),
            '/': (context) => const HomePage(),
            'ListChat': (context) => const ChatListChat(),
            'DetailChat': (context) => const DetailChat(contactName: 'Sansain Store',),
        },
      );
    }
  }
