import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:homeline/favorite_data_model.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final favoriteData = Provider.of<FavoriteDataModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Favourite",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: favoriteData.imgMain.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 50,
                color: Colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          favoriteData.imgMain[index],
                          height: 110,
                          width: 190,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        favoriteData.name[index],
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        favoriteData.staytypMain[index],
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
                          favoriteData.items[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money_sharp,
                            color: Colors.amberAccent,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            favoriteData.moneyMain[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                              isFavorite: true,
                              valueChanged: (_isFavourite) {
                                print("Is Favourite $_isFavourite");
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
