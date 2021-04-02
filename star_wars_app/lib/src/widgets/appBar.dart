import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StarWarAppBar extends StatefulWidget {

    final BuildContext context;
    final String title;
    final String fontFamily;
    final Widget leading;
    final List<Widget> actionsAvailables;
    final bool showHelp;
    final Color color;
    final bool shadow;

    StarWarAppBar({@required this.context,  @required this.title, @required this.actionsAvailables,  this.fontFamily, this.leading, @required this.showHelp, this.color, this.shadow = true});

    @override
    _StarWarAppBarState createState() => _StarWarAppBarState();
}

class _StarWarAppBarState extends State<StarWarAppBar> {
    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text(widget.title, style: TextStyle(fontFamily: widget.fontFamily, fontSize: 20.0)),
            backgroundColor:widget.color== null? Colors.blue : widget.color,
            centerTitle: false,
            actions: _actionsAvailables( actions: widget.actionsAvailables, showHelp: widget.showHelp),
            leading: widget.leading,
            shadowColor: widget.shadow ? Colors.black : Colors.transparent,
        );
    }

    List<Widget> _actionsAvailables({ List<Widget> actions, @required bool showHelp} ){
            if(showHelp==true){
                actions.add(_help());
            }
         return actions;
    }


    Widget _help(){
        return GestureDetector(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Icon(Icons.help_outline),
            ),
        );
    }


}




Widget starWarsAppBar({@required BuildContext context, @required bool showHelp, @required String title, bool showNotifications, String fontFamily,  List<Widget> actionsAvailables, Widget leading, Color color, bool shadow = false}){
    if (fontFamily != null && fontFamily.isEmpty){ fontFamily = "ComicSans";}
    return PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: TextScaleFactorClamper(
                child: StarWarAppBar(
                    context: context,
                    title: title,
                    color: color,
                    actionsAvailables: actionsAvailables,
                    fontFamily: fontFamily,
                    leading: leading,
                    showHelp: showHelp ,
                    shadow: shadow,
                ),
            )
    );
}



class TextScaleFactorClamper extends StatelessWidget {
    const TextScaleFactorClamper({@required this.child});
    final Widget child;

    @override
    Widget build(BuildContext context) {
        final mediaQueryData = MediaQuery.of(context);
        final constrainedTextScaleFactor =
        mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
            data: mediaQueryData.copyWith(
                textScaleFactor: constrainedTextScaleFactor,
            ),
            child: child,
        );
    }
}