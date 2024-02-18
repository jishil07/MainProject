import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homeline/success.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _selectedPaymentOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectPaymentOption('Credit Card');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Success()),
                );
              },
              child: Text('Credit Card'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectPaymentOption('UPI Payment');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Success()),
                );
              },
              child: Text('UPI Payment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectPaymentOption('Other Payment Methods');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Success()),
                );
              },
              child: Text('Other Payment Methods'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectPaymentOption(String option) {
    setState(() {
      _selectedPaymentOption = option;
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('_selectedPaymentOption', _selectedPaymentOption));
  }
}
