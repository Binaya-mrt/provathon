import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:health_remit/controller/reminder_controller.dart';
import 'package:health_remit/controller/value_provider.dart';
import 'package:health_remit/views/auth/login.dart';
import 'package:health_remit/views/auth/signup.dart';
import 'package:health_remit/views/clinicDetails.dart';
import 'package:health_remit/views/home.dart';
import 'package:health_remit/views/nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_remit/views/profile.dart';
import 'package:health_remit/views/remiders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(Home());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  notificationPlugin.initializeNotification();
  await fetchReminders();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //  SharedPreferences prefs = await SharedPreferences.getInstance();

  var logid = prefs.getInt("id");
  print(logid);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ValueProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          color: Color(0xffefefef),
          home: logid == null ? Login() : ButtomNavScreen()),
    ),
  );
}


// efefef
// 293CE1