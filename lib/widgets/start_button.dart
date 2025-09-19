import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/main_screen.dart';

class StartButton extends StatelessWidget{
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      // Navigator 로 화면 이동
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen())
      );
    },
      child: const Text("시작하기"),
    );
  }
}