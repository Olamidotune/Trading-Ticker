import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? textColor;
  final String? suffix;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
    this.textColor,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: RichText(
            text: TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    textColor ?? Theme.of(context).textTheme.bodyMedium!.color,
              ),
              children: suffix != null
                  ? [
                      TextSpan(
                        text: " $suffix",
                        style: TextStyle(
                          color: textColor ??
                              Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withValues(alpha: .6),
                        ),
                      ),
                    ]
                  : [],
            ),
          ),
        )
        //   child: Text(
        //     value,
        //     textAlign: TextAlign.right,
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: textColor ?? Theme.of(context).textTheme.bodyMedium!.color,
        //     ),
        //   ),
        // ),
        // suffix != null
        //     ? Flexible(
        //         child: Text(
        //           suffix ?? '',
        //           textAlign: TextAlign.right,
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: textColor ??
        //                 Theme.of(context)
        //                     .textTheme
        //                     .bodyMedium!
        //                     .color!
        //                     .withValues(alpha: .3),
        //           ),
        //         ),
        //       )
        //     : Text('hwew')
      ],
    );
  }
}
