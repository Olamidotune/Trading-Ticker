import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.busy = false,
    this.pill = false,
    this.deleteButton = false,
    this.isWeb = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool busy;
  final bool pill;
  final bool deleteButton;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          enableFeedback: true,
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return buttonColor.withOpacity(0.5);
              } else if (states.contains(WidgetState.disabled)) {
                return buttonColor.withOpacity(0.5);
              }
              return buttonColor;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: deleteButton
                    ? Colors.red
                    : buttonColor == Colors.white
                        ? Colors.blue
                        : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(pill ? 50 : 10),
            ),
          ),
        ),
        child: busy
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: isWeb ? 24 : 16,
                      color: deleteButton
                          ? Colors.red
                          : buttonColor == Colors.white
                              ? Colors.blue
                              : textColor,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
