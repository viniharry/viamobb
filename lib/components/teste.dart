import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

import 'chat_widget.dart';
import 'new_message.dart';

/// Drawer Menu
class TesteWidget extends StatefulWidget {
  final num currentMessagePercent;
  final Function(bool) animateMessage;

  TesteWidget({
    Key key,
    this.currentMessagePercent,
    this.animateMessage,
  }) : super(key: key);

  @override
  _TesteWidgetState createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.currentMessagePercent != 0) {
      return Positioned(
        right: realW(-358 + 358 * widget.currentMessagePercent),
        top: realH(-330 + 358 * widget.currentMessagePercent),
        width: screenWidth,
        height: screenHeight * 0.978,
        child: Opacity(
          opacity: widget.currentMessagePercent,
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
                CustomScrollView(
                  reverse: false,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        height: realH(120),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(realW(50))),
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
                              top: realH(double.minPositive),
                              child: Image.asset(
                                "assets/avatar.png",
                                width: realH(120),
                                height: realH(120),
                              ),
                            ),
                            Positioned(
                              right: realW(135),
                              bottom: realH(50),
                              child: DefaultTextStyle(
                                style: TextStyle(color: Colors.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Bate Papo",
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
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenHeight * 0.83,
                    child: Column(
                      children: [Expanded(child: ChatScreen()), NewMessage()],
                    ),
                  ),
                ),
                // NotificationListener<OverscrollIndicatorNotification>(
                //   onNotification: (notification) {
                //     notification.disallowGlow();
                //   },
                //   child: CustomScrollView(
                //     reverse: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     slivers: <Widget>[
                //    ChatScreen(),

                //     ],
                //   ),
                // ),
                // close button
                Positioned(
                  top: 20,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      widget.animateMessage(false);
                    },
                    child: Container(
                      width: realW(71),
                      height: realH(71),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: realW(17)),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: realW(34),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFB5E74).withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(realW(36)),
                            bottomLeft: Radius.circular(realW(36)),
                            topRight: Radius.circular(realW(36))),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: realH(30),
                //   left: 0,
                //   child: GestureDetector(
                //     onTap: () {

                //     },
                //     child: Container(
                //       width: screenWidth,
                //       height: realH(71),
                //       alignment: Alignment.centerRight,
                //       padding: EdgeInsets.only(right: realW(17)),
                //       child:NewMessage()

                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      );
    } else {
      return const Padding(padding: EdgeInsets.all(0));
    }
  }
}
