import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_news/data/source/repository/source_repository.dart';
import 'package:pulse_news/ui/home/source/source_state.dart';

class SourceViewModel extends Cubit<SourceState> {
  SourceRepository sourceRepository;
  static int selectedIndex = 0;

  SourceViewModel({required this.sourceRepository})
    : super(SourceLoadingState());

  void getSources(String category) async {
    emit(SourceLoadingState());
    try {
      var response = await sourceRepository.getSources(category);
      if (response!.status == 'ok') {
        emit(SourceSuccessState(sources: response.sources!));
      } else {
        emit(SourceErrorState(message: response.message ?? "Unknown error"));
      }
    } catch (e) {
      emit(SourceErrorState(message: e.toString()));
    }
  }

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex(newIndex: index));
  }
}
