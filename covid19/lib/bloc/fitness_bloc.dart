import 'package:bloc/bloc.dart';

import 'package:hack_covid19/api/fitness_api_provider.dart';
import 'package:hack_covid19/models/fitnessData.dart';



abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final List<FitnessData> data;

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

class FitnessBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield DataLoading();
    final fitnessApiProvider = FitnessApiProvider();
    final categoryLowerCase = event.category.toLowerCase();
    
    switch (categoryLowerCase) {
      case 'yoga':
        final data = await fitnessApiProvider.loadYogaFitnessData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'zumba':
        final data = await fitnessApiProvider.loadZumbaFitnessData();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'general fitness':
        final data = await fitnessApiProvider.loadGeneralFitnessData();
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
