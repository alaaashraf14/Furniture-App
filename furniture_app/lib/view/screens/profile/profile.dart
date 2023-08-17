import 'package:flutter/material.dart';

import '../../../resources/conastants/listofitems.dart';
import '../../widgets/public_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PublicText(
          txt: 'Profile',
          size: 24,
          fw: FontWeight.w400,
          ff: "Cambo",
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black38,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.black38,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/mypic.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    PublicText(
                      txt: 'Alaa Ashraf Hassan',
                      size: 16,
                      fw: FontWeight.w500,
                      ff: "Roboto",
                      color: Colors.black,
                    ),
                    PublicText(
                      txt: 'alaaashraf347@gmail.com',
                      size: 14,
                      fw: FontWeight.w400,
                      ff: "Roboto",
                      color: Colors.black38,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: pofileList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                      height: 20,
                      color: Colors.white,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pofileList[index]["text1"],
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Roboto",
                                          color: Colors.black),
                                    ),
                                    Text(
                                      pofileList[index]["text2"],
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                size: 30,
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
