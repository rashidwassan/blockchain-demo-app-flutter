import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoUtils {
  static String getSHA256(String data) {
    var bytes = utf8.encode(data);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
