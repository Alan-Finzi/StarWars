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

    bool showProgress = false;

    @override
    Widget build(BuildContext context) {
        Bloc bloc = ProviderBloc.of(context);
        return Drawer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Divider(height: 0,),
                        SizedBox(height: 20,),
                        showProgress?
                        CircularProgressIndicator():
                        ListTile(
                            leading: Container(width: 50.0, child: Icon(Icons.add_circle), padding: EdgeInsets.symmetric(horizontal: 15),),
                            title: getText(bloc),
                            onTap: () async {
                                final resp = await alertYesNo(context: context, title:  'modo',body: 'Elige el modo de conexión');
                                setState(() {showProgress = true;});
                                bloc.changeMode(resp);
                                if(resp==true){
                                    PeopleProvider _peopleProvider = PeopleProvider();
                                   final data = await _peopleProvider.getPeople();
                                   for (var item in data.results) {
                                      await   _peopleProvider.insetPeopleFirebase(item);
                                    }
                                }
                                setState(() {showProgress = false;});
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


    Widget getText(Bloc bloc){
        return  StreamBuilder(
            stream: bloc.modeStream,
            builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                    return snapshot.data == false?
                        Text('Modo Offline') :  Text('Modo Online');
                }else{return  Text('Modo Offline');}
            },
        );
    }
}


