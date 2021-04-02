import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:star_wars_app/src/page/start_page.dart';
import 'package:star_wars_app/src/providers/provider_bloc.dart';
import 'package:star_wars_app/src/providers/provider_people.dart';
import 'package:star_wars_app/src/widgets/widget_alert.dart';



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
                            onTap: () async {
                                Bloc bloc = ProviderBloc.of(context);
                                final resp = await alertYesNo(context: context, title:  'modo',body: 'Elige el modo de conexión');
                                bloc.changeMode(resp);
                                if(resp==true){
                                    PeopleProvider _peopleProvider = PeopleProvider();
                                   final data = await _peopleProvider.getPeople();
                                    for (var item in data.results) {
                                     final resul = await   _peopleProvider.insetPeopleFirebase(item);
                                     if(resul['ok']==true){
                                         alertOk(context: context,body: 'Modo Online activado',title: 'Modo ONLINE');
                                     }
                                    }
                                }

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


