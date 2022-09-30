// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import '../screens/coin_data.dart';
// // import 'coin_data.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:io' show Platform;

// class PriceScreen extends StatefulWidget {
//   @override
//   _PriceScreenState createState() => _PriceScreenState();
// }

// class _PriceScreenState extends State<PriceScreen> {
//   String selectedCurrency = 'USD';

//   DropdownButton<String> androidDropdown() {
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (String currency in currenciesList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }

//     return DropdownButton<String>(
//       value: selectedCurrency,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           selectedCurrency = value!;
//         });
//       },
//     );
//   }

//   CupertinoPicker iOSPicker() {
//     List<Text> pickerItems = [];
//     for (String currency in currenciesList) {
//       pickerItems.add(Text(currency));
//     }

//     return CupertinoPicker(
//       backgroundColor: Colors.lightBlue,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         print(selectedIndex);
//       },
//       children: pickerItems,
//     );
//   }

//   //12. Create a variable to hold the value and use in our Text Widget. Give the variable a starting value of '?' before the data comes back from the async methods.
//   String bitcoinValueInUSD = '?';

//   //11. Create an async method here await the coin data from coin_data.dart
//   void getData() async {
//     try {
//       double data = await CoinData().getCoinData();
//       //13. We can't await in a setState(). So you have to separate it out into two steps.
//       setState(() {
//         bitcoinValueInUSD = data.toStringAsFixed(0);
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     //14. Call getData() when the screen loads up. We can't call CoinData().getCoinData() directly here because we can't make initState() async.
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('🤑 Coin Ticker'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//             child: Card(
//               color: Colors.lightBlueAccent,
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//                 child: Text(
//                   //15. Update the Text Widget with the data in bitcoinValueInUSD.
//                   '1 BTC = $bitcoinValueInUSD USD',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 150.0,
//             alignment: Alignment.center,
//             padding: EdgeInsets.only(bottom: 30.0),
//             color: Colors.lightBlue,
//             child: Platform.isIOS ? iOSPicker() : androidDropdown(),
//           ),
//         ],
//       ),
//     );
//   }
// }





// // //2. Import the required packages.


// // const List<String> currenciesList = [
// //   'AUD',
// //   'BRL',
// //   'CAD',
// //   'CNY',
// //   'EUR',
// //   'GBP',
// //   'HKD',
// //   'IDR',
// //   'ILS',
// //   'INR',
// //   'JPY',
// //   'MXN',
// //   'NOK',
// //   'NZD',
// //   'PLN',
// //   'RON',
// //   'RUB',
// //   'SEK',
// //   'SGD',
// //   'USD',
// //   'ZAR'
// // ];

// // const List<String> cryptoList = [
// //   'BTC',
// //   'ETH',
// //   'LTC',
// // ];

// // const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// // const apiKey = 'YOUR-API-KEY-HERE';

// // class CoinData {
// //   //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
// //   Future getCoinData() async {
// //     //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
// //     String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
// //     //5. Make a GET request to the URL and wait for the response.
// //     http.Response response = await http.get(requestURL);

// //     //6. Check that the request was successful.
// //     if (response.statusCode == 200) {
// //       //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
// //       var decodedData = jsonDecode(response.body);
// //       //8. Get the last price of bitcoin with the key 'last'.
// //       var lastPrice = decodedData['rate'];
// //       //9. Output the lastPrice from the method.
// //       return lastPrice;
// //     } else {
// //       //10. Handle any errors that occur during the request.
// //       print(response.statusCode);
// //       //Optional: throw an error if our request fails.
// //       throw 'Problem with the get request';
// //     }
// //   }
// // }