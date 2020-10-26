import 'package:get/get.dart';
import 'package:getx_demo/api/users_api.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;

  bool _loading = true;

  List<User> _users = [];

  int get couter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print('onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('onReadey');
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UserApi.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  Future<void> shoUserProfile(User user) async {
    final result = await Get.to<String>(ProfilePage(), arguments: user);
    if (result != null) {
      print('  result $result');
    }
  }

  void increment() {
    this._counter++;
    update(['text']);
  }
}
