import 'package:flutter/material.dart';
import 'package:star_wars_app/utils/styles/app_colors.dart';

class WidgetCardDetailPeople extends StatelessWidget {
    final String title1;
    final String value1;
    final String title2;
    final String value2;
    final double width;

    const WidgetCardDetailPeople({Key key,@required this.title1, this.value1, this.title2, this.value2, this.width}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Card(
                margin: EdgeInsets.all(0),
                elevation: 15,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: width,
                    child: IntrinsicHeight(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                Container(
                                    width: width * 0.49 ,
                                    child: Column(
                                        children: [
                                            Text(title1, style: TextStyle(fontSize: 12, color: Colors.black),),
                                            Text(value1, style: TextStyle(fontSize: 18, color: Colors.black),),
                                            SizedBox(height: 5,),
                                        ],
                                    ),
                                ) ,
                                Container(
                                        width: width * 0.01 ,
                                        child: VerticalDivider(color: Colors.black87,width: 10,)),
                                Container(
                                    width: width * 0.49 ,
                                    child: Column(
                                        children: [
                                            Text(title2, style: TextStyle(fontSize: 12, color: AppColors.appBlue),),
                                            Text(value2, style: TextStyle(fontSize: 18, color: AppColors.appBlue),),
                                            SizedBox(height: 5,),
                                        ],
                                    ),
                                ) ,
                            ],
                        ),
                    ),
                ),
            ),
        );
    }

}
