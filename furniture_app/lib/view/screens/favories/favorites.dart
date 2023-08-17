import 'package:flutter/material.dart';

import '../../../resources/conastants/listofitems.dart';
import '../../widgets/public_text.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const PublicText(
            txt: 'Favorites',
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
                  Icons.shopping_cart,
                  color: Colors.black38,
                  size: 30,
                ),
                onPressed: () {}),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemCount: popularList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      width:150,
                      height: 170,
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(popularList[index]["image"]),
                        ),
                      ),
                    ),
                    Column(
        
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
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: Colors.black),
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
                          SizedBox(height: 40,),
                        Icon(
                          Icons.shop,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )

        );
  }
}
