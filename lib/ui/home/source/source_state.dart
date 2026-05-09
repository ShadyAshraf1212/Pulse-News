import '../../../api/model/source_response.dart';

abstract class SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String message;
  SourceErrorState({required this.message});
}

class SourceSuccessState extends SourceState {
  List<Source> sources;
  SourceSuccessState({required this.sources});
}

class ChangeSelectedIndex extends SourceState {
  int newIndex;
  ChangeSelectedIndex({required this.newIndex});
}
