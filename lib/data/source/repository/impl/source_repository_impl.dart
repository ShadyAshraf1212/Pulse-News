import 'package:pulse_news/data/source/data_source/remote/source_remote_ds.dart';

import '../../../../api/model/source_response.dart';
import '../source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDS sourceRemoteDS;
  SourceRepositoryImpl({required this.sourceRemoteDS});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return sourceRemoteDS.getSource(categoryId);
  }
}
