import 'dart:math';

import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';
import 'package:viamobb_passageiro/widgets/dados/data_widget.dart';

/// Drawer Menu
class MenuWidget extends StatefulWidget {
  final num currentMenuPercent;
  final Function(bool) animateMenu;

  MenuWidget({Key key, this.currentMenuPercent, this.animateMenu})
      : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  AnimationController animationControllerData;
  CurvedAnimation curve;
  Animation<double> animation;

  get currentDataPercent => max(0.0, min(1.0, offsetData / 358));

  bool isDataOpen = false;

  var offsetData = 0.0;

  void animateData(bool open) {
    animationControllerData =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    curve =
        CurvedAnimation(parent: animationControllerData, curve: Curves.ease);
    animation =
        Tween(begin: open ? 0.0 : 358.0, end: open ? 358.0 : 0.0).animate(curve)
          ..addListener(() {
            setState(() {
              offsetData = animation.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              isDataOpen = open;
            }
          });
    animationControllerData.forward();
  }

  @override
  Widget build(BuildContext context) {
    return widget.currentMenuPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * widget.currentMenuPercent),
            top: realH(-330 + 358 * widget.currentMenuPercent),
            width: realW(358),
            height: screenHeight * 0.967,
            child: Opacity(
              opacity: widget.currentMenuPercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(realW(50))),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: realW(20)),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (notification) {
                        notification.disallowGlow();
                      },
                      child: CustomScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              height: realH(150),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(realW(50))),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color(0xFF59C2FF),
                                        Color(0xFF1270E3),
                                      ])),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    left: realW(10),
                                    bottom: realH(10),
                                    child: Image.asset(
                                      "assets/avatar.png",
                                      width: realH(120),
                                      height: realH(120),
                                    ),
                                  ),
                                 
                                  Positioned(
                                    left: realW(135),
                                    top: realH(90),
                                    child: DefaultTextStyle(
                                      style: TextStyle(color: Colors.white),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Fulano",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: realW(18)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                              padding: EdgeInsets.only(
                                  top: realH(34),
                                  bottom: realH(50),
                                  right: realW(37)),
                              sliver: SliverList(
                                delegate: SliverChildListDelegate([
                                  MenuItems(
                                    iconData: Icons.person_rounded,
                                    title: 'Dados pessoais',
                                    onTap: () => animateData(true),
                                  ),
                                  MenuItems(
                                    iconData: Icons.calendar_today_sharp,
                                    title: 'Corridas agendadas',
                                  ),
                                  MenuItems(
                                    iconData: Icons.car_repair,
                                    title: 'Meus motoristas',
                                  ),
                                  MenuItems(
                                    iconData: Icons.phone,
                                    title: 'Fale conosco',
                                  ),
                                  MenuItems(
                                    iconData: Icons.exit_to_app,
                                    title: 'Sair',
                                  )
                                ]),
                              )),
                        ],
                      ),
                    ),

                    Positioned(
                        bottom: 5,
                        left: realW(150),
                        child: Column(
                          children: [Text('Via Mobb'), Text('Versão 1.0.2')],
                        )),
                    // close button
                    Positioned(
                      bottom: realH(53),
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          widget.animateMenu(false);
                        },
                        child: Container(
                          width: realW(71),
                          height: realH(71),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: realW(17)),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFFE96977),
                            size: realW(34),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFB5E74).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(realW(36)),
                                topLeft: Radius.circular(realW(36))),
                          ),
                        ),
                      ),
                    ),
                    DataWidget(
                        currentDataPercent: currentDataPercent,
                        animateData: animateData),
                  ],
                ),
              ),
            ),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }
}
