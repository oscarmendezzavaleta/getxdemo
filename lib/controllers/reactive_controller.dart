import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;

  RxString currentDate = ''.obs;

  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void increment() {
    counter.value++;
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    mapItems.add(DateTime.now().toString(), DateTime.now().toString());
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
