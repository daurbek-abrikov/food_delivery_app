import '../data/repository.dart';
import '../models/meal.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MealController extends ControllerMVC {
  // creating instance of Repository
  final Repository repo = new Repository();

  // Constructor of controller
  MealController();
  
  // fisrt state - loading data
  MealResult currentState = MealResultLoading();

  void init() async {
    try {
      // getting data from repository
      final mealList = await repo.fetchMeals();
      // if ok update state to be successful
      setState(() => currentState = MealResultSuccess(mealList));
    } catch (error) {
      print(error);
      // else set to error
      setState(() => currentState = MealResultFailure("Нет интернета"));
    }
  }


}