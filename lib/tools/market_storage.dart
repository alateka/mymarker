import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import '../models/cart_item.dart';

class MarketStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/mymarker.json');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final String fileData = await file.readAsString();
      return fileData;
    } catch (e) {
      return "";
    }
  }

  Future<File> rewriteFile(List<CartItem> cart) async {
    createListFile();
    final file = await _localFile;
    String convertedJSON = jsonEncode(cart);
    return file.writeAsString(convertedJSON);
  }

  Future<File> createListFile() async {
    final file = await _localFile;
    return file.writeAsString("");
  }
}
