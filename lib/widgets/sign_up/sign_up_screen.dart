

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../constants.dart';
import '../../helpers/ui_helper.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scafolfKey = GlobalKey<ScaffoldState>();
  bool _showPass = false;
  bool _showConfirmPass = false;
   double width;

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
                     horizontal: width*0.07,
                      vertical: width*0.22,
                  ),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Cadastre- se',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize:  width*0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UIHelper.verticalSpace(8),
                          Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  _buildNameTF(),
                                  UIHelper.verticalSpace(20),
                                  _buildEmailTF(),
                                  UIHelper.verticalSpace(20),
                                  _buildPasswordTF(),
                                  UIHelper.verticalSpace(20),
                                  _buildConfirmPasswordTF()
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 5.0,
                              onPressed: (){
                                Navigator.popAndPushNamed(context, '/map_page');
                              },
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: kBlueColor,
                              child: Text(
                                      'Cadastrar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                        fontSize:width*0.06,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                            ),
                          ),
                          UIHelper.verticalSpace(20),
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

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: width*0.15,
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
              hintText: 'Digite seu nome',
              hintStyle:kHintTextStyle.copyWith(color: Colors.black),
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
          height: width*0.15,
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
          height: width*0.15,
          child: TextFormField(
            //onSaved: (pass) => users.password = pass,
            validator: (pass) {
              if (pass.isEmpty)
                return 'Senha invalida';
              else if (pass.length < 6) return 'Senha muito curta';
              return null;
            },
            obscureText:_showPass == false? true: false,
            style: TextStyle(
              color: Colors.white,
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
                onTap: (){
                  setState(() {
                    _showPass = !_showPass;
                  });
                },
                  child: Icon( _showPass == false ?
                Icons.visibility_off : Icons.visibility,
                color: kBlueColor,
              )),
              hintText: 'Digite sua senha',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmar senha',
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
          height: width*0.15,
          child: TextFormField(
            //onSaved: (confirmPass) => users.confirmPass = confirmPass,
            validator: (pass) {
              if (pass.isEmpty)
                return 'Senha invalida';
              else if (pass.length < 6) return 'Senha muito curta';
              return null;
            },
            obscureText:_showConfirmPass == false? true: false,
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
                onTap: (){
                  setState(() {
                    _showConfirmPass = !_showConfirmPass;
                  });
                },
                  child: Icon( _showConfirmPass == false ?
                Icons.visibility_off : Icons.visibility,
                color: kBlueColor,
              )),
              hintText: 'Confirme sua senha',
              hintStyle: kHintTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
