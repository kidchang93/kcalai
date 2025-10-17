import 'package:flutter/material.dart';
import 'package:kcalai/models/button_model.dart';

class CustomButton extends StatelessWidget {

  final ButtonModel model;
  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
        onPressed: model.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: model.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
            side: model.borderColor != null
                ? BorderSide(color: model.borderColor!)
                : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (model.icon != null) ...[
              Icon(model.icon, color: model.textColor,),
              const SizedBox(width: 8,),
            ],
            Text(
              model.text,
              style: TextStyle(
                color: model.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )
    );
    return model.isExpanded ? Expanded(child: button) : button;
  }
}
