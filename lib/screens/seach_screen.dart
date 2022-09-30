import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';

  SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchedCoin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.backward),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.8),
              filled: true,
              hintText: 'Search for a city',
              prefixIcon: const Icon(
                Icons.location_city_outlined,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  23,
                ),
              ),
            ),
            onChanged: ((value) {
              searchedCoin = value;
            }),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, searchedCoin),
            child: const Text(
              'Get Weather',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
