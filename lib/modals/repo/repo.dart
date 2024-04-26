import 'package:job_search_app/modals/data/data_model.dart';
import 'package:job_search_app/services/response.dart';

class Repo {
  Repo._();

  static Future<List<DataModel>> callResponse() async {
    final List<dynamic> responseJsonList = await ResponseService.getResponse();

    final List<DataModel> responseList = [];

    for (var response in responseJsonList) {
      responseList.add(DataModel.fromJson(response));
    }

    return responseList;
  }
}
