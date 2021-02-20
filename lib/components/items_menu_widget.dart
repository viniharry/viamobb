import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key key, this.title, this.onTap}) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: realW(321),
      height: realH(55),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: realW(20)),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: realW(20)),
        ),
      ),
    );
  }
}
