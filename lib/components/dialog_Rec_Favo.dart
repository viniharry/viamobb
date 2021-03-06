import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';

const testKeys = [Key("fancyButtons"), Key("flatButtons")];

class RecFavDialog extends StatefulWidget {
  const RecFavDialog(
      {Key key,
      //@required this.title,
      this.descreption2,
      this.descreption,
      this.descreption3,
      this.descreption4,
      this.titleDescreption2,
      this.titleDescreption,
      this.titleDescreption3,
      this.titleDescreption4,
      this.titleDescreption5,
      this.titleDescreption6,
      this.okFun,
      this.cancelFun,
      this.animationType = 1,
      this.gifPath = "assets/avatar.png",
      this.cancelColor = Colors.grey,
      this.okColor = Colors.pink,
      this.ok = " OK !",
      this.cancel = "Cancel",
      this.theme = 0,
      
      this.descreption5,
      this.descreption6 //default theme is fancy
      })
      : super(key: key);

  //final String title;
  final String descreption;
  final String descreption2;
  final String descreption3;
  final String descreption4;
  final String descreption5;
  final String descreption6;
  final String titleDescreption;
  final String titleDescreption2;
  final String titleDescreption3;
  final String titleDescreption4;
  final String titleDescreption5;
  final String titleDescreption6;
  final Function okFun;
  final Function cancelFun;
  final int animationType;
  final String gifPath;
  final Color okColor;
  final Color cancelColor;
  final String ok;
  final String cancel;
  final int theme; // 0: fancy , 1:flat
  @override
  GifDialogState createState() {
    return GifDialogState();
  }
}

class GifDialogState extends State<RecFavDialog> with TickerProviderStateMixin {
  AnimationController ac;
  Animation animation;
  double width;
  double height;
  int animationAxis = 0; // 0 for x 1 for y

  //String title;
  String descreption;
  String descreption2;
  String descreption3;
  String descreption4;
  String descreption5;
  String descreption6;
  String titleDescreption;
  String titleDescreption2;
  String titleDescreption3;
  String titleDescreption4;
  String titleDescreption5;
  String titleDescreption6;
  Function okFun;
  Function cancelFun;
  String gifPath;
  Color okColor;
  Color cancelColor;
  String ok;
  String cancel;
  int theme;
  int package = 0; //0 user assets ,1 package assets
  @override
  void initState() {
    //title = widget.title;
    descreption = widget.descreption;
    descreption2 = widget.descreption2;
    descreption3 = widget.descreption3;
    descreption4 = widget.descreption4;
    descreption5 = widget.descreption5;
    descreption6 = widget.descreption6;
    titleDescreption = widget.titleDescreption;
    titleDescreption2 = widget.titleDescreption2;
    titleDescreption3 = widget.titleDescreption3;
    titleDescreption4 = widget.titleDescreption4;
    titleDescreption5 = widget.titleDescreption5;
    titleDescreption6 = widget.titleDescreption6;
    okFun = widget.okFun;
    cancelFun = widget.cancelFun;
    okColor = widget.okColor;
    cancelColor = widget.cancelColor;
    gifPath = widget.gifPath;
    ok = widget.ok;
    cancel = widget.cancel;
    theme = widget.theme;

    // if (gifPath == 'CHECK_MAIL') {
    //   gifPath = 'assets/gif3.gif';
    //   package = 1;
    // } else if (gifPath == 'FUNNY_MAN') {
    //   gifPath = 'assets/gif1.gif';
    //   package = 1;
    // } else if (gifPath == 'MOVE_FORWARD') {
    //   gifPath = 'assets/gif4.gif';
    //   package = 1;
    // } else if (gifPath == 'PLAY_MEDIA') {
    //   gifPath = 'assets/gif2.gif';
    //   package = 1;
    // } else if (gifPath == 'SUBMIT') {
    //   gifPath = 'assets/gif5.gif';
    //   package = 1;
    // } else if (gifPath == 'SHARE') {
    //   gifPath = 'assets/gif6.gif';
    //   package = 1;
    // }
    double start;
    int animationType = widget.animationType;
    switch (animationType) {
      case 1:
        {
          start = -1.0;
          break;
        }
      case -1:
        {
          start = 1.0;
          break;
        }
      case 2:
        {
          start = -1.0;
          break;
        }
      case -2:
        {
          start = 1.0;
          break;
        }
    }
    if (animationType.abs() == 2) animationAxis = 1;
    ac =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation = Tween(begin: start, end: 0.0)
        .animate(CurvedAnimation(parent: ac, curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });

    ac.forward();
    super.initState();
  }

  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var dialogWidth = 0.36 * height;

    assert(MediaQuery.of(context, nullOk: true) != null,
        '\n****context does not contain media query object***\n');
    //assert(title != null, '\n****title is required***\n');
    assert(descreption != null, '\n****descreption is required***\n');

    var image = ClipRRect(
      child: Image.asset(
        gifPath,
        fit: BoxFit.fill,
        width: dialogWidth * 1.1, // dialogWidth will get left/right margin?
        height: dialogWidth * 0.6,
        package: package == 1 ? 'fancy_dialog' : null,
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(theme == 0 ? 15 : 0),
          topRight: Radius.circular(theme == 0 ? 15 : 0)),
    );

    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).pop();
      // },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15),
          width: dialogWidth*2,
          transform: Matrix4.translationValues(
              animationAxis == 0 ? animation.value * width : 0,
              animationAxis == 1 ? animation.value * width : 0,
              0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //image,
              // Padding(
              //   padding: const EdgeInsets.all(5),
              //   child: Text(
              //     title,
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: screenWidth * 0.06,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
               titleDescreption == null ? Container() :
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(titleDescreption),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        width: realW(180),
                        child: Text(
                          descreption,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.042,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                ],
              ),
               titleDescreption2 == null ? Container() :
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(titleDescreption2),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        width: realW(180),
                        child: Text(
                          descreption2,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.042,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                ],
              ),
               titleDescreption3 == null ? Container() :
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(titleDescreption3),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        child: Text(
                          descreption3,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.042,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                ],
              ),
              titleDescreption4 == null ? Container() :
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(titleDescreption4),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        child: Text(
                          descreption4,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.042,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                ],
              ),
              UIHelper.verticalSpace(15),
              Container(
                child: Row(
                  mainAxisAlignment: theme == 1
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.center,
                  children: <Widget>[
                    theme == 0
                        ? customButton(cancel, cancelColor, cancelFun)
                        : flatButton(cancel, cancelColor, cancelFun),
                    SizedBox(
                      width: 50,
                    ),
                    theme == 0
                        ? customButton(ok, okColor, okFun)
                        : flatButton(ok, okColor, okFun)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(String t, Color c, Function f) {
    return Container(
      child: RaisedButton(
        key: testKeys[0],
       
        color: c,
        child: Text(
          t,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.042,
            
          ),
        ),
        onPressed: () {
          f != null ? f() : print("function is null");
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget flatButton(String t, Color c, Function f) {
    return Container(
      child: FlatButton(
        key: testKeys[1],
        child: Text(
          t,
          style: TextStyle(color: c, fontSize: 15),
        ),
        onPressed: () {
          f != null ? f() : print("function is null");
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
