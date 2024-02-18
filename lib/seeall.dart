import 'package:flutter/material.dart';

class Seeall extends StatefulWidget {
  const Seeall({super.key});

  @override
  State<Seeall> createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  var items = [
    'Kaloor',
    'Kaloor',
    'Kaloor',
    'Kaloor',
    'Kakkanad',
    'Kakkanad',
    'Kakkanad',
    'Kakkanad',
    'Aluva',
    'Aluva',
    'Aluva',
    'Aluva',
    'Fort Kochi',
    'Fort Kochi',
    'Fort Kochi',
    'Fort Kochi'
  ];

  List img = [
    "assets/kaloor_apartment.jpg",
    "assets/kaloor_house.jpg",
    "assets/kaloor_villa1.webp",
    "assets/kaloor_villa2.jpg",
    "assets/kakkanad_apartment.jpg",
    "assets/kakkanad_house.jpg",
    "assets/kakkanad_villa1.jpg",
    "assets/kakkanad_villa2.jpg",
    "assets/aluva_apartment.webp",
    "assets/aluva_house.jpg",
    "assets/aluva_villa1.jpg",
    "assets/aluva_villa2.jpg",
    "assets/fortkochi_apartment.jpg",
    "assets/fortkochi_house.jpg",
    "assets/fortkochi_villa1.jpeg",
    "assets/fortkochi_villa2.jpg",
  ];

  List name = [
    "Apartment",
    "House",
    "Villa",
    "Villa",
    "Apartment",
    "House",
    "Villa",
    "Villa",
    "Apartment",
    "House",
    "Villa",
    "Villa",
    "Apartment",
    "House",
    "Villa",
    "Villa"
  ];

  List staytyp = [
    "Primary Apartment",
    "Mighty Cinco",
    "Luxury Villa",
    "Lagoon Villa",
    "Primary Apartment",
    "Mighty Cinco",
    "Luxury Villa",
    "Lagoon Villa",
    "Primary Apartment",
    "Mighty Cinco",
    "Luxury Villa",
    "Lagoon Villa",
    "Primary Apartment",
    "Mighty Cinco",
    "Luxury Villa",
    "Lagoon Villa"
  ];

  List money = [
    "1,600",
    "999",
    "1,000",
    "1,500",
    "1,600",
    "999",
    "1,000",
    "1,500",
    "1,600",
    "999",
    "1,000",
    "1,500",
    "1,600",
    "999",
    "1,000",
    "1,500"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "See All",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
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
          itemCount: img.length,
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
                          items[index],
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
