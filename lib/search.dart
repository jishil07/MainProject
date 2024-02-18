
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String dropdownvalue = 'Kaloor';

  var items = ['Kaloor', 'Kakkanad', 'Aluva', 'Fort Kochi'];

  List imgKaloor = [
    "assets/kaloor_apartment.jpg",
    "assets/kaloor_house.jpg",
    "assets/kaloor_villa1.webp",
    "assets/kaloor_villa2.jpg"
  ];
  List imgFortKochi = [
    "assets/fortkochi_apartment.jpg",
    "assets/fortkochi_house.jpg",
    "assets/fortkochi_villa1.jpeg",
    "assets/fortkochi_villa2.jpg"
  ];

  List imgKakkanad = [
    "assets/kakkanad_apartment.jpg",
    "assets/kakkanad_house.jpg",
    "assets/kakkanad_villa1.jpg",
    "assets/kakkanad_villa2.jpg"
  ];

  List imgAluva = [
    "assets/aluva_apartment.webp",
    "assets/aluva_house.jpg",
    "assets/aluva_villa1.jpg",
    "assets/aluva_villa2.jpg"
  ];

  List name = ["Apartment", "House", "Villa", "Villa"];

  List staytypKaloor = [
    "Primary Apartment",
    "Bungalow",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List staytypKakkanad = [
    "Primary Apartment",
    "Bungalow",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List staytypAluva = [
    "Primary Apartment",
    "Bungalow",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List staytypFortKochi = [
    "Primary Apartment",
    "Bungalow",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List moneyKaloor = ["1,600", "999", "1,000", "1,500"];

  List moneyKakkanad = ["1,600", "999", "1,000", "1,500"];

  List moneyAluva = ["1,600", "999", "1,000", "1,500"];

  List moneyFortKochi = ["1,600", "999", "1,000", "1,500"];

  var imgMain = [];
  var moneyMain = [];
  var staytypMain = [];

  @override
  void initState() {
    super.initState();
    if (dropdownvalue == "Kaloor") {
      imgMain = imgKaloor;
      moneyMain = moneyKaloor;
      staytypMain = staytypKaloor;
    }
    if (dropdownvalue == "Kakkanad") {
      imgMain = imgKakkanad;
      moneyMain = moneyKakkanad;
      staytypMain = staytypKakkanad;
    }
    if (dropdownvalue == "Aluva") {
      imgMain = imgAluva;
      moneyMain = moneyAluva;
      staytypMain = staytypAluva;
    }
    if (dropdownvalue == "Fort Kochi") {
      imgMain = imgFortKochi;
      moneyMain = moneyFortKochi;
      staytypMain = staytypFortKochi;
    }
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(10.0008,
                  76.3014), // Replace with your desired initial location
              zoom: 14.0, // Zoom level
            ),
            markers: <Marker>[
              Marker(
                markerId: MarkerId("1"),
                position: LatLng(
                    10.0008, 76.3014), // Replace with your marker's position
                infoWindow: InfoWindow(
                  title: 'Marker Title',
                  snippet: 'Marker Snippet',
                ),
              ),
            ].toSet(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 110),
                        child: DropdownButton(
                            value: dropdownvalue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                if (dropdownvalue == "Kaloor") {
                                  imgMain = imgKaloor;
                                }
                                if (dropdownvalue == "Kakkanad") {
                                  imgMain = imgKakkanad;
                                }
                                if (dropdownvalue == "Aluva") {
                                  imgMain = imgAluva;
                                }
                                if (dropdownvalue == "Fort Kochi") {
                                  imgMain = imgFortKochi;
                                }
                              });
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
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
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 10, right: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imgMain.length,
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
                                imgMain[index],
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
                              staytypMain[index],
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
                                  moneyMain[index],
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
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
