import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_app/src/providers/provider_bloc.dart';
import 'package:star_wars_app/src/providers/provider_report.dart';
import 'package:star_wars_app/src/widgets/appBar.dart';
import 'package:star_wars_app/src/widgets/widget_alert.dart';
import 'package:star_wars_app/src/widgets/widget_card_people.dart';
import 'package:star_wars_app/src/widgets/widget_curve.dart';
import 'package:star_wars_app/src/widgets/widget_drawer.dart';
import 'package:star_wars_app/utils/styles/app_colors.dart';


class DetailPage extends StatefulWidget {
    static final String routeName = 'detail_page';
    _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {



    @override
    Widget build(BuildContext context) {
        Map<String, dynamic> mapsArgument = ModalRoute.of(context).settings.arguments;
        Map<String, dynamic> data = mapsArgument['data'];
        Bloc bloc = ProviderBloc.of(context);

        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  _normalAppBar(),
            drawer: AppDrawer(),
            body: _body(data,bloc ),
        );
    }


    Widget _normalAppBar(){
        return starWarsAppBar(context: context, title: 'Detalle', actionsAvailables: <Widget>[], fontFamily: 'NordiqueProBold',showHelp: false);
    }

    Widget _body(  Map<String, dynamic> data, Bloc bloc){
        return Column(
          children: [
            ListTile(
                title: Center(child: Text(data['name'],style: TextStyle(fontSize: 20,color: Colors.black87),)),
                subtitle: Column(
                    children: [
                        SizedBox(height: 10,),
                        WidgetCardDetailPeople(title1: 'Gender',value1: data['gender'],title2: 'Mass',value2: data['mass'].toString(),width: MediaQuery.of(context).size.width-55,),
                        WidgetCardDetailPeople(title1: 'hair color',value1: data['hair_color'].toString(),title2: 'height',value2: data['height'].toString(),width: MediaQuery.of(context).size.width-55,),
                    ],
                ),
            ),
             Spacer(),

              showButtonReport(bloc, data)
          ],
        );
    }

    Widget showButtonReport(Bloc bloc, Map<String, dynamic> data ){

        return StreamBuilder(
            stream: bloc.modeStream,
            builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                    return snapshot.data == false?
                    Container() :
                    Container(
                            padding: EdgeInsets.only(bottom: 60.0),
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                                shape: StadiumBorder(),
                                color: Color.fromRGBO(40, 40, 120, 1.0),
                                child: WidgetRipplesAnimation(width:200,height:50,borderRadiusSize: 20,child: Text('Click aquí para reportar', style: TextStyle(fontSize: 15.0,color: Colors.white),) ,color: AppColors.appBlue,),
                                onPressed: () async {
                                    ReportProvider _reportProvider = ReportProvider();
                                    final resp = await  _reportProvider.createReport(userId: 1, characterName: data['name']);
                                    if(resp == true){
                                        await  alertOk(title: 'Reporte exitoso ',body: 'Gracias por tu reporte y que la fuerza te acompañe',context: context);
                                    }else{
                                        await  alertOk(title: 'Error',body: 'No se pudo realizar el reporte, la fuerza no te acompaño ',context: context);
                                    }
                                    Navigator.pop(context);
                                },
                            )
                    );
                }else{return Container();}
            },
        );
    }
}


