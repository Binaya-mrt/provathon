import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_remit/controller/constants.dart';
import 'package:health_remit/views/auth/login.dart';
import 'package:health_remit/views/home.dart';
import 'package:health_remit/views/nav.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:http/http.dart' as http;

void createUser(String email, String password, BuildContext context) async {
  print(email);
  Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  try {
    Future<dynamic> loadingDialog() {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: color,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text('Signing you up...'),
                ),
              ],
            ),
          );
        },
      );
    }

    var response = await http.post(
      Uri.parse(
        '$host' + 'users/signup/',
      ),
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } else {
      throw Exception();
    }
  } catch (e) {
    print(e);
  }
}

void UserLogin(String email, String password, BuildContext context) async {
  print(email);
  Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  // try {
  //   Future<dynamic> loadingDialog() {
  //     return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           content: Row(
  //             children: [
  //               const CircularProgressIndicator(
  //                 color: color,
  //               ),
  //               Container(
  //                 margin: const EdgeInsets.only(left: 5),
  //                 child: Text('Signing you up...'),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   }

  //   var response = await http.post(
  //     Uri.parse(
  //       '$host' + 'users/login/',
  //     ),
  //     body: json.encode(data),
  //     headers: {"Content-Type": "application/json"},
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("id", 2);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => ButtomNavScreen(),
    ),
  );
  //   } else {
  //     throw Exception();
  //   }
  // } catch (e) {
  //   print(e);
  // }
}
