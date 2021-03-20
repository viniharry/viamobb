import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/widgets/cod/cod.dart';
import 'package:viamobb_passageiro/widgets/maps/map_screen.dart';
import 'package:viamobb_passageiro/widgets/maps/map_screen.dart';
import 'package:viamobb_passageiro/widgets/menu/dados/data_widget.dart';
import 'package:viamobb_passageiro/widgets/sign_in/sign_screen.dart';
import 'package:viamobb_passageiro/widgets/sign_up/sign_up_screen.dart';
import 'package:viamobb_passageiro/widgets/splash/splash_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Via Mobb',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       routes: {
            '/': (context) => SplashScreen(),
            '/login_page': (context) => LoginScreen(),
            '/register_page': (context) => RegisterScreen(),
            '/cod_page': (context) => CodScreen(),
            '/data_page': (context) => DataWidget(),

            
            '/map_page': (context) => MapScreen(),
             //'/': (context) => MapScreen(),
          }
    );
  }
}

