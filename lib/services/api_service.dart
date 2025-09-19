import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';


class ApiService{
  static const baseUrl = "http://localhost:8080/api/photos";

  static Future<String> uploadPhoto(File imageFile) async{
    final uri = Uri.parse(baseUrl);
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path, filename: basename(imageFile.path))
    );

    var response = await request.send();

    if (response.statusCode == 200){
      return "업로드 성공";
    } else {
      throw Exception('업로드 실패: ${response.statusCode}');    }
  }
}