import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_app/src/page/detail_page.dart';
import 'package:star_wars_app/src/widgets/appBar.dart';
import 'package:star_wars_app/src/widgets/widget_drawer.dart';
import 'package:star_wars_app/utils/styles/app_colors.dart';



class HomePage extends StatefulWidget {
    static final String routeName = 'home_page';
    _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {



    @override
    Widget build(BuildContext context) {
        return WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar:  _normalAppBar(),
                    drawer: AppDrawer(),
                    body: _body(),
                )
        );
    }


    Widget _normalAppBar(){
        return starWarsAppBar(context: context, title: 'Home', actionsAvailables: <Widget>[], fontFamily: 'NordiqueProBold',showHelp: false);
    }



    Widget _body(){
        return StreamBuilder(
                stream: Firestore.instance.collection('people').snapshots(),
                builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(!snapshot.hasData){
                        return Center(
                            child: CircularProgressIndicator(),
                        );
                    }
                    List<DocumentSnapshot> docs = snapshot.data.documents;
                    return ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index){
                                Map<String, dynamic> data = docs[index].data;
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Center(child: Text(data['name'])),
                                        trailing: Padding(
                                            padding: const EdgeInsets.only(top: 22),
                                            child: Icon(Icons.navigate_next,color:  AppColors.appBlue),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Row(children: [
                                                Text('Gender: ',style: TextStyle(color: Colors.black87,fontSize: 15),),
                                                Text(data['gender']),
                                              ],),
                                              Row(children: [
                                                  Text('Mass: ',style: TextStyle(color: Colors.black87,fontSize: 15),),
                                                  Text(data['mass'].toString()),
                                              ],),
                                          ],
                                        ),
                                        onTap: (){
                                            Navigator.pushNamed(context, DetailPage.routeName,arguments: { 'data': data, } );
                                        },
                                    ),
                                      Divider(),
                                  ],
                                );
                            }
                    );
                }
        );
    }


}


