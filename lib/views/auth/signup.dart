import 'package:flutter/material.dart';
import 'package:health_remit/apis/auth.dart';
import 'package:health_remit/controller/constants.dart';

import '../../controller/widgets.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final TextStyle headingStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final buttomBadding = MediaQuery.of(context).size.width * 0.3;
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset('assets/images/logo.png')),
                const SizedBox(height: 20),
                Text('CREATE YOU ACCOUNT', style: headingStyle),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_open),
                          labelText: 'Passowrd',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        createUser(_emailcontroller.text,
                            _passwordcontroller.text, context);
                      },
                      // ignore: await_only_futures

                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: buttomColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: buttomBadding, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class Signup extends StatelessWidget {
//   const Signup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: Image.asset('assets/images/logo.png')),
//             const SizedBox(height: 20),
//             Text(
//               'CREATE YOU ACCOUNT',
//             ),
//             Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.lock_open),
//                   labelText: 'Passowrd',
//                   labelStyle: const TextStyle(
//                     fontSize: 17,
//                     color: Colors.grey,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//     ));
//   }
// }
