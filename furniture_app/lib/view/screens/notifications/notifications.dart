import 'package:flutter/material.dart';

import '../../../resources/conastants/listofitems.dart';
import '../../widgets/public_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const PublicText(
            txt: 'Notifications',
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.grey[50],
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:  notifiationsList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(notifiationsList[index]["image"]),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifiationsList[index]["text1"],
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            notifiationsList[index]["text2"],
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )

        );
  }
}
