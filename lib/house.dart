import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class House extends StatefulWidget {
  const House({super.key});

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
  String dropdownvalue = 'Kaloor';

  var items = [
    'Kaloor',
    'Palarivattom',
    'Edapally',
    'Kakkanad',
    'Vytila',
    'Aluva',
    'Fort Kochi'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Text(
          "House",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 50,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/Stock-Modern-House-.jpg",
                      height: 110,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "House",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blue),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Mighty Cinco",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place_sharp,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${dropdownvalue}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_sharp,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "999",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "month",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    FavoriteButton(
                        iconColor: Colors.red,
                        iconSize: 45,
                        isFavorite: false,
                        valueChanged: (_isFavourite) {
                          print("Is Favourite $_isFavourite");
                        })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
