import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:viamobb_passageiro/components/dialog_Rec_Favo.dart';
import 'package:viamobb_passageiro/components/dialog_corrida.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../../constants.dart';

/// Drawer Menu
class DriversWidget extends StatefulWidget {
  final num currentDriversPercent;
  final Function(bool) animateDrivers;

  DriversWidget({Key key, this.currentDriversPercent, this.animateDrivers})
      : super(key: key);

  @override
  _DriversWidgetState createState() => _DriversWidgetState();
}

class _DriversWidgetState extends State<DriversWidget> {
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
  @override
  Widget build(BuildContext context) {
    return widget.currentDriversPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * widget.currentDriversPercent),
            top: realH(-205 + 358 * widget.currentDriversPercent),
            width: realW(358),
            height: screenHeight * 0.773,
            child: Opacity(
              opacity: widget.currentDriversPercent,
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
                          Container(
                            height: screenHeight * 0.68,
                            width: screenWidth,
                            child: ListView.builder(
                                itemCount: message1.length,
                                itemBuilder: (ctx, i) {
                                  return Card(
                                    elevation: 4,
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/avatar.png",
                                                width: realH(80),
                                                height: realH(80),
                                              ),
                                              UIHelper.horizontalSpace(8),
                                              Column(
                                                children: [
                                                  Text(
                                                    message1[i],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      letterSpacing: 1.5,
                                                      fontSize:
                                                          screenWidth * 0.042,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                  UIHelper.verticalSpace(5),
                                                  Text(
                                                    '25/12/2021',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      letterSpacing: 1.5,
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        RecFavDialog(
                                                            //title: '.',
                                                            descreption:
                                                                'Fulano Fulaninho da Silva Pinto',
                                                            descreption2:
                                                                'Rua Imaginária da Nossa Senhora',
                                                            descreption3:
                                                                '25 km',
                                                            descreption4:
                                                                'R\$ 18,63',
                                                            ok: 'Ok!',
                                                            cancel: 'Cancelar',
                                                            okColor:
                                                                kAmberColor,
                                                            cancelFun: () =>
                                                                RecFavDialog(
                                                                  descreption:
                                                                      'Fulano Fulaninho da Silva Pinto',
                                                                  descreption2:
                                                                      'Rua Imaginária da Nossa Senhora',
                                                                  descreption3:
                                                                      '25 km',
                                                                  descreption4:
                                                                      'R\$ 18,63',
                                                                  ok: 'Ok!',
                                                                  cancel:
                                                                      'Cancelar',
                                                                  okColor:
                                                                      kAmberColor,
                                                                )
                                                                )
                                                                );
                                              },
                                              child: Text('Detalhes'))
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),

                    // close button
                    Positioned(
                      bottom: double.minPositive,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          widget.animateDrivers(false);
                        },
                        child: Container(
                          width: realW(71),
                          height: realH(71),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: realW(17)),
                          child: Icon(
                            Icons.person_add_rounded,
                            color: kBlueColor,
                            size: realW(34),
                          ),
                          decoration: BoxDecoration(
                            color: kBlueColor.withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(realW(36)),
                                topLeft: Radius.circular(realW(36))),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: double.minPositive,
                      child: GestureDetector(
                        onTap: () {
                          widget.animateDrivers(false);
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
