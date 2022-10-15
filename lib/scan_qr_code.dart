


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Expanded(
            child: QRView(key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
                borderWidth: 10,
                borderLength: 10,
                borderRadius: 10,
              ),
            ),
          ),
          Text(
            barcode != null ? "${barcode!.code}" : "scan code",
            maxLines: 3,
          )
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
      controller.scannedDataStream
      .listen((barcode) {
        setState(() {
          this.barcode = barcode;

        });
      });

    });


  }
}
