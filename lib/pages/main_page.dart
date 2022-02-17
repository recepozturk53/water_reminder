import 'package:flutter/material.dart';

import '../widgets/springy_slider/slider_controller.dart';
import '../widgets/springy_slider/springy_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  SpringySliderController? sliderController;
  _buildTextButton(String title, bool isOnLight) {
    return Row(
      children: [
        Icon(
          Icons.wine_bar,
          color: Colors.white,
        ),
        FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          onPressed: () {
            if (title.contains("bottle")) {
              if ((sliderController?.sliderValue ?? 0) < 0.70) {
                sliderController?.sliderValue =
                    (sliderController?.sliderValue ?? 0) + 0.30;
              }
            } else if (title.contains("glass")) {
              if ((sliderController?.sliderValue ?? 0) < 0.85) {
                sliderController?.sliderValue =
                    (sliderController?.sliderValue ?? 0) + 0.15;
              }
            } else if (title.contains("sip")) {
              if ((sliderController?.sliderValue ?? 0) < 1.00) {
                sliderController?.sliderValue =
                    (sliderController?.sliderValue ?? 0) + 0.01;
              }
            }
          },
          child: Text(title.toUpperCase(),
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: isOnLight ? Colors.pink : Colors.white)),
        ),
      ],
    );
  }

  @override
  void initState() {
    sliderController = SpringySliderController(
      sliderPercent: 0.0,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return sliderController != null
        ? Scaffold(
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
                              sliderController: sliderController,
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
                            _buildTextButton("One glass", false),
                            _buildTextButton("One bottle", false),
                            _buildTextButton("One sip", false)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : const Scaffold(body: SafeArea(child: CircularProgressIndicator()));
  }
}
