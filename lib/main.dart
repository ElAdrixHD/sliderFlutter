import 'package:flutter/material.dart';
import 'package:slideshow/src/pages/slideshow_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slides',
      initialRoute: SlideShowPage.route,
      onGenerateRoute: (settings){
        switch(settings.name){
          case SlideShowPage.route:
            return MaterialPageRoute(builder: (_) => SlideShowPage());
          default:
            return MaterialPageRoute(builder: (_) => SlideShowPage());
        }
      },
    );
  }
}