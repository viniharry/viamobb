


import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/constants.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool belongsToMe;
  MessageBubble(this.message, {this.belongsToMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration:BoxDecoration(
            color: kBlueColor,
            borderRadius: BorderRadius.circular(10)
          ),
          width: realW(150),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8
          ),
          child: Text(
            message,
            style: kLabelStyle,
            ),
        )
      ],
    );
  }
}