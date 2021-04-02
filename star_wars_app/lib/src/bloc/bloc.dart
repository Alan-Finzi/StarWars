import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_app/utils/validators.dart';


class Bloc with Validators{
    final _modeController    = BehaviorSubject<bool>();

    //get value to Stream
    Stream<bool> get modeStream     => _modeController.stream.transform(validatorsMode);

    //insert value to Stream
    Function(bool) get changeMode    => _modeController.sink.add;

    dispose(){
        _modeController?.close();
    }
}
