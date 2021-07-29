import 'package:bitcoin_picker/application/services/currency.dart';
import 'package:bitcoin_picker/application/themes/coin_data.dart';
import 'package:bitcoin_picker/application/themes/colors.dart';
import 'package:bitcoin_picker/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class BitCoin extends StatefulWidget {
  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {
  /// set the default currency
  String selectedCurrency = 'USD';
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getCurrenciesData();
  }

  getCurrenciesData() async {
    isWaiting = true;
    try {
      dynamic data = await Currency().getCurrencies(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  List<DropdownMenuItem> dropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      //for every currency in the list we create a new dropdownmenu item
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      // add to the list of menu item
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue8,
      appBar: AppBar(
        backgroundColor: blue5,
        centerTitle: true,
        title: Text(
          'CRYPTO EXCHANGE RATES',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CardButton(
                  cryptoCurrency: 'BTC',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['BTC'],
                ),
                CardButton(
                  cryptoCurrency: 'ETH',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['ETH'],
                ),
                CardButton(
                  cryptoCurrency: 'LTC',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['LTC'],
                ),
              ]),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: blue5,
            child: DropdownButton<String>(
              dropdownColor: blue5,
              value: selectedCurrency,
              items: dropDown(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;

                  /// call this function each time the value in the drop down changes.
                  getCurrenciesData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
