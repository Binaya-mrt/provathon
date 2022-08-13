import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_remit/controller/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttomBadding = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://scontent.fktm8-1.fna.fbcdn.net/v/t39.30808-6/271839165_2116451285176654_8567766091346120154_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=GDYrOpiyKnkAX8cIBph&_nc_ht=scontent.fktm8-1.fna&oh=00_AT_OfwfS5sH53emW0K8XifBzhtayhGJNYZZJhYcqr2LYVA&oe=62FBE663'),
                      fit: BoxFit.cover,
                    ),
                    color: buttomColor,
                  ),
                ),
              ],
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: const Text("Name"),
                subtitle: const Text("Dr. Joe"),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://scontent.fktm8-1.fna.fbcdn.net/v/t39.30808-6/271839165_2116451285176654_8567766091346120154_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=GDYrOpiyKnkAX8cIBph&_nc_ht=scontent.fktm8-1.fna&oh=00_AT_OfwfS5sH53emW0K8XifBzhtayhGJNYZZJhYcqr2LYVA&oe=62FBE663'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                  title: const Text("Phone"),
                  subtitle: const Text("+977-9865259306"),
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.black,
                  )),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                  title: const Text("Email"),
                  subtitle: const Text("djoe@gmail.com"),
                  leading: Icon(
                    FontAwesomeIcons.envelope,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Update Profile',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  primary: buttomColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(
                      horizontal: buttomBadding, vertical: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
