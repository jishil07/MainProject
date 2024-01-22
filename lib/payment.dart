import 'package:flutter/material.dart';
import 'package:homeline/success.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
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
        title: Text(
          "USD 1,600.00",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Payement Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Please select you preferred payment method",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Icon(Icons.credit_card_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Credit Card",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 150,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.green,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Icon(Icons.payments),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "UPI Paymnents",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 126,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Icon(Icons.wallet_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "E-Wallet",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 168,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Success()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400))),
            ),
          ),
        ],
      ),
    );
  }
}
