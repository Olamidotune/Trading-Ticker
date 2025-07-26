import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? textColor;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
