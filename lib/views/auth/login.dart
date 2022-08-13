import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_remit/apis/auth.dart';
import 'package:health_remit/controller/constants.dart';
import 'package:health_remit/views/auth/signup.dart';

import '../../controller/widgets.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextStyle headingStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final buttomPadding = MediaQuery.of(context).size.width * 0.2;
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset('assets/images/logo.png')),
            const SizedBox(height: 20),
            Text('LOGIN TO YOUR ACCOUNT', style: headingStyle),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailcontroller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_open),
                      labelText: 'Passowrd',
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    UserLogin(_emailcontroller.text, _passwordcontroller.text,
                        context);
                  },
                  // ignore: await_only_futures

                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: buttomColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: buttomPadding, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    'New? Sign Up!',
                    style: TextStyle(color: buttomColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
