import 'package:bloc/bloc.dart';
import 'package:hack_covid19/api/api_repository.dart';
import 'package:hack_covid19/api/general_Api_provider.dart';
import 'package:hack_covid19/api/recipe_api_provider.dart';
import 'package:hack_covid19/models/elearningData.dart';
import 'package:hack_covid19/models/topheadlinesnews/response_top_headlinews_news.dart';


abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final List<ElearningData> data;

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
    final learningApiProvider = RecipeAPIProvider();
    final categoryLowerCase = event.category.toLowerCase();
    
    switch (categoryLowerCase) {
      case 'starter':
        final data = await learningApiProvider.loadELearningProgrammingData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'maincourse':
        final data = await learningApiProvider.loadELearningDanceData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'deserts':
        final data = await learningApiProvider.loadELearningGardenData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'beverages':
        final data = await learningApiProvider.loadELearningMusicData();
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
