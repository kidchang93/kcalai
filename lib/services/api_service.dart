import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';


class ApiService{
  static const baseUrl = "http://10.0.2.2:8000/predict";  // 에뮬레이터의 경우 이게 로컬 주소

  static Future<String> uploadPhoto(File imageFile) async{
    final uri = Uri.parse(baseUrl);
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          filename: basename(imageFile.path)
      )
    );

    // 서버 응답 받기
    var streamedResponse = await request.send();
    // 스트림을 실제 Response로 변환
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200){
      return "업로드 성공";
    } else {
      throw Exception('업로드 실패: ${response.statusCode}');    }
  }

  // static Future<String> predictResult() async {
  //
  // }
}