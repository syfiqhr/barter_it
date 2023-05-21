import 'package:barter_it/screens/profiletabscreen.dart';
import 'package:barter_it/screens/sellertabscreen.dart';
import 'package:flutter/material.dart';
import '../newscreen.dart';
import 'profilescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> tabChildren;
  int _currentIndex = 0;
  String maintitle = "Buyer";
  
@override
void initState() {
  super.initState();
  print("Buyer");
  tabChildren = const[
    ProfileScreenn(),
    SellerTabScreen(),
    ProfileTabScreen(),
    NewTabScreen(),
  ];
}

@override
void dispose() {
  super.dispose();
  print("dispose");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text(maintitle)),
      body: tabChildren[_currentIndex],
      bottomNavigationBar : BottomNavigationBar ( 
        onTap: onTabTapped,
        type : BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
         items: const [
     BottomNavigationBarItem(
      icon: Icon (
      Icons.attach_money,
    ), //Icon
    label : "Buyer"), 
    
      BottomNavigationBarItem(
      icon: Icon (
      Icons.store_mall_directory,
    ), //Icon
    label : "Seller"), 
    
      BottomNavigationBarItem(
      icon: Icon (
      Icons.person,
    ), //Icon
    label : "Profile"),
    
      BottomNavigationBarItem(
      icon: Icon (
      Icons.newspaper,
    ), //Icon
    label : "News"), 
    ]),
    );
  }
 
  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
      if (_currentIndex == 0 ) {
        maintitle = "Buyer";
      }
       if (_currentIndex == 0 ) {
        maintitle = "Seller";
      }
       if (_currentIndex == 0 ) {
        maintitle = "Profile";
      }
       if (_currentIndex == 0 ) {
        maintitle = "News";
      }
    });
  }
 
}