import 'package:flutter/material.dart';
import 'package:health_remit/controller/constants.dart';
import 'package:health_remit/views/package_detail.dart';
import 'package:health_remit/views/text.dart';

import 'card1.dart';
import 'expandable_text.dart';

class ClinicDetails extends StatelessWidget {
  static const routeName = '/food-detail';

  @override
  Widget build(BuildContext context) {
    final buttomBadding = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/clinic_image.png'),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(32),
                  //   bottomRight: Radius.circular(32),
                  // ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: buttomColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      // height: 40,
                      // width: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 13.0, right: 7, top: 8, bottom: 8),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300 - 32,
              left: 0,
              right: 0,
              // bottom: 0,
              child: Container(
                height: 844 - 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: double.maxFinite,

                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      // margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Card1(
                          Title1: 'Ashbin Clinic',
                          sizeTitle1: 24,
                          height: 10,
                          address: 'Bharatpur, Chitwan',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextWidget(text: 'About Clinic', size: 24),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 17),
                          child: SingleChildScrollView(
                            child: ExpandableText(
                                text:
                                    'hiufdiuegrugfuehurhfuiehruigeuhufheuhrgeuhfuiheurguehihguiehriugeuhgoiehvjoehroiguegjhfahduihfjkhsdhfiuhughejroiugehruihfiuhiugfyufhuiehiuefhuhuirhvehroiuehrughuvhjnfejhfgiuehrgeriejfohuehguheoirjgoiejfkeurhoiefjeoirhuehrughe'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PackageDetail()),
                  );
                },
                child: const Text(
                  'View Packages',
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                    primary: buttomColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(
                        horizontal: buttomBadding, vertical: 10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
