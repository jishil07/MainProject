import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:homeline/apartment.dart';
import 'package:homeline/details.dart';
import 'package:homeline/house.dart';
import 'package:homeline/notification.dart';
import 'package:homeline/seeall.dart';
import 'package:homeline/villa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
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

  List img = [
    "assets/novel-sea-view.jpg",
    "assets/Stock-Modern-House-.jpg",
    "assets/villa.webp",
    "assets/villaaaa.jpg"
  ];

  List name = ["Apartment", "House", "Villa", "Villa"];

  List staytyp = [
    "Primary Apartment",
    "Mighty Cinco",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List money = ["1,600", "999", "1,000", "1,500"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: DropdownButton(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  }),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.place_sharp,
                  color: Colors.blue,
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
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Container(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                        onPressed: () => _searchController.clear(),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        )),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => House()),
                        );
                      },
                      icon: Icon(
                        Icons.home_rounded,
                        color: Colors.lightBlue,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "House",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Villa()),
                        );
                      },
                      icon: Icon(
                        Icons.villa_outlined,
                        color: Colors.lightBlue,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Villa",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Apartment()),
                        );
                      },
                      icon: Icon(
                        Icons.apartment_rounded,
                        color: Colors.lightBlue,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Apartment",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Text(
              "Recommendation",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Seeall()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "See All",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          LimitedBox(
            maxHeight: 320,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: img.length,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    staytyps: staytyp[index],
                                    names: name[index],
                                    moneys: money[index],
                                  )),
                        );
                      },
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
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
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Text(
              "Nearby Your Location",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Seeall()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "See All",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
        ],
      ),
    );
  }
}
