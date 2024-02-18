import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homeline/favorite_data_model.dart';
import 'package:homeline/first.dart';
import 'package:homeline/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");
  runApp(

    MultiProvider(providers: [
       ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider(),),
       ChangeNotifierProvider<FavoriteDataModel>(create: (_) => FavoriteDataModel()),
    ],

    child: MyApp(email: email,),
    )
  );
}


// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  var email;
 MyApp({required this.email});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      home: Homescreen(email:widget.email),
      debugShowCheckedModeBanner: false,
    );
  }
}
