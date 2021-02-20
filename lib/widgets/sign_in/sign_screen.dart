import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../constants.dart';
import '../../helpers/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double width;
  bool _showPass = false;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<ScaffoldState> scafolfKey = GlobalKey<ScaffoldState>();

final TextEditingController phoneEditingController = TextEditingController();
  
var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
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
                        'Acesse',
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
                              _buildPhoneTF(),
                              SizedBox(
                                height: 20.0,
                              ),
                              
                            ],
                          )),

                      //_buildForgotPasswordBtn(),

                      

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.maxFinite,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/cod_page');
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: kBlueColor,
                          disabledColor: kBlueColor.withAlpha(100),
                          child: Text(
                            'Enviar código',
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

                      
                      UIHelper.verticalSpace(width*0.6),
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

  Widget _buildEmailTF() {
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
          height: width * 0.15,
          child: TextFormField(
            controller: emailController,
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
              hintText: 'Digite seu e-mail',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
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
          height: width * 0.15,
          child: TextFormField(
            controller: passController,
            validator: (pass) {
              if (pass.isEmpty || pass.length < 6) return 'Senha invalida';
              return null;
            },
            obscureText: _showPass == false ? true : false,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPass = !_showPass;
                    });
                  },
                  child: Icon(
                    _showPass == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color(0xFF007bff),
                  )),
              hintText: 'Digite sua senha',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

//fdcf00
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, 'register_page'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu a senha?',
          style: kLabelStyle.copyWith(color: kAmberColor, fontSize: width*0.05),
        ),
      ),
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
                color:  kAmberColor,
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
      onTap: () => Navigator.pushNamed(context, '/register_page'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Precisa de ajuda? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Fale conosco',
              style: TextStyle(
                color:  kAmberColor,
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
