import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:slideshow/src/models/sliders_model.dart';

class SlideShowPage extends StatelessWidget {
  static const route = "/slide";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots()
            ],
          ),
        )),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
          _Dot(3),
          _Dot(4),
          _Dot(5),
        ],),
    );
  }
}

class _Dot extends StatelessWidget {

  final int _id;

  _Dot(this._id);

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (index >= _id - 0.5 && index <= _id + 0.5)
                ? Colors.yellow : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage = controller.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
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