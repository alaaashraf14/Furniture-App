import 'package:flutter/material.dart';

import '../../../resources/conastants/colors.dart';
import '../cart/addtocart.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String image, price;
  final bool tags;
  const DetailsScreen(this.index, this.image, this.price, this.tags,
      {super.key});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1;
  bool isFav = false;
  Color colorIndex = kPrimaryColor;
  List<Color> colors = [
    kPrimaryColor,
    Colors.cyan,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor,
      bottomNavigationBar: Container(
        height: 64.0,
        decoration: BoxDecoration(
          color: colorIndex,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "\$ ${widget.price}",
                style: const TextStyle(
                  fontSize: 26.0,
                  color: kLightColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddToCard()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.tags == true
                      ? "popularImage${widget.index}"
                      : "bestImage${widget.index}",
                  child: Image.network(
                    widget.image,
                    height: 375.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 64.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kLightColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      IconButton(
                        onPressed: () => print("More Option"),
                        icon: const Icon(
                          Icons.more_vert,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 340.0,
                  child: Container(
                    height: 64.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: kAccentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 44.0,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      color: kLightColor,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: IconButton(
                      onPressed: () => setState(() {
                        isFav = !isFav;
                      }),
                      icon: Icon(
                        Icons.favorite,
                        size: 36.0,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: kAccentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Luxury Swedian \nChair",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
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
                        const SizedBox(width: 16.0),
                        const Text(
                          "(4.9)",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Size",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Height 120 cm",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              "Width 80 cm",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Treatment",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                "Jati Wood, Canvas",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                "Amazing Love",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Colors",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: List.generate(
                                colors.length,
                                (index) => GestureDetector(
                                  onTap: () => setState(() {
                                    colorIndex = colors[index];
                                  }),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    margin: const EdgeInsets.only(right: 16.0),
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count--;
                                        print("$count");
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 40.0,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    height: 38.0,
                                    width: 38.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: kLightColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      '$count',
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Roboto"),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                        print("$count");
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add_circle,
                                      size: 40.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
