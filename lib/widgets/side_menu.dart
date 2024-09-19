import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          child: Container(
            color: const Color.fromARGB(255, 20, 101, 81),
            alignment: Alignment.center,
            child: const Text(
              '各種機能',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('プロフィール'),
          onTap: () {
            debugPrint('リストタイル A をタップしました');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('設定'),
          onTap: () {
            debugPrint('リストタイル B をタップしました');
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_center),
          title: const Text('ヘルプ'),
          onTap: () {
            debugPrint('リストタイル C をタップしました');
          },
        ),
        ListTile(
          leading: const Icon(Icons.description),
          title: const Text('利用規約'),
          onTap: () {
            debugPrint('リストタイル C をタップしました');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('ログアウト'),
          onTap: () {
            debugPrint('リストタイル C をタップしました');
          },
        ),
      ],
    );
  }
}
