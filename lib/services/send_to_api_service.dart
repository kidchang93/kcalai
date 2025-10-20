import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/screen/result_screen.dart';
import 'package:kcalai/services/api_service.dart';

class SendToAPIService {
  static Future<void> sendPhotoToAPI(BuildContext context, XFile imageFile ) async {
    try {

      final predictions = await ApiService.uploadPhoto(
        File(imageFile.path),
      );

      if (!context.mounted) return; // ✅ context 안전성 보장

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(predictions: predictions),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}