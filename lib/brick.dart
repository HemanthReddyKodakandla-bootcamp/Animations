import 'package:flutter/material.dart';
import 'dart:math' as math;

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage> with TickerProviderStateMixin {

  AnimationController animationController;
  Tween tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,duration: Duration(seconds: 3)
    );
    tween = Tween(begin: 0.0,end: 1.0);
    animationController.repeat();
  }



//  Brick 1

  Animation get animOne => tween.animate(CurvedAnimation(
    curve: Interval(0.0, 0.125,curve: Curves.linear),
    parent: animationController
  ));



  Animation get animTwo => tween.animate(CurvedAnimation(
      curve: Interval(0.1, 0.2,curve: Curves.linear),
      parent: animationController
  ));


  Animation get animThree => tween.animate(CurvedAnimation(
      curve: Interval(0.2, 0.3,curve: Curves.linear),
      parent: animationController
  ));

  Animation get animFour => tween.animate(CurvedAnimation(
      curve: Interval(0.3, 0.4,curve: Curves.linear),
      parent: animationController
  ));

  Animation get animFive => tween.animate(CurvedAnimation(
      curve: Interval(0.4, 0.5,curve: Curves.linear),
      parent: animationController
  ));

  Animation get animSix => tween.animate(CurvedAnimation(
      curve: Interval(0.5, 0.6,curve: Curves.linear),
      parent: animationController
  ));

  Animation get animSeven => tween.animate(CurvedAnimation(
      curve: Interval(0.6, 0.7,curve: Curves.linear),
      parent: animationController
  ));

  Animation get animEight => tween.animate(CurvedAnimation(
      curve: Interval(0.7, 0.8,curve: Curves.linear),
      parent: animationController
  ));
  Animation get animNine => tween.animate(CurvedAnimation(
      curve: Interval(0.8, 0.9,curve: Curves.linear),
      parent: animationController
  ));
  Animation get animTen => tween.animate(CurvedAnimation(
      curve: Interval(0.900, 1.0,curve: Curves.linear),
      parent: animationController
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Text('Animations',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             AnimatedBrick(animations: [animOne,animTwo],controller: animationController,isClockWise: true, marignLeft: 0,alignment: Alignment.centerLeft,) ,
              AnimatedBrick(animations: [animThree,animTen],controller: animationController,isClockWise: false,marignLeft: 0,),
              AnimatedBrick(animations: [animFour,animNine],controller: animationController,isClockWise: true,marignLeft: 30,),
              AnimatedBrick(animations: [animFive,animEight],controller: animationController,isClockWise: false,marignLeft: 30,),
              AnimatedBrick(animations: [animSix,animSeven],controller: animationController,isClockWise: true,marignLeft: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBrick extends AnimatedWidget{
  final AnimationController controller;
  final List<Animation> animations;
  final double marignLeft;
  final Alignment alignment;
  final bool isClockWise;

  AnimatedBrick({
   Key key,
   this.controller,
    this.animations,
    this.alignment = Alignment.centerRight,
    this.isClockWise,
    this.marignLeft
}) : super(key: key, listenable:controller);

  Matrix4 clockWise(animation) => Matrix4.rotationZ(animation.value * math.pi*2 *0.5);
  Matrix4 antiClockWise(animation) => Matrix4.rotationZ(-(animation.value * math.pi*2 *0.5));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var firstTransformation,secondTransformation;
    if(isClockWise){
      firstTransformation = clockWise(animations[0]);
      secondTransformation = clockWise(animations[1]);
    }
    else{
      firstTransformation = antiClockWise(animations[1]);
      secondTransformation = antiClockWise(animations[0]);
    }

    return Transform(
      transform: firstTransformation,
      alignment: alignment,
      child: Transform(
          transform: secondTransformation,
        alignment: alignment,
        child: Brick(marginLeft: marignLeft,),
      ),
    );
  }

}

class Brick extends StatelessWidget {
  final double marginLeft;
  Brick({this.marginLeft = 18.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      height: 10.0,
      width: 40.0,
      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.yellow
        ])
      ),
    );
  }
}



