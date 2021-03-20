import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/components/dialog_Rec_Favo.dart';
import 'package:viamobb_passageiro/components/dialog_corrida.dart';
import 'package:viamobb_passageiro/helpers/ui_helper.dart';
import 'package:viamobb_passageiro/helpers/validator.dart';

import '../../constants.dart';

class ExploreContentWidget extends StatefulWidget {
  final double currentExplorePercent;

  const ExploreContentWidget({Key key, this.currentExplorePercent})
      : super(key: key);

  @override
  _ExploreContentWidgetState createState() => _ExploreContentWidgetState();
}

class _ExploreContentWidgetState extends State<ExploreContentWidget> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController enderecoController = TextEditingController();

  final PageController _pageController = PageController(initialPage: 0);
  final int _numPage = 2;
  int _currentPage = 0;
  bool isFavorite = true;

  final message1 = [
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
    'Olá tudo bem?',
  ];

  final messages2 = [
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
    'Recentes',
  ];

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Transform.translate(
      offset: Offset(screenWidth / -6 * (1 - widget.currentExplorePercent),
          screenWidth / 3 / 2 * (1 - widget.currentExplorePercent)),
      child: AnimatedContainer(
        duration: Duration(microseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: realH(20),
        width: isActive ? 30 : 16,
        decoration: BoxDecoration(
            color: isActive ? kBlueColor : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentExplorePercent != 0) {
      return Positioned(
        top: realH(standardHeight +
            (230 - standardHeight) * widget.currentExplorePercent),
        width: screenWidth,
        child: Container(
          height: screenHeight,
          child: Column(
            children: <Widget>[
              Opacity(
                opacity: widget.currentExplorePercent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(
                            screenWidth /
                                3 *
                                (1 - widget.currentExplorePercent),
                            screenWidth /
                                3 /
                                2 *
                                (1 - widget.currentExplorePercent)),
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: enderecoController,
                            validator: (email) {
                              if (!emailValid(email)) return 'E-mail inválido';
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //contentPadding: EdgeInsets.only(top: 14.0),
                              labelText: 'Endereço',
                              hintStyle:
                                  kHintTextStyle.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(
                        screenWidth / 3 * (1 - widget.currentExplorePercent),
                        screenWidth /
                            3 /
                            2 *
                            (1 - widget.currentExplorePercent)),
                    child: Container(
                      padding: EdgeInsets.all(11.0),
                      width: screenWidth / 2,
                      child: RaisedButton(
                        shape: Border.all(color: kAmberColor),
                        elevation: 5.0,
                        onPressed: () {},
                        padding: EdgeInsets.all(15.0),
                        color: Colors.white,
                        disabledColor: kBlueColor.withAlpha(100),
                        child: Text(
                          'Localização',
                          style: TextStyle(
                            color: kAmberColor,
                            letterSpacing: 1.5,
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        screenWidth / -6 * (1 - widget.currentExplorePercent),
                        screenWidth /
                            3 /
                            2 *
                            (1 - widget.currentExplorePercent)),
                    child: Container(
                      padding: EdgeInsets.all(11.0),
                      width: screenWidth / 2,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => FancyDialog(
                                    title: 'Escolha sua corrida:',
                                    ok: 'Pronto!',
                                    cancel: 'Cancelar',
                                    okColor: kBlueColor,
                                    descreption: 'Rápida',
                                    descreption2: 'Normal',
                                  ));
                        },
                        padding: EdgeInsets.all(15.0),
                        color: kBlueColor,
                        disabledColor: kBlueColor.withAlpha(100),
                        child: Text(
                          'Enviar endereço',
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
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: realH(20)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.translate(
                    offset: Offset(
                        screenWidth / 3 * (1 - widget.currentExplorePercent),
                        screenWidth /
                            3 /
                            2 *
                            (1 - widget.currentExplorePercent)),
                    child: InkWell(
                      onTap: () {
                        _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Text(
                        'Favoritos',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        screenWidth / -6 * (1 - widget.currentExplorePercent),
                        screenWidth /
                            3 /
                            2 *
                            (1 - widget.currentExplorePercent)),
                    child: InkWell(
                      onTap: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Text(
                        'Recentes',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildPageIndicator(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                child: PageView(
                  //physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    ListView.builder(
                        itemCount: message1.length,
                        itemBuilder: (ctx, i) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () => setState(
                                              () => isFavorite = !isFavorite),
                                          child: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: kAmberColor,
                                          )),
                                      UIHelper.horizontalSpace(8),
                                      Text(
                                        message1[i],
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: screenWidth * 0.042,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                RecFavDialog(
                                                  //title: '.',
                                                  titleDescreption:
                                                      'Motorista:',
                                                  descreption:
                                                      'Fulano Fulaninho da Silva Pinto',
                                                  titleDescreption2:
                                                      'Endereço:',
                                                  descreption2:
                                                      'Rua Imaginária da Nossa Senhora',
                                                  titleDescreption3:
                                                      'Distância:',
                                                  descreption3: '25 km',
                                                  titleDescreption4: 'Valor:',
                                                  descreption4: 'R\$ 18,63',
                                                  ok: 'Repetir!',
                                                  cancel: 'CANCELAR',
                                                  okColor: kBlueColor,
                                                ));
                                      },
                                      child: Text('Detalhes'))
                                ],
                              ),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: message1.length,
                        itemBuilder: (ctx, i) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    messages2[i],
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.5,
                                      fontSize: screenWidth * 0.042,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                RecFavDialog(
                                                  //title: 'Detalhes:',
                                                  titleDescreption:
                                                      'Motorista:',
                                                  descreption: 'Rápida',
                                                  titleDescreption2:
                                                      'Endereço:',
                                                  descreption2: 'Normal',
                                                  titleDescreption3:
                                                      'Distância:',
                                                  descreption3: 'Normal',
                                                  titleDescreption4: 'Valor:',
                                                  descreption4: 'Normal',
                                                  ok: 'Repetir!',
                                                  cancel: 'Cancelar',
                                                  okColor: kBlueColor,
                                                ));
                                      },
                                      child: Text('Detalhes'))
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text('asdsa'),
                //     Text('data')
                //   ],
                // ),
              )
            ],
          ),
        ),
      );
    } else {
      return const Padding(
        padding: const EdgeInsets.all(0),
      );
    }
  }
}
