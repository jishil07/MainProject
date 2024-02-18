import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homeline/fourth.dart';

class Thirdscreen extends StatefulWidget {
  @override
  State<Thirdscreen> createState() => _ThirdscreenState();
}

class _ThirdscreenState extends State<Thirdscreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ScaffoldMessengerState get _scaffoldMessenger =>
      ScaffoldMessenger.of(context);

  bool passwordVisible = false;

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
            child: Text(
              "Get Started !",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Text(
              "Create an Account",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIconColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person_4_outlined)),
            ),
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
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String email = emailController.text;
                    String password = passwordController.text;

                    try {
                      DataSnapshot snapshot = await _databaseReference
                          .child('users')
                          .child(username)
                          .once()
                          .then((event) => event.snapshot);

                      if (snapshot.value != null) {
                        _scaffoldMessenger.showSnackBar(SnackBar(
                          content: Text('Username already exist .'),
                        ));
                        return;
                      }

                      UserCredential userCredential =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (userCredential.user != null) {
                        await _databaseReference.child('user/$username').set({
                          'username': username,
                          'email': email,
                          'password': password,
                        });
                      }

                      print('User Signed Up : ${userCredential.user!.uid}');

                      usernameController.clear();
                      emailController.clear();
                      passwordController.clear();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fourthscreen()),
                      );
                    } catch (e) {
                      print('Error Signing Up : $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error Signing Up : $e')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 2,
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
            height: 25,
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
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 85),
            child: Row(
              children: [
                Text(
                  "Already have an account ?  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                ),
                InkWell(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fourthscreen()),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
