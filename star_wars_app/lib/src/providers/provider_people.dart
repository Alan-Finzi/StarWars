import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_app/src/models/people_model.dart';




class PeopleProvider {

    Future<ListModelPeople> getPeople () async {
        final url = 'https://swapi.dev/api/people/';
        ListModelPeople _result = ListModelPeople();
        try {
            final response = await http.get(url);
            if (response.statusCode == 200) {
                String body = utf8.decode(response.bodyBytes);
                Map<String, dynamic> decodedData = json.decode(body);
                _result = ListModelPeople.fromJson(decodedData);
                return _result;
            } else { return _result; }
        } catch (exeption) { return _result; }
    }


    Future<Map<String, dynamic>> insetPeopleFirebase(Result result) async {
        try {
            String genderData = result.gender.toString();
            if(genderData!=null){
                await Firestore.instance.collection('people').document().setData
                    ({'gender':mapGender[genderData], 'hair_color':result.hairColor,
                    'height': result.height,'mass': result.mass,'name': result.name});
            }
            return { 'ok': true};
        }catch(e){
            return { 'ok': false, "message": e.message};
        }
    }

    Map<String, String> mapGender = {
        'Gender.FEMALE' : "female",
        'Gender.MALE'   : "male",
        'Gender.N_A'    : "n/a"
    };
}