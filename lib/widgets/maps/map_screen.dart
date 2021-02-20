import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/explore_content_widget.dart';
import 'package:viamobb_passageiro/components/explore_menu_widget.dart';
import 'package:viamobb_passageiro/components/explore_widget.dart';
import 'package:viamobb_passageiro/components/message_widget.dart';
import 'package:viamobb_passageiro/components/teste.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';


import '../../constants.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin{

  AnimationController animationControllerExplore;
  AnimationController animationControllerSearch;
  AnimationController animationControllerMenu;
  AnimationController animationControllerMessage;
  CurvedAnimation curve;
  Animation<double> animation;
  Animation<double> animationW;
  Animation<double> animationR;

  get currentExplorePercent => max(0.0, min(1.0, offsetExplore / (760.0 - 122.0)));
  get currentSearchPercent => max(0.0, min(1.0, offsetSearch / (347 - 68.0)));
  get currentMenuPercent => max(0.0, min(1.0, offsetMenu / 358));
  get currentMessagePercent => max(0.0, min(1.0, offsetMessage / 358));

  var offsetExplore = 0.0;
  var offsetSearch = 0.0;
  var offsetMenu = 0.0;
  var offsetMessage = 0.0;

  bool isExploreOpen = false;
  bool isSearchOpen = false;
  bool isMenuOpen = false;
  bool isMessageOpen = false;

  double width;
  double height;



  /// explore drag callback
  void onExploreVerticalUpdate(details) {
    offsetExplore -= details.delta.dy;
    if (offsetExplore > 644) {
      offsetExplore = 644;
    } else if (offsetExplore < 0) {
      offsetExplore = 0;
    }
    setState(() {});
  }

  
  void animateMenu(bool open) {
    animationControllerMenu = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    curve = CurvedAnimation(parent: animationControllerMenu, curve: Curves.ease);
    animation = Tween(begin: open ? 0.0 : 358.0, end: open ? 358.0 : 0.0).animate(curve)
      ..addListener(() {
        setState(() {
          offsetMenu = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isMenuOpen = open;
        }
      });
    animationControllerMenu.forward();
  }

  void animateMessage(bool open) {
    animationControllerMessage = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    curve = CurvedAnimation(parent: animationControllerMessage, curve: Curves.ease);
    animation = Tween(begin: open ? 0.0 : 358.0, end: open ? 358.0 : 0.0).animate(curve)
      ..addListener(() {
        setState(() {
          offsetMessage = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isMessageOpen = open;
        }
      });
    animationControllerMessage.forward();
  }

  /// animate Explore
  ///
  /// if [open] is true , make Explore open
  /// else make Explore close
  void animateExplore(bool open) {
    animationControllerExplore = AnimationController(
        duration: Duration(
            milliseconds: 1 + (800 * (isExploreOpen ? currentExplorePercent : (1 - currentExplorePercent))).toInt()),
        vsync: this);
    curve = CurvedAnimation(parent: animationControllerExplore, curve: Curves.ease);
    animation = Tween(begin: offsetExplore, end: open ? 760.0 - 122 : 0.0).animate(curve)
      ..addListener(() {
        setState(() {
          offsetExplore = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isExploreOpen = open;
        }
      });
    animationControllerExplore.forward();
  }

  void animateSearch(bool open) {
    animationControllerSearch = AnimationController(
        duration: Duration(
            milliseconds: 1 + (800 * (isSearchOpen ? currentSearchPercent : (1 - currentSearchPercent))).toInt()),
        vsync: this);
    curve = CurvedAnimation(parent: animationControllerSearch, curve: Curves.ease);
    animation = Tween(begin: offsetSearch, end: open ? 347.0 - 68.0 : 0.0).animate(curve)
      ..addListener(() {
        setState(() {
          offsetSearch = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isSearchOpen = open;
        }
      });
    animationControllerSearch.forward();
  }


  @override
  Widget build(BuildContext context) {
   screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/map.png',
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
                 ExploreWidget(
                currentExplorePercent: currentExplorePercent,
                currentSearchPercent: currentSearchPercent,
                animateExplore: animateExplore,
                isExploreOpen: isExploreOpen,
                onVerticalDragUpdate: onExploreVerticalUpdate,
                onPanDown: () => animationControllerExplore?.stop(),
              ),
              ExploreContentWidget(
                currentExplorePercent: currentExplorePercent,
              ),
                Positioned(
                top: screenWidth*0.063,
                //bottom: height*0.1,
                right:screenWidth *0.05,
                child: GestureDetector(
                  onTap: () {
                    animateMessage(true);
                  },
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      width: screenWidth*0.15,
                      height: screenWidth*0.15,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: screenWidth*0.034),
                      child: Icon(
                        Icons.message_sharp,
                        color: kBlueColor,
                        size: screenWidth*0.085,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(100)
                              ),
                          boxShadow: [
                            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 7),
                          ]),
                    ),
                  ),
                ),
              ),
             
              Positioned(
                top: screenWidth*0.063,
                //bottom: height*0.1,
                left:screenWidth *0.05,
                child: GestureDetector(
                  onTap: () {
                    animateMenu(true);
                  },
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      width: screenWidth*0.15,
                      height: screenWidth*0.15,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: screenWidth*0.034),
                      child: Icon(
                        Icons.menu,
                        color: kBlueColor,
                        size: screenWidth*0.085,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(100)
                              ),
                          boxShadow: [
                            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 7),
                          ]),
                    ),
                  ),
                ),
              ),
               TesteWidget(currentMessagePercent: currentMessagePercent, animateMessage: animateMessage),
               MenuWidget(currentMenuPercent: currentMenuPercent, animateMenu: animateMenu),
            ],
          ),
        )
      ),
    );
  }
}
