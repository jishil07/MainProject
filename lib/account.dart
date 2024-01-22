import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeline/logout.dart';
import 'package:homeline/notification.dart';
import 'package:homeline/profile.dart';
import 'package:homeline/property.dart';
import 'package:homeline/settings.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Logout()));
            },
            icon: Icon(Icons.logout_rounded),
            color: Colors.black,
          )
        ],
        title: Text(
          "Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 50),
                child: Container(
                  height: 160,
                  width: 160,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/mammookka.webp",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Jishil K K",
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(fontSize: 30)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "jishilkk4@gmail.com",
                      style: GoogleFonts.truculenta(),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading:
                    Icon(Icons.person_outline_rounded, color: Colors.black),
                title: Text("Profile"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Property()));
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Icon(Icons.apartment_sharp, color: Colors.black),
                title: Text("Your Properties"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.black),
                title: Text("Notifications"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Icon(
                  Icons.settings_applications_rounded,
                  color: Colors.black,
                ),
                title: Text("Settings"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
