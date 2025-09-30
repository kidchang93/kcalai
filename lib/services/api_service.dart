import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kcalai/models/prediction.dart';
import 'package:path/path.dart';


class ApiService{
  // static const baseUrl = "http://10.0.2.2:8000/predict";  // 에뮬레이터의 경우 이게 로컬 주소
  // static const baseUrl = "http://175.45.194.221:8000/api/predict";
  static final baseUrl = dotenv.env['API_URL'];

  static Future<List<Prediction>> uploadPhoto(File imageFile) async {
    final uri = Uri.parse("$baseUrl/api/predict");
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
      // 서버에서 내려준 JSON 파싱
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final predictionsJson = jsonData['predictions'] as List<dynamic>;
      return predictionsJson
        .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('업로드 실패: ${response.statusCode}');
    }
  }

  // static Future<String> predictResult() async {
  //
  // }
}