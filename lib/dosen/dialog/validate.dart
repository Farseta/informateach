// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:informateach/dosen/landingPage.dart';

class ValidateTicketDialog extends StatefulWidget {
  const ValidateTicketDialog({super.key});

  @override
  State<ValidateTicketDialog> createState() => _ValidateTicketDialogState();
}

class _ValidateTicketDialogState extends State<ValidateTicketDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 44, vertical: 17),
        height: 200,
        width: 330,
        decoration: ShapeDecoration(
          color: Color(0xFF27374D),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF27374D)),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sing Jelas Lah",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(
          //   height: 11,
          // ),
          // Text(
          //   "Please don't be late and make sure to validate attendance! Appointment cancellations can only be made a maximum of 1 hour before the appointment!",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontFamily: 'Quicksand',
          //     color: Colors.white,
          //     fontSize: 12,
          //   ),
          // ),
          SizedBox(
            height: 13,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyAppDosen(initialPage: 0)));
              },
              child: Container(
                width: 280,
                height: 15,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: Text(
                  "Sing jelas sing jelas kontol",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF27374D),
                    fontSize: 12,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
