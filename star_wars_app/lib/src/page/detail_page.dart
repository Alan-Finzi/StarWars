import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_app/src/widgets/appBar.dart';
import 'package:star_wars_app/src/widgets/widget_drawer.dart';


class DetailPage extends StatefulWidget {
    static final String routeName = 'detail_page';
    _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {



    @override
    Widget build(BuildContext context) {
        Map<String, dynamic> mapsArgument = ModalRoute.of(context).settings.arguments;
        Map<String, dynamic> data = mapsArgument['data'];

        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  _normalAppBar(),
            drawer: AppDrawer(),
            body: _body(data),
        );
    }


    Widget _normalAppBar(){
        return starWarsAppBar(context: context, title: 'Detalle', actionsAvailables: <Widget>[], fontFamily: 'NordiqueProBold',showHelp: false);
    }

    Widget _body(  Map<String, dynamic> data){
        return Column(
          children: [
            ListTile(
                title: Center(child: Text(data['name'],style: TextStyle(fontSize: 20,color: Colors.black87),)),
                subtitle: Column(
                    children: [
                        SizedBox(height: 10,),
                        Row(children: [
                            Text('Gender: ',style: TextStyle(color: Colors.black87,fontSize: 18),),
                            Text(data['gender'],style: TextStyle(color: Colors.black87,fontSize: 18)),
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                            Text('Mass: ',style: TextStyle(color: Colors.black87,fontSize: 18),),
                            Text(data['mass'].toString(),style: TextStyle(color: Colors.black87,fontSize: 18)),
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                            Text('hair color: ',style: TextStyle(color: Colors.black87,fontSize: 18),),
                            Text(data['hair_color'].toString(),style: TextStyle(color: Colors.black87,fontSize: 18)),
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                            Text('height: ',style: TextStyle(color: Colors.black87,fontSize: 18),),
                            Text(data['height'].toString(),style: TextStyle(color: Colors.black87,fontSize: 18)),
                        ],),
                    ],
                ),
            ),
          ],
        );
    }
}


