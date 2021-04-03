import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportProvider {

Future<bool> createReport({@required int userId, @required String characterName}) async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    Map<String, dynamic> reportJson = {
        'userId': userId ,
        'dateTime': DateTime.now().toString(),
        'character_name' :characterName,
    };

    var data = json.encode(reportJson);
    try {
        final response = await http.post(url, body: data);
        if (response.statusCode == 201 || response.statusCode == 200) { return true; } else { return false; }
    } catch (exeption) { return false; }
}
}