import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow/src/widgets/sliders.dart';

class MySliderShowPage extends StatelessWidget {
  static const route = "/mySliders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderShow(
        slides: [
          SvgPicture.asset("assets/svgs/1.svg"),
          SvgPicture.asset("assets/svgs/2.svg"),
          SvgPicture.asset("assets/svgs/3.svg"),
          SvgPicture.asset("assets/svgs/4.svg"),
          SvgPicture.asset("assets/svgs/5.svg"),
          SvgPicture.asset("assets/svgs/6.svg"),
        ],
        dotsUp: true,
        primaryColor: Colors.indigo,
        secondaryColor: Colors.red,
      ),
    );
  }
}