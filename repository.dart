import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'models.dart';
import 'dart:io';

class ItemRepository{

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<List<Item>> readData() async {
    try {
      final file = await _localFile;
      String dataJson = await file.readAsString();

      List<Item> data = (json.decode(dataJson) as List)
          .map((i) => Item.fromJson(i)).toList();
      return data;
    } catch (e) {
      return List<Item>();
    }
  }

  Future<bool> saveData(List<Item> list) async {
    try {
      final file = await _localFile;
      final String data = json.encode(list);
      // Write the file
      file.writeAsString(data);
      return true;
    }catch(e){
      return false;
    }
  }
}