import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home.dart';

void main() {
  // 환경변수 파일 설정
  // const env = String.fromEnvironment('ENV', defaultValue: 'dev'); // 기본 dev
  // await dotenv.load(fileName: '.env.de.$env');
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

  }
}


