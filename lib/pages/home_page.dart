import 'package:sansain/pages/account_page.dart';
import 'package:sansain/pages/cart_page.dart';
import 'package:sansain/widgets/CategoriesWidget.dart';
import 'package:sansain/widgets/HomeAppBar.dart';
import 'package:sansain/widgets/ItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [HomePageContent(), CartPage(), AccountPage()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        color: const Color(0xFFF6B512),
        buttonBackgroundColor: Color(0xFFF6B512), // Highlight warna latar belakang ikon aktif
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.account_circle_sharp, size: 30, color: Colors.white),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeAppBar(),
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color(0xFFF6B512),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 13),
                          hintText: 'Search here...',
                          prefixIcon: Icon(Icons.search), // Ikon pencarian di kiri
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Color(0xFFF6B512),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF6B512),
                  ),
                ),
              ),
              const CategoriesWidget(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Best Selling',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8), // Jarak antara teks dan ikon
                    Icon(
                      Icons.filter_list,
                      color: Colors.white, // Sesuaikan dengan tema kamu
                      size: 24,
                    ),
                  ],
                ),
              ),
              ItemsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
