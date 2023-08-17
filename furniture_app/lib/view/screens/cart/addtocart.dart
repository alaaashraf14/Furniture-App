import 'package:flutter/material.dart';

import '../../../resources/conastants/colors.dart';
import '../../../resources/conastants/listofitems.dart';
import '../../widgets/public_button.dart';
import '../../widgets/public_text.dart';

import '../congrates/congrates.dart';


class AddToCard extends StatefulWidget {
  const AddToCard({super.key});

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const PublicText(
            txt: 'My cart',
            size: 24,
            fw: FontWeight.w600,
            ff: "Petrona",
            color: Colors.black,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black38,
              size: 40,
            ),
              onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                 
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 170,
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              
                              image: DecorationImage(
                                image: AssetImage(popularList[index]["image"]),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularList[index]["name"],
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    color: Colors.black38),
                              ),
                              Text(
                                "\$${popularList[index]["price"]}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Roboto",
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                                      size: 25.0,
                                      color: Colors.black38,
                                    ),
                                  ),
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                        print("$count");
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add_circle,
                                      size: 25.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            children: [
                              Icon(
                                Icons.cancel,
                                size: 25,
                              ),
                            
                            ],
                          ),
                         
                         
                        ],
                      ),
                    );
                  },
                ),
                 const SizedBox(
                                height: 10,
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
                             suffixIcon: Icon(
                                  Icons.chevron_right_outlined,
                              size: 34.0,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter your promo code",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
               
                  ],
                ),
                     const Padding(
                     padding: EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 8.0,
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      
                      Text("Total:",style: TextStyle(color: Colors.black38,fontSize: 18,fontWeight: FontWeight.w700,fontFamily: "Roboto"),),
                        Text( "\$${' 95.00'}",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "Roboto"),),
                      
                      
                      
                                       ],
                                       
                                       ),
                    ),
                       PublicButton(
                      title: "Submit Order ",
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      width: 200,
                      height: 40,
                      borderRadius: 20,
                      titleSize: 16,
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Congrats()),
                          );
                      },
                    ),
                 
              ],
              
            ),
          ),
          
        ),
        );
  }
}
