import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_news_provider/page/home.dart';
import 'package:my_news_provider/provider/news_provider.dart';
import 'package:provider/provider.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  List<Widget> body = <Widget>[
    const Homescreen(),
  ];

  DateTime? currentBackPressTime;

  void _onTapNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => NewsData(),
          builder: (context, child) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'NewsApp',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_constructors
                backgroundColor: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                iconTheme: const IconThemeData(color: Colors.blueGrey),
              ),
              body: WillPopScope(
                  onWillPop: onWillPop, child: body.elementAt(_selectedIndex)),
              bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.blueGrey,
                  currentIndex: _selectedIndex,
                  onTap: _onTapNavBar,
                  // ignore: prefer_const_literals_to_create_immutables
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.category), label: 'TBA'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'TBA')
                  ]),
            );
          }),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tekan Dua Kali Untuk Keluar Aplikasi');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
