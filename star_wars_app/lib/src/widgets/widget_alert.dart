import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_app/utils/styles/app_colors.dart';

Future<bool> alertYesNo({BuildContext context, String title, String body}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
            return AlertDialog(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                shape: Border.all(color: AppColors.appBlue,),
                title: Text(title),
                content: ListTile(title: Text(body)),
                actions: <Widget>[
                    FlatButton(
                        child: Text('offline'),
                        onPressed: () {Navigator.pop(context, false);},
                    ),
                    FlatButton(
                        child: Text('online'),
                        onPressed: () {Navigator.pop(context, true);},
                    )
                ],
            );
        },
    );
}

Future<String> alertOk({BuildContext context, String title, String body}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
            return AlertDialog(
                shape: Border.all(color: AppColors.appBlue,),
                title: Text(title),
                content: Text(body),
                actions: <Widget>[
                    FlatButton(
                        child: Text('Ok'),
                        onPressed: () {Navigator.pop(context, 'OK');},
                    )
                ],
            );
        },
    );
}