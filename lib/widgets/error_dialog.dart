import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      title: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          child: Icon(Icons.close),
          onTap: () => Navigator.pop(context),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FontAwesomeIcons.circleExclamation),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'STAY SAFE',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mulish',
                color: Colors.black),
          ),
          SizedBox(
            height: 29,
          ),
          Text(
            'Let\'s remember to put on our face mask and follow COVID-19 guidelines while handing over or interacting with your delivery driver.',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mulish',
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 43,
          ),
        ],
      ),
    );
  }
}
