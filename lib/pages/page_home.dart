import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test002/widgets/side_menu.dart';
import 'package:test002/widgets/header.dart';
import 'package:test002/widgets/underbar.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screensize = MediaQuery.of(context).size;

    void pushToSyusyu() {
      context.push('/syusyu'); // buildメソッド内でcontextを使用
    }

    const appBar = Header(
      title: 'WCM',
      // サイズを引数にする処理を追加する必要あり
    );

    const drawer = Drawer(
      child: SideMenu(),
    );

    Widget body(Size screensize) {
      return Container(
        color: const Color.fromARGB(255, 237, 237, 237),
        child: Column(
          children: [
            SizedBox(
              width: screensize.width,
              height: screensize.height * 0.02,
            ),
            SizedBox(
              width: 340,
              height: screensize.height * 0.18,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(2, 5),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: screensize.height * 0.18,
                      ),
                      SizedBox(
                        width: screensize.height * 0.14,
                        height: screensize.height * 0.14,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 20, 101, 81),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: screensize.height * 0.08,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                        height: screensize.height * 0.18,
                      ),
                      SizedBox(
                        width: 340 - 50 - (screensize.height * 0.14),
                        height: screensize.height * 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '石川敦大',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '株式会社イーシス',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 69, 69, 69),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 340,
              height: screensize.height * 0.4,
            ),
            SizedBox(
              width: 340,
              height: screensize.height * 0.08,
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    pushToSyusyu(); // contextを利用したメソッドを呼び出し
                    debugPrint('収集ページへ移動');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 20, 101, 81),
                      foregroundColor: Colors.white,
                      minimumSize: Size(340, screensize.height * 0.08)),
                  child: const Text('収集開始'),
                ),
              ),
            ),
            SizedBox(
              width: 340,
              height: screensize.height * 0.02,
            ),
          ],
        ),
      );
    }

    const underBar = Underbar(currentItemIndex: 0);

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: body(screensize),
      bottomNavigationBar: underBar,
    );
  }
}
