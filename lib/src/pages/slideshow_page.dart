import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  static const route = "/slide";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Slides(),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide("assets/svgs/1.svg"),
          _Slide("assets/svgs/2.svg"),
          _Slide("assets/svgs/3.svg"),
          _Slide("assets/svgs/4.svg"),
          _Slide("assets/svgs/5.svg"),
          _Slide("assets/svgs/6.svg"),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: SvgPicture.asset(svg)
      );
  }
}