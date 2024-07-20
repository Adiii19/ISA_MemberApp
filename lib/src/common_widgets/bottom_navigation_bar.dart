import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.lightBlue[100],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Ionicons.barcode_outline, color: Colors.white),
          ),
          label: 'Scan'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: ' Recent Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ribbon_sharp),
          label: 'Credits',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      onTap: onTap,
    );
  }
}
