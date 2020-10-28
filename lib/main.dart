import 'package:flutter/material.dart';
import 'package:slideshow/src/pages/slider_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slides',
      debugShowCheckedModeBanner: false,
      initialRoute: MySliderShowPage.route,
      onGenerateRoute: (settings){
        switch(settings.name){
          case MySliderShowPage.route:
            return MaterialPageRoute(builder: (_) => MySliderShowPage());
          default:
            return MaterialPageRoute(builder: (_) => MySliderShowPage());
        }
      },
    );
  }
}