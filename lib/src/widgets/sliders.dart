import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slideshow/src/models/sliders_model.dart';

class SliderShow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;

  SliderShow({@required this.slides, this.dotsUp = false, this.primaryColor = Colors.yellow, this.secondaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  if(this.dotsUp) _Dots(length: this.slides.length, primaryColor: primaryColor,secondaryColor: secondaryColor,),
                    Expanded(child: _Slides(this.slides)),
                  if(!this.dotsUp) _Dots(length: this.slides.length, primaryColor: primaryColor,secondaryColor: secondaryColor,),
                ],
              ),
          ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int length;
  final Color primaryColor;
  final Color secondaryColor;
  _Dots({@required this.length, this.primaryColor, this.secondaryColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.length, (index) => _Dot(index, primaryColor, secondaryColor))),
    );
  }
}

class _Dot extends StatelessWidget {

  final int _id;
  final Color primaryColor;
  final Color secondaryColor;

  _Dot(this._id, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<SliderModel>(context).currentPage;
    final size = (index >= _id - 0.5 && index <= _id + 0.5) ? 20.0 : 12.0;
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutCirc,
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (index >= _id - 0.5 && index <= _id + 0.5)
                ? primaryColor : secondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;
  _Slides(this.slides);

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
        children: widget.slides.map((e) => _Slide(e)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: slide
      );
  }
}