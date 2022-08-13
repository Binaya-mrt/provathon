import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_remit/controller/constants.dart';
import 'package:health_remit/controller/reminder_controller.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This change notifier is used with provider Statemanagement.
/// A value here can be used in any page with help of provider.
class ValueProvider extends ChangeNotifier {
  /// Method to select date of birth in registration screen and [_date] is set a per selected value.

  /// method to show password in registration field.
  /// When user clicks on eye icon, password will be shown in registration field and vice versa

  bool obscure = true;

  Icon icon = const Icon(FontAwesomeIcons.eye);
  void obsecure() {
    obscure = !obscure;
    obscure == true
        ? icon = const Icon(
            FontAwesomeIcons.eye,
            color: color,
          )
        : icon = const Icon(
            FontAwesomeIcons.eyeSlash,
            color: color,
          );

    notifyListeners();
  }

  /// Function to clear the value stored in state.
  void clearValue() {
    obscure = false;
    reminderTime = null;
    notifyListeners();
  }

  String? reminderTime;
  void pickTime(context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Select a time",
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      DateTime time = DateFormat("hh:mm a").parse(newTime.format(context));
      reminderTime = DateFormat.Hm().format(time);
      notifyListeners();
    }
  }

  void addReminder(time, title) async {
    fetchReminders();

    final prefs = await SharedPreferences.getInstance();
    reminders.sort((a, b) => a.time.compareTo(b.time));

    reminders = List.from(reminders)..add(Reminder(time, title));
    reminders.sort((a, b) => a.time.compareTo(b.time));

    var reminderJson = jsonEncode(reminders);
    await prefs.setString('reminderString', reminderJson);
    clearValue();
    notifyListeners();
  }

  void deleteReminders(int index) async {
    fetchReminders();
    final prefs = await SharedPreferences.getInstance();
    reminders.removeAt(index);
    reminders.sort((a, b) => a.time.compareTo(b.time));

    var reminderJson = jsonEncode(reminders);
    await prefs.setString('reminderString', reminderJson);

    notifyListeners();
  }
}

List<Reminder> reminders = [];
fetchReminders() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('reminderString') != null) {
    List<Reminder> savedReminders =
        (json.decode((prefs.getString('reminderString')!)) as List)
            .map((data) => Reminder.fromJson(data))
            .toList();
    log(savedReminders.length.toString());
    reminders = savedReminders;
    reminders.sort((a, b) => a.time.compareTo(b.time));
  }
}
