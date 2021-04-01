import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:star_wars_app/utils/validators.dart';


class Bloc with Validators{
    final _priceController    = BehaviorSubject<double>();
    final _amountController   = BehaviorSubject<double>();
    final _dateController     = BehaviorSubject<Map<String,dynamic>>();

    //get value to Stream
    Stream<Map<String,dynamic>> get dateStream     => _dateController.stream.transform( validatorsDate);
    Stream<double> get priceStream     => _priceController.stream.transform(validatorsPriceBTC);
    Stream<double> get amountStream    => _priceController.stream.transform(validatorsAmount);


    // Stream<bool> get  formValidStreamLogin => Rx.combineLatest2(dateStream, volumeStream, (e, p) => true);
    // Stream<bool> get  formValidStreamSigup => Rx.combineLatest3(dateStream, volumeStream, priceStream,(d,p,e) => true);

    //insert value to Stream
    Function(double) get changePriceBTC    => _priceController.sink.add;
    Function(double) get changeAmount => _amountController.sink.add;
    Function(Map<String,dynamic>) get changeDate     => _dateController.sink.add;

    dispose(){
        _priceController?.close();
        _amountController?.close();
        _dateController?.close();
    }
}
