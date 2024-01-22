import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class Villa extends StatefulWidget {
  const Villa({super.key});

  @override
  State<Villa> createState() => _VillaState();
}

class _VillaState extends State<Villa> {
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

  List img = ["assets/villa.webp", "assets/villaaaa.jpg"];

  List name = ["Villa", "Villa"];

  List staytyp = ["Luxury Villa", "Lagoon Villa"];

  List money = ["1,000", "1,500"];
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
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
        title: Text(
          "Villa",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: LimitedBox(
        maxHeight: 320,
        child: ListView.builder(
            itemCount: img.length,
            itemBuilder: (contex, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
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
                            img[index],
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
                          name[index],
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          staytyp[index],
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
                              money[index],
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
                                isFavorite: false,
                                valueChanged: (_isFavourite) {
                                  print("Is Favourite $_isFavourite");
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
