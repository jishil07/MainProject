import 'package:flutter/material.dart';
import 'package:homeline/seventh.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 110, right: 110),
            child: Icon(
              Icons.done_outline_rounded,
              color: Colors.green,
              size: 150,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            "Payment Successful",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 50,
          ),
          Text("Transaction Number : 123456789"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount Paid :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "USD 1,600",
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Payed by Credit Card",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Seventhscreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                side: BorderSide(width: 1, color: Colors.black),
                backgroundColor: Colors.blue,
              ),
              child: Text("Go Back",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400))),
        ],
      ),
    );
  }
}
