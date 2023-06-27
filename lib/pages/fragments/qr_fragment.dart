import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRFragment extends StatelessWidget {
  final BuildContext context;
  final String qrCode;
  final Function onRefresh;

  const QRFragment({
    super.key,
    required this.context,
    required this.qrCode,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10.0),
        Expanded(
          child: qrCode != '' ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: QrImageView(
                  data: qrCode,
                  version: QrVersions.auto,
                  size: 250,
                  gapless: false,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Tunjukan QR Anda kepada petugas kami',
                textAlign: TextAlign.center,
              ),
            ],
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tidak dapat menampilkan QR',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () => onRefresh(),
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.refresh,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}