import 'package:flutter/material.dart';
import 'package:star_wars_app/src/widgets/appBar.dart';


class StartPage extends StatelessWidget {
    static final String routeName = 'start_page';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: starWarsAppBar(
                        context: context,
                        title: 'Inicio Star Wars',
                        actionsAvailables: <Widget>[],
                        showNotifications: false,
                        fontFamily: 'NordiqueProBold',
                        showHelp: false
                ),
                body: _bodyChild(context)
        );
    }

    Widget _bodyChild(BuildContext context){
        return Stack(
            children: <Widget>[
                _background(),
                _buttonNext(context)
            ],
        );
    }


    Widget _background(){
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: 	Colors.white,
            child: Image(
                image: AssetImage('assets/images/start_page.png'),
                fit: BoxFit.cover,
            ),
        );
    }

    Widget _buttonNext(BuildContext context){
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
                    padding: EdgeInsets.only(bottom: 60.0),
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                        shape: StadiumBorder(),
                        color: Color.fromRGBO(40, 40, 120, 1.0),
                        textColor: Colors.white,
                        child: Text('Click aquí para ingresar', style: TextStyle(fontSize: 15.0),),
                        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                        onPressed: (){
                            //Navigator.pushNamed(context, FirstPage.routeName);
                        },
                    )
            ),
        );
    }
}
