import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ByteCodeImage extends StatelessWidget {
  const ByteCodeImage({key, required this.byteCode});
  final String byteCode;

  Uint8List getDecodedCode(String byteCode) {
    return base64Decode(byteCode.split(',').last);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.memory(
        getDecodedCode(byteCode),
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
