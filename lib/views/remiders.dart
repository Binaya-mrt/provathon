import 'package:flutter/material.dart';
import 'package:health_remit/controller/constants.dart';
import 'package:health_remit/controller/value_provider.dart';

import 'package:provider/provider.dart';

import '../../controller/reminder_controller.dart';

/// This contains nofiticatio screen.
/// It have list of notifications and can add new reminders clicking on floating action button.
/// Notification are stored in shared preferences as json String.

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  void initState() {
    super.initState();
    notificationPlugin.initializeNotification();
    fetchReminders();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Reminders'),
          backgroundColor: buttomColor,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttomColor,
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const SetReminder())));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Consumer<ValueProvider>(builder: (context, _reminders, child) {
              return reminders.isEmpty
                  ? Center(child: const Text('No any reminders...'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reminders.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: Text(
                            reminders[index].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(reminders[index].time.toString(),
                                  style: const TextStyle(fontSize: 20)),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  _reminders.deleteReminders(index);
                                },
                              )
                            ],
                          ),
                        );
                      });
            }),
          ]),
        )));
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {}

  onNotificationClick(String payload) {}
}

/// This screen is reminder adding screen.
/// User can choos time and title for reminder.
///
class SetReminder extends StatefulWidget {
  const SetReminder({Key? key}) : super(key: key);

  @override
  State<SetReminder> createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  final TextEditingController reminderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: reminderController,
                  cursorHeight: 20,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'Add reminder',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Consumer<ValueProvider>(builder: (context, time, child) {
              return Column(
                children: [
                  Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            time.reminderTime == null
                                ? 'Select Reminder time'
                                : time.reminderTime!,
                            style: const TextStyle(fontSize: 15),
                          ),
                          IconButton(
                              onPressed: () {
                                time.pickTime(context);
                              },
                              icon: const Icon(Icons.alarm_add_outlined))
                        ]),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (time.reminderTime != null) {
                          time.addReminder(
                              time.reminderTime, reminderController.text);
                          for (int i = 0; i < reminders.length; i++) {
                            await notificationPlugin.scheduledNotification(
                                hour:
                                    int.parse(reminders[i].time.split(":")[0]),
                                minutes:
                                    int.parse(reminders[i].time.split(":")[1]),
                                id: i + 4,
                                title: reminders[i].title);
                          }
                          Navigator.pop((context));
                        } else {
                          final snackBar = SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              content: const Text('Time not selected!'));
                        }
                      },
                      child: const Text('Save reminder'),
                      style: ElevatedButton.styleFrom(
                          primary: buttomColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            20,
                          ))),
                    ),
                  ),
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }
}
