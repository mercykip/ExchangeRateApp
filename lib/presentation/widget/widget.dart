import 'package:bitcoin_picker/application/themes/colors.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  CardButton({this.selectedCurrency, this.value, this.cryptoCurrency});
  final String selectedCurrency;
  final String value;
  final String cryptoCurrency;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: blue5,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency =  $value $selectedCurrency ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
