import 'package:flutter/material.dart';
import 'package:star_wars_app/src/page/start_page.dart';

///////////////////////////////////////////////////////
//// DON'T DELETE AND ADIT COMMENTS OF THIS PAGE  /////
//// Enter the routes in their respective module  /////
///////////////////////////////////////////////////////
class ApplicationRoutes {
    static Map<String, WidgetBuilder> getApplicationRoutes(){
        return <String, WidgetBuilder> {
            //#application
            StartPage.routeName       : (BuildContext context) => StartPage(),

        };
    }
}



//////////////////////////////////////
//////////////////////////////////////
///  MUST BE IMPLEMENT NEXT CLASS  ///
//////////////////////////////////////

class StarWarsRoutes{
    static void starWarsNavigator({BuildContext context, String routeName}){
        Navigator.of(context).push(_createRoute(destinationPage: _navigationData[routeName]),);
    }

    static Route _createRoute({dynamic destinationPage}) {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
            transitionsBuilder: (context, animation, secondaryAnimation, child) { return child;},
        );
    }

    static Map<String, dynamic> _navigationData = {

        //#application()
        StartPage.routeName           : StartPage(),

    };
}
