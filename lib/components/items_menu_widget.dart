import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/constants.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key key, this.title, this.onTap, this.iconData}) : super(key: key);

  final String title;
  final Function onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
          child: SizedBox(
        height: realH(75),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: Icon(
                iconData,
                size: realW(25),
                color: kBlueColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: realW(20)),
            ),
          ],
        ),
      ),
    );
  }
}
