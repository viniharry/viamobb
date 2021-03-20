import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viamobb_passageiro/components/dialog_Rec_Favo.dart';
import 'package:viamobb_passageiro/components/dialog_corrida.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../../constants.dart';

/// Drawer Menu
class ContactWidget extends StatefulWidget {
  final num currentContactPercent;
  final Function(bool) animateContact;

  ContactWidget({Key key, this.currentContactPercent, this.animateContact})
      : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  final TextEditingController phoneEditingController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  final message1 = [
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
  ];

  final String cel = "(17)99609-8828";
  final String tel = "(34)99833-5866";
  @override
  Widget build(BuildContext context) {
    return widget.currentContactPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * widget.currentContactPercent),
            top: realH(-205 + 358 * widget.currentContactPercent),
            width: realW(358),
            height: screenHeight * 0.773,
            child: Opacity(
              opacity: widget.currentContactPercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius:
                  //     BorderRadius.only(topRight: Radius.circular(realW(50))),
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              'Fale com a nossa equipe!',
                              style: kPrimalStyle.copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(cel,  style: kPrimalStyle.copyWith(color: Colors.black)),
                              ),
                              InkWell(
                                child: Icon(Icons.phone_in_talk_rounded,
                                    color: Theme.of(context).primaryColor),
                                onTap: () async {
                                  String number = "tel:+55$cel";
                                  if (await canLaunch(number)) {
                                    await launch(number);
                                  } else {
                                    throw 'Could not launch $cel';
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(tel,  style: kPrimalStyle.copyWith(color: Colors.black)),
                              ),
                             
                              InkWell(
                                child: Icon(Icons.phone_in_talk_rounded,
                                    color: Theme.of(context).primaryColor),
                                onTap: () async {
                                  String number = "tel:+55$tel";
                                  if (await canLaunch(number)) {
                                    await launch(number);
                                  } else {
                                    throw 'Could not launch $tel';
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // close button
                   
                    Positioned(
                      bottom: double.minPositive,
                      child: GestureDetector(
                        onTap: () {
                          widget.animateContact(false);
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
