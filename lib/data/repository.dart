import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/meal.dart';

const String SERVER = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b";

class Repository {
  // we return Future object, since 
  // fetchPhotos is asynchronous function 
  // async funcs don't block UI
  Future<MealList> fetchMeals() async {
    final url = Uri.parse("$SERVER/dishes");
    final response = await http.get(url);
    if (response.statusCode == 200) {

      dynamic data = json.decode(response.body);
      return MealList.fromJson(data['dishes']);
    } else {
      throw Exception("failed request");
    }

  }
}