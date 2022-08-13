import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_remit/controller/constants.dart';

class PackageDetail extends StatelessWidget {
  const PackageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/design.png'),
                    fit: BoxFit.cover)),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Choose The Package That’s\n',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            TextSpan(
                text: 'Right For You !',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: buttomColor)),
          ])),
          Card(
              elevation: 5,
              child: ListTile(
                title: Text('Monthly Package'),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Monthly Package',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                'Rs 3000',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                ),
                              ),
                              const Text("- Pick Up and Drop Service",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const Text("- Montlhy Blood Test",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const Text("- USG in every three months",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: buttomColor,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20)),
                                    onPressed: () {},
                                    child: const Text('Buy Now'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                ),
              )),
          Card(
              elevation: 5,
              child: ListTile(
                title: Text('Yearly Package'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Yearly Package',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                'Rs 8000',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                ),
                              ),
                              const Text("- Pick Up and Drop Service",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const Text("- Montlhy Blood Test",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const Text("- USG in every three months",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: buttomColor,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20)),
                                    onPressed: () {},
                                    child: const Text('Buy Now'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                ),
              )),
        ],
      ),
    )));
  }
}
