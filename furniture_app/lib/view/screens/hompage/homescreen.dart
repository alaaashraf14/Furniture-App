import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../resources/conastants/colors.dart';

import 'categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool tags = false;
  List<String> categoryList = [
    "All",
    "Chair",
    "Sofa",
    "Lamp",
    "Kitchen",
    "Table",
  ];
  final furniture =
      FirebaseFirestore.instance.collection('furniture').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAccentColor,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.only(
                top: 64.0,
                left: 24.0,
                right: 24.0,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => print("Side Menu"),
                          child: IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black38,
                              size: 40,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () => print("Edit Profile"),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/mypic.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Find the \nBest",
                              style: TextStyle(
                                fontSize: 42.0,
                                color: Colors.black38,
                              ),
                            ),
                            TextSpan(
                              text: " Furniture!",
                              style: TextStyle(
                                fontSize: 42.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: kLightColor,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: const TextField(
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 34.0,
                                  color: kPrimaryColor,
                                ),
                                border: InputBorder.none,
                                hintText: "Search Furniture",
                                hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            categoryList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 32.0),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  currentIndex = index;
                                }),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      categoryList[index],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: currentIndex == index
                                            ? kPrimaryColor
                                            : Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    Container(
                                      height: currentIndex == index ? 4.0 : 0.0,
                                      width: 16.0,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 306.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 16.0,
                      ),
                      child: StreamBuilder(
                          stream: furniture,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Connection error');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text('Loading....');
                            }
                            var popularList = snapshot.data!.docs;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              // itemExtent: 4,
                              itemCount: popularList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        index,
                                        popularList[index]["image"],
                                        popularList[index]["price"],
                                        tags = true,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    height: 306.0,
                                    width: 230.0,
                                    margin: const EdgeInsets.only(right: 16.0),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14.0,
                                      horizontal: 14.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: kLightColor,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Hero(
                                              tag: "popularImage$index",
                                              child: Container(
                                                height: 180.0,
                                                width: 230.0,
                                                margin: const EdgeInsets.only(
                                                    bottom: 4.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        popularList[index]
                                                            ["image"]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 8.0,
                                              right: 8.0,
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 32.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          popularList[index]["name"],
                                          style: const TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: List.generate(
                                                  5,
                                                  (index) => const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "\$${popularList[index]["price"]}",
                                                style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ]),
            )));
  }
}
