import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:viamobb_passageiro/components/items_menu_widget.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../constants.dart';

/// Drawer Menu
class DataWidget extends StatefulWidget {
  final num currentDataPercent;
  final Function(bool) animateData;

  DataWidget({Key key, this.currentDataPercent, this.animateData})
      : super(key: key);

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  final TextEditingController phoneEditingController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return widget.currentDataPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * widget.currentDataPercent),
            top: realH(-355 + 358 * widget.currentDataPercent),
            width: realW(358),
            height: screenHeight,
            child: Opacity(
              opacity: widget.currentDataPercent,
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
                                    left: realW(60),
                                    bottom: realH(7),
                                    child: Image.asset(
                                      "assets/lable.png",
                                      width: realH(72),
                                      height: realH(72),
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
                                  left: realW(15),
                                   right: realW(15)),
                              sliver: SliverList(

                                delegate: SliverChildListDelegate([
                                  _buildNameTF(),
                                  UIHelper.verticalSpace(20),
                                  _buildEmailTF(),
                                  UIHelper.verticalSpace(20),
                                  _buildPhoneTF(),
                                  UIHelper.verticalSpace(40),
                                  Container(
                                    padding: EdgeInsets.all(11.0),
                                    width: screenWidth / 2,
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      onPressed: () {
                                        
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      color: kBlueColor,
                                      disabledColor: kBlueColor.withAlpha(100),
                                      child: Text(
                                        'Salvar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                          fontSize: screenWidth * 0.042,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                        ],
                      ),
                    ),

                    // close button
                    Positioned(
                      bottom: realH(53),
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          widget.animateData(false);
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
                    )
                  ],
                ),
              ),
            ),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }

  Widget _buildNameTF() {
    return Column(
      children: <Widget>[
        Text(
          'Nome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: realH(70),
          child: TextFormField(
            validator: (name) {
              if (name.isEmpty)
                return 'Campo obrigatório';
              else if (name.trim().split(' ').length <= 1)
                return 'Preencha nome completo';
              return null;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Nome',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'E-mail',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: realH(70),
          child: TextFormField(
            //onSaved: (email) => users.email = email,
            validator: (email) {
              if (!emailValid(email)) return 'E-mail inválido';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'E-mail',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Telefone',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: realH(70),
          child: TextFormField(
            inputFormatters: [maskFormatter],
            controller: phoneEditingController,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone_android,
                color: Colors.black,
              ),
              hintText: 'Telefone',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
