import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test002/widgets/header.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// 状態管理を可能にするためのラップ
class SyuSyu001screen extends ConsumerStatefulWidget {
  const SyuSyu001screen({super.key});

  @override
  _SyuSyu001screenState createState() => _SyuSyu001screenState();
}

// UIを定義　<SyuSyu001screen>は上で指定した状態管理機能をこちらでも適用させるためにある
class _SyuSyu001screenState extends ConsumerState<SyuSyu001screen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText = 'QRコードを読み取ってください';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    const appBar = Header(
      title: 'WCM',
    );

    Widget body(Size screensize) {
      return Container(
        color: const Color.fromARGB(255, 237, 237, 237),
        child: Column(
          children: [
            SizedBox(height: screensize.height * 0.11),
            SizedBox(
              width: screensize.width,
              height: screensize.height * 0.4,
              child: Column(
                children: [
                  const Text(
                    '「排出事業者」',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 20, 101, 81)),
                  ),
                  SizedBox(height: screensize.height * 0.2),
                  Icon(
                    Icons.qr_code,
                    color: const Color.fromARGB(255, 20, 101, 81),
                    size: screensize.height * 0.15,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    qrText ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 20, 101, 81)),
                  ),
                ],
              ),
            ),
            SizedBox(height: screensize.height * 0.11),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QRViewExample()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 20, 101, 81),
                  foregroundColor: Colors.white,
                  minimumSize: Size(340, screensize.height * 0.08)),
              child: const Text('読み込み開始'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: body(screensize),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRコードスキャン')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(qrText ?? 'QRコードをスキャンしてください'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
