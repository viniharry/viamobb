import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

/// Drawer Menu
class MessageWidget extends StatelessWidget {
  final num currentMessagePercent;
  final Function(bool) animateMessage;

  MessageWidget({Key key, this.currentMessagePercent, this.animateMessage, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentMessagePercent != 0
        ? Positioned(
            right: realW(-358 + 358 * currentMessagePercent),
            top: realH(-330 + 358 * currentMessagePercent),
            width: realW(358),
            height: screenHeight,
            child: Opacity(
              opacity: currentMessagePercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(realW(50))),
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
                              height: realH(236),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(realW(50))),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      colors: [
                                        Color(0xFF59C2FF),
                                        Color(0xFF1270E3),
                                      ])),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: realW(10),
                                    bottom: realH(27),
                                    child: Image.asset(
                                      "assets/avatar.png",
                                      width: realH(120),
                                      height: realH(120),
                                    ),
                                  ),
                                  Positioned(
                                    right: realW(60),
                                    bottom: realH(18),
                                    child: Image.asset(
                                      "assets/lable.png",
                                      width: realH(72),
                                      height: realH(72),
                                    ),
                                  ),
                                  Positioned(
                                    right: realW(135),
                                    top: realH(150),
                                    child: DefaultTextStyle(
                                      style: TextStyle(color: Colors.white),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Mesasge",
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
                                  left: realW(37)),
                              sliver: SliverList(
                                delegate: SliverChildListDelegate([
                                  MenuItems(
                                    title: 'Home',
                                  ),
                                  MenuItems(
                                    title: 'Teste',
                                  ),
                                ]),
                              )),
                          SliverPadding(
                            padding: EdgeInsets.only(right: realW(20)),
                            sliver: SliverToBoxAdapter(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: realW(20)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // close button
                    Positioned(
                      bottom: realH(53),
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          animateMessage(false);
                        },
                        child: Container(
                          width: realW(71),
                          height: realH(71),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: realW(17)),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFFE96977),
                            size: realW(34),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFB5E74).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(realW(36)),
                                topRight: Radius.circular(realW(36))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }
}
