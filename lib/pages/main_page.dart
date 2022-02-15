import 'package:flutter/material.dart';

import '../widgets/springy_slider/springy_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _buildTextButton(String title, bool isOnLight) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      onPressed: () {},
      child: Text(title.toUpperCase(),
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: isOnLight ? Colors.pink : Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0,
              textTheme: const TextTheme(
                  subtitle1: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
              iconTheme: const IconThemeData(color: Colors.pink),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: <Widget>[_buildTextButton("Settings", true)],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: SpringySlider(
                        markCount: 12,
                        positiveColor: Colors.lightBlue,
                        negativeColor: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildTextButton("More", false),
                      _buildTextButton("Stats", false)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
