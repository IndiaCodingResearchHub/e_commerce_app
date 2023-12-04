 import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationAlert{
  static exitAppAlertDialog(BuildContext context) async {
    var device = MediaQuery.of(context).size.width;
    double heading = device > 600.0 ? 45 : 22;
    double subheading = device > 600 ? 40 : 20.0;
    double title = device > 600.0 ? 36 : 18;
    double subtitle = device > 600.0 ? 30 : 15;
    double sub2title = device > 600.0 ? 24 : 12;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Confirmation',
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.5,
              letterSpacing: .5,
              color: Colors.green,
            ),
          ),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            "Do you want to exit an App ?",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: subtitle,
              height: 1.2,
              letterSpacing: .5,
              color: Colors.red,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.orange,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:   Colors.orange,
                            )))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: GoogleFonts.raleway(
                    fontSize: subtitle,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: .5,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Colors.green,
                            )))),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: Text(
                  'Yes',
                  style: GoogleFonts.raleway(
                    fontSize: subtitle,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: .5,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
