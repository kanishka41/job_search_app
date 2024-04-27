import 'package:NextHire/modals/data/data_model.dart';
import 'package:NextHire/modals/repo/repo.dart';
import 'package:get/get.dart';



class DataController extends GetxController {
  final Rx<List<DataModel>> _jobsData =
      Rx<List<DataModel>>([DataModel.empty()]);

  final Rx<List<DataModel>> savedJobs = Rx<List<DataModel>>([]);

  // Fetch data
  Future<List<DataModel>> fetchData() async {
    // ignore: join_return_with_assignment
    _jobsData.value = await Repo.callResponse();
    return _jobsData.value;
  }

  List<DataModel> get jobsData {
    return _jobsData.value;
  }

  void updateSavedJobs(DataModel dataModel) {
    for (int i = 0; i < savedJobs.value.length; i++) {
      final DataModel val = savedJobs.value[i];
      if (val.id == dataModel.id) {
        savedJobs.value.removeAt(i);
        return;
      }
    }
    savedJobs.value.add(dataModel);
    update();
  }

  bool isDataExist(DataModel dataModel) {
    for (int i = 0; i < savedJobs.value.length; i++) {
      final DataModel val = savedJobs.value[i];
      if (val.id == dataModel.id) {
        // savedJobs.value.removeAt(i);
        return true;
      }
    }
    return false;
  }

  List<DataModel> savedJobsList() {
    return savedJobs.value;
  }
}
