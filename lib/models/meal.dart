class Meal {
  final int _id;
  final int _price;
  final int _weight;
  final String _name;
  final String _desc;
  final String _image_url;
  final List<dynamic> _tegs;
 
  int get id => _id;
  int get price => _price;
  int get weight => _weight;
  String get name => _name;
  String get desc => _desc;
  String get image_url => _image_url;
  List<dynamic> get tegs => _tegs;

  Meal.fromJson(Map<String, dynamic> json) :
    _id = json["id"],
    _name = json["name"],
    _price = json["price"],
    _weight = json["weight"],
    _desc = json["description"],
    _image_url = json["image_url"],
    _tegs = json["tegs"];
}

// MealList is wrapper for array of meals
class MealList {
  final List<Meal> meals = [];
  MealList.fromJson(List<dynamic> jsonItems) {
    print(jsonItems.length);

    for (var jsonItem in jsonItems) {
      // print(jsonItem['weight']);
      meals.add(Meal.fromJson(jsonItem));
    }
    print(meals[0]._tegs
    );
  }
}

abstract class MealResult {}

class MealResultSuccess extends MealResult {
  final MealList mealList;
  MealResultSuccess(this.mealList);
}

class MealResultFailure extends MealResult {
  final String error;
  MealResultFailure(this.error);
}

class MealResultLoading extends MealResult {
  MealResultLoading();
}