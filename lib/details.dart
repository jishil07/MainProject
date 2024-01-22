// ignore_for_file: must_be_immutable

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:homeline/payment.dart';

class Details extends StatefulWidget {
  String staytyps, names, moneys;
  Details(
      {super.key,
      required this.staytyps,
      required this.names,
      required this.moneys});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    String staytyp1 = "";
    if (widget.staytyps == "Primary Apartment") {
      staytyp1 = "Primary Apartment";
    } else if (widget.staytyps == "Mighty Cinco") {
      staytyp1 = "Mighty Cinco";
    } else if (widget.staytyps == "Luxury Villa") {
      staytyp1 = "Luxury Villa";
    } else if (widget.staytyps == "Lagoon Villa") {
      staytyp1 = "Lagoon Villa";
    }

    String name1 = "";
    if (widget.names == "Apartment") {
      name1 = "Apartment";
    } else if (widget.names == "House") {
      name1 = "House";
    } else if (widget.names == "Villa") {
      name1 = "Villa";
    } else if (widget.names == "Villa") {
      name1 = "Villa";
    }

    String money1 = "";
    if (widget.moneys == "1,600") {
      money1 = "1,600";
    } else if (widget.moneys == "999") {
      money1 = "999";
    } else if (widget.moneys == "1,000") {
      money1 = "1,000";
    } else if (widget.moneys == "1,500") {
      money1 = "1,500";
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/novel-sea-view.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListTile(
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white54,
                          )),
                      trailing: FavoriteButton(
                          iconColor: Colors.red,
                          iconSize: 40,
                          isFavorite: false,
                          valueChanged: (_isFavourite) {
                            print("Is Favourite $_isFavourite");
                          })),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        name1.toString(),
                        style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 175,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: Text(
                        "4.5",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 145),
                  child: Text(
                    staytyp1.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Kayyath Ln, Janatha, Palarivattom, Kochi, Ernakulam, Kerala 682025",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Icon(Icons.bed_rounded),
                      Text("3 Beds",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.kitchen_rounded),
                      Text("1 Kitchen",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.space_dashboard),
                      Text(
                        "1,825 sq.ft",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text(
                    "Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Located in the hills above Nice, in a secure gated residence community, this luxurious villa is the perfect place for a family , for up to 10 persons. With 3 air-conditioned bedrooms, fully equipped kitchen, HD home theater, large garden, private pool and everything you will need or want for a pleasant stay among family and friends. Great location, near from the center of Nice, 5 km away from the sea.",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: Text(
                    "Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: Colors.yellow,
                      ),
                      Text(
                        money1.toString(),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side: BorderSide(width: 1, color: Colors.black),
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: Text("Buy",
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
