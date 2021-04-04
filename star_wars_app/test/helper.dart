import 'package:flutter/material.dart';

class LoadWidgetToTest extends StatelessWidget {
	final Widget widget;
  	const LoadWidgetToTest({Key key, @required this.widget}) : super(key: key);

  	@override
  	Widget build(BuildContext context) {
		return new MediaQuery(
    		data: new MediaQueryData(),
    		child: new MaterialApp(home: this.widget)
  		);
  	}
}