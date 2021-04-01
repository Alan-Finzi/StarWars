import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_wars_app/src/page/start_page.dart';
import 'package:star_wars_app/src/providers/provider_bloc.dart';
import 'package:star_wars_app/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
    String _initialRoute = StartPage.routeName;
    WidgetsFlutterBinding.ensureInitialized();


    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
        runApp(StarWarsApp(initialRoute: _initialRoute,));
    });
}



class StarWarsApp extends StatelessWidget {
    final String initialRoute;
    StarWarsApp({Key key, @required this.initialRoute}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
        ));
        return  ProviderBloc(child:  MaterialApp(
            title: 'Star Wars',
            theme: _themeData(),
            initialRoute: initialRoute,
            color: Colors.blue,
            debugShowCheckedModeBanner: false,
            routes: ApplicationRoutes.getApplicationRoutes(),
            localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
                const Locale('en', 'US'),
                const Locale('es', 'ES'),
            ],
        ),);
    }
    ThemeData _themeData() {
        return ThemeData(
                primaryColor: Colors.blue,
                backgroundColor: Colors.blue,
                fontFamily: "ComicSans"
        );
    }
}
