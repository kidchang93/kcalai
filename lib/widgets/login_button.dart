import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/screen/login_screen.dart';

class LoginButton extends StatelessWidget{
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      // Navigator 로 화면 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen())
      );
    },
      child: const Text("로그인"),
    );
  }
}