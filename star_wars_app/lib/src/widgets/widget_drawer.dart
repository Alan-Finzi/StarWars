import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:star_wars_app/src/page/start_page.dart';



class AppDrawer extends StatefulWidget {
    const AppDrawer({Key key,}) : super(key: key);

    @override
    _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
    @override
    Widget build(BuildContext context) {
        return Drawer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Divider(height: 0,),
                        SizedBox(height: 20,),
                        ListTile(
                            leading: Container(width: 50.0, child: Icon(Icons.add_circle), padding: EdgeInsets.symmetric(horizontal: 15),),
                            title: Text('Modo'),
                            onTap: (){

                            },
                        ),
                        SizedBox(height: 20,),
                        Divider(height: 0,),
                        SizedBox(height: 20,),
                        ListTile(
                            leading: Container(width: 50.0, child: Icon(Icons.close), padding: EdgeInsets.symmetric(horizontal: 15),),
                            title: Text('Cerrar sesión'),
                            onTap: (){
                               Navigator.pushNamed(context, StartPage.routeName);
                            },
                        ),
                        SizedBox(height: 20,),
                        Divider(height: 0,),
                    ],
                )
        );
    }
}


