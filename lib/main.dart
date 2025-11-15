import 'package:flutter/material.dart';
import 'pages/product_grid.dart';
import 'pages/student_profile.dart';
import 'pages/contact_list.dart';
import 'pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI/UX Kuis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProductGridPage(),
    ProfilMahasiswaPage(),
    ContactListPage(),
    DashboardPage(),
  ];

  final List<String> _pageTitles = [
    'Produk Grid',
    'Profil Mahasiswa',
    'Daftar Kontak',
    'Dashboard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_currentIndex]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 12),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view, size: 24),
              activeIcon: Icon(Icons.grid_view, size: 24, color: Colors.blue),
              label: 'Grid',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24),
              activeIcon: Icon(Icons.person, size: 24, color: Colors.blue),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts, size: 24),
              activeIcon: Icon(Icons.contacts, size: 24, color: Colors.blue),
              label: 'Kontak',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, size: 24),
              activeIcon: Icon(Icons.dashboard, size: 24, color: Colors.blue),
              label: 'Dashboard',
            ),
          ],
        ),
      ),
    );
  }
}