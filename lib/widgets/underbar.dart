import 'package:flutter/material.dart';

class Underbar extends StatelessWidget {
  const Underbar({
    super.key,
    required this.currentItemIndex,
  });

  final int currentItemIndex;

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'ホーム',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.hail),
      label: '回収',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.factory),
      label: '集積',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_shipping),
      label: '運搬',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.warehouse),
      label: '荷下し',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      backgroundColor: const Color.fromARGB(255, 20, 101, 81), // バーの色
      selectedItemColor: Colors.white, // 選ばれたアイテムの色
      unselectedItemColor: Colors.black, // 選ばれていないアイテムの色
      currentIndex: currentItemIndex,
      type: BottomNavigationBarType.fixed,
    );
  }
}
