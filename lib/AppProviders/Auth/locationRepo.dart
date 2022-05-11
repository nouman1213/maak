import 'package:flutter/cupertino.dart';
import 'package:maak_prject/AppModels/getAreaList.dart';

import '../../AppServices/services.dart';

class LocationRepo extends ChangeNotifier {
  Services services = Services();

  Future fetchAreaList() async {
    try {
      var response = await services.getResponse(url: "getareas", formData: []);
      if (response != null) {
        debugPrint(":::: $response");
        var user = GetAreaList.fromJson(response);
        return user;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
