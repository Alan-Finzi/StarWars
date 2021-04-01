import 'dart:async';


class Validators{



    final validatorsDate = StreamTransformer<Map<String,dynamic>, Map<String,dynamic>>.fromHandlers(
            handleData: (date,sink){
                if(date  != null ){
                    sink.add(date);
                }else{
                    sink.addError(null);
                }
            }
    );

    final validatorsPriceBTC = StreamTransformer<double, double>.fromHandlers(
            handleData: (price,sink){
                if(price  != null ){
                    sink.add(price*2);
                }else{
                    sink.addError(null);
                }
            }
    );

    final validatorsAmount = StreamTransformer<double, double>.fromHandlers(
            handleData: (price,sink){
                if(price != null ){
                    sink.add(price*3);
                }else{
                    sink.addError(null);
                }
            }
    );

}
