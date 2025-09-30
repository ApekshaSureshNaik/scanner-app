import 'package:flutter/cupertino.dart';
import 'package:scanner_app/models/event_list_model.dart';

import '../api/api_service.dart';

class EventsProvider extends ChangeNotifier{
  EventListModel? eventListModel;
  EventsProvider();

  //eventslists
  Future<EventListModel?> eventsList() async {
    final response = await ApiService().eventLists();
    eventListModel = response;
    notifyListeners();
    return eventListModel;
  }

  //eventImages
 Future<String> eventImage(int imageId) async {
    final response = await ApiService().fetchEventImage(imageId);
    notifyListeners();
    return response;

 }
}