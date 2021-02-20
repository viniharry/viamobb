import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../constants.dart';
import '../../helpers/ui_helper.dart';

class CodScreen extends StatefulWidget {
  @override
  _CodScreenState createState() => _CodScreenState();
}

class _CodScreenState extends State<CodScreen> {
  double width;
  bool _showPass = false;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

  final GlobalKey<ScaffoldState> scafolfKey = GlobalKey<ScaffoldState>();
 final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController phoneEditingController = TextEditingController();

  var maskFormatter =
      new MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
  final TextEditingController _newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scafolfKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF32363b),
                      Color(0xFF293139),
                      Color(0xFF252f39),
                      Color(0xFF212c38),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07,
                    vertical: width * 0.22,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Insira o código de 4 dígitos enviado para #Telefone#',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      UIHelper.verticalSpace(8),
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              _phone(),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          )),

                      //_buildForgotPasswordBtn(),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, '/register_page');
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: kBlueColor,
                          disabledColor: kBlueColor.withAlpha(100),
                          child: Text(
                            'Validar',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      //UIHelper.verticalSpace(20),

                      UIHelper.verticalSpace(width * 0.5),
                      _buildHelpBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _phone() {
    return Container(
      
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: PinPut(
        
        fieldsCount: 4,
        focusNode: _pinPutFocusNode,
        controller: pinController,
        textStyle: TextStyle(color: Colors.black, fontSize: 28),
     
    eachFieldHeight:130,
    eachFieldWidth: 50,
        submittedFieldDecoration: BoxDecoration(

      border: Border.all(color: kBlueColor),
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
    ),
    selectedFieldDecoration:BoxDecoration(
      border: Border.all(color: kAmberColor),
      borderRadius: BorderRadius.circular(15.0),
    ),
    followingFieldDecoration: BoxDecoration(
      border: Border.all(color:kAmberColor),
      borderRadius: BorderRadius.circular(5.0),
    ),
 
      ),
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Telefone',
        //   style: kLabelStyle,
        // ),
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
          height: width * 0.15,
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
              hintText: 'Digite seu número de telefone',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildLoginBtn() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 25.0),
  //     width: double.infinity,
  //     child: RaisedButton(
  //       elevation: 5.0,
  //       onPressed: () {
  //         if (formkey.currentState.validate()) {
  //           context.read<UserManeger>().loginUser(
  //               users: Users(
  //                   email: emailController.text, password: passController.text),
  //               onFail: (e) {
  //                 scafolfKey.currentState.showSnackBar(SnackBar(
  //                     backgroundColor: Colors.red, content: Text('Falha: $e')));
  //               },
  //               onSucess: () {});
  //         }
  //       },
  //       padding: EdgeInsets.all(15.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       color: Color(0xFFed3237),
  //       child: Text(
  //         'Entrar',
  //         style: TextStyle(
  //           color: Colors.white,
  //           letterSpacing: 1.5,
  //           fontSize: 22.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/register_page'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Não possui uma conta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Cadastre- se',
              style: TextStyle(
                color: kAmberColor,
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpBtn() {
    return GestureDetector(
      //onTap: () => Navigator.pushNamed(context, '/register_page'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Código será reenviado em ',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: '20',
              style: TextStyle(
                color: kAmberColor,
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Nova senha enviada para:'),
            content: TextFormField(
              controller: _newEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty) return "E-mail inválido";
              },
              decoration: InputDecoration(
                  hintText: "Email:",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                  border: InputBorder.none),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  if (_newEmailController.text.isEmpty)
                    return Text("Digite seu email");
                  else {
                    //bloc.recoverPass(_newEmailController.text);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
