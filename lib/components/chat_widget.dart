import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/message_bubble.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  

  final message1 = ['Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?','Olá tudo bem?',];
  final message2 = ['dsfdsafasfasdfasdf'];

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: message1.length,
      itemBuilder: (ctx, i){
        return MessageBubble(
          message1[i],
          belongsToMe: true,
          );
      }
      );
    // SliverPadding(
    //     padding:
    //         EdgeInsets.only(top: realH(34), bottom: realH(50), left: realW(37)),
    //     sliver: 
    //     SliverFixedExtentList(
    //       itemExtent: realH(56), 
    //       delegate:
    //           SliverChildBuilderDelegate((BuildContext context, int index) {
    //         return Container(
    //           padding: EdgeInsets.all(10),
    //           child: Text(message1[index]),
    //         );
    //       }, childCount: message1.length),
    //     )
    //     );
  }
}
