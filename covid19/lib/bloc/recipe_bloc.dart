import 'package:bloc/bloc.dart';
import 'package:hack_covid19/api/recipe_api_provider.dart';
import 'package:hack_covid19/models/recipesData.dart';
import 'package:hack_covid19/models/topheadlinesnews/response_top_headlinews_news.dart';


abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final List<RecipesData> data;

  DataSuccess(this.data);
}

class DataFailed extends DataState {
  final String errorMessage;

  DataFailed(this.errorMessage);
}

class DataEvent {
  final String category;

  DataEvent(this.category);
}

class RecipeBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield DataLoading();
    final recipeApiProvider = RecipeAPIProvider();
    final categoryLowerCase = event.category.toLowerCase();
    
    switch (categoryLowerCase) {
      case 'starters':
        final data = await recipeApiProvider.loadStarterData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'main course':
        final data = await recipeApiProvider.loadMainCourseData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'desserts':
        final data = await recipeApiProvider.loadDessertData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'beverages':
        final data = await recipeApiProvider.loadBeveragesData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      
      default:
        yield DataFailed('Unknown category');
    }
  }
}
