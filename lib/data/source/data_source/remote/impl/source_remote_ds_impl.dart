import 'package:pulse_news/api/dio_manager.dart';

import '../../../../../api/model/source_response.dart';
import '../source_remote_ds.dart';

class SourceRemoteDSImpl implements SourceRemoteDS {
  DioManager dioManager;
  SourceRemoteDSImpl({required this.dioManager});
  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    var response = await dioManager.getSources(categoryId);
    return response;
  }
}
