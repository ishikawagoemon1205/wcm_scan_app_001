import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 20, 101, 81),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      elevation: 3.0,
      centerTitle: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                debugPrint('通知アイコンがタップされました');
              },
            ),
            Positioned(
              right: 2,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 20.0,
                  maxHeight: 20.0,
                ),
                child: const Center(
                  child: Text(
                    '5', // 通知数をここに表示
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
