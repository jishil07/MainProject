import 'package:flutter/material.dart';
import 'package:homeline/language.dart';
import 'package:homeline/sixth.dart';
import 'package:homeline/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              "Common",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Language()));
              },
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.white),
                child: ListTile(
                  leading: Icon(Icons.language_rounded, color: Colors.black),
                  title: Text("Language"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              "Security",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Icon(Icons.lock_person_rounded, color: Colors.black),
                title: Text("Data Security"),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sixthscreen()));
              },
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.white),
                child: ListTile(
                  leading: Icon(Icons.password_rounded, color: Colors.black),
                  title: Text("Change Password"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: Text(
              "Control Centre",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 18),
                ),
                title: Padding(
                    padding: const EdgeInsets.only(left: 80, bottom: 15),
                    child: Switch(
                        value: Provider.of<ThemeProvider>(context).isDarkMode,
                        onChanged: (value) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleDarkMode();
                        })

                    //       FlutterSwitch(
                    //   value: isDarkMode,
                    //   onToggle: (value) {
                    //     toggleDarkMode();
                    //   },
                    //   activeColor: Colors.green,
                    // ),
                    // child: FlutterSwitch(
                    //   activeColor: Colors.green,
                    //   width: 85,
                    //   height: 40,
                    //   valueFontSize: 0,
                    //   toggleSize: 40,
                    //   value: status,
                    //   borderRadius: 30.0,
                    //   padding: 8,
                    //   onToggle: (value) {
                    //     setState(() {
                    //       isDarkMode = value;
                    //     });
                    //   },
                    // ),
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              child: ListTile(
                leading: Icon(Icons.details_rounded, color: Colors.black),
                title: Text("About"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
