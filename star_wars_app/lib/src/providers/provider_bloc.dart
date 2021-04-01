import 'package:flutter/material.dart';
import 'package:star_wars_app/src/bloc/bloc.dart';
export 'package:star_wars_app/src/bloc/bloc.dart';



class ProviderBloc extends InheritedWidget{
    final loginBloc = Bloc();

    ProviderBloc({Key key, Widget child}) : super (key : key,child:child);

    @override
    bool updateShouldNotify(InheritedWidget oldWidget)=>true;

    static Bloc of ( BuildContext context ){
        return context.dependOnInheritedWidgetOfExactType<ProviderBloc>().loginBloc;
    }

}
