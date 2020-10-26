import 'package:dio/dio.dart';
import 'package:getx_demo/models/user.dart';

class UserApi {
  UserApi._internal();

  static UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
        'https://reqres.in/api/users?page=2',
        queryParameters: {
          "page": page,
          "delay": 5,
        },
      );

      return (response.data['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
