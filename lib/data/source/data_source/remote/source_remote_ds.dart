import '../../../../api/model/source_response.dart';

abstract class SourceRemoteDS {
  Future<SourceResponse?> getSource(String categoryId);
}
