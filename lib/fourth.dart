import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homeline/seventh.dart';
import 'package:homeline/sixth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fourthscreen extends StatefulWidget {
  const Fourthscreen({super.key});

  @override
  State<Fourthscreen> createState() => _FourthscreenState();
}

class _FourthscreenState extends State<Fourthscreen> {
  bool passwordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 15),
            child: Text("Let's Log You In.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Text(
              "Welcome Back , You've been invited",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIconColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIconColor: Colors.blue,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Enter Your Password",
                labelText: "Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
                filled: true,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          ),
          ListTile(
            trailing: InkWell(
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sixthscreen()),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;

                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      print('Login Successful');
                      print('User Logged In : ${userCredential.user!.uid}');
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString("email", emailController.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Successful')));

                      emailController.clear();
                      passwordController.clear();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Seventhscreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Email not found . Please Sign Up .')));
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Incorrect password . Please try again .')));
                      } else {
                        print('Error Logging in : ${e.message}');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Error Logging In . Please try again')));
                      }
                    } catch (e) {
                      print('Error Logging In : $e');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Error Logging In . Please try again')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 168),
            child: Text(
              "OR",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Image.asset("assets/icons8-google-48.png")),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Image.asset("assets/icons8-facebook-48.png")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
