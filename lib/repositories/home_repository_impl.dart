import 'package:dio/dio.dart';
import 'package:repos_pattern_flutter/models/post_model.dart';
import 'package:repos_pattern_flutter/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  
  @override
  Future<List<PostModel>> getList() async {
    
    try {
      var response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
      return (response.data as List).map((e) => PostModel.fromMap(e)).toList();
    } catch(e) {
      print(e);
    }

    return [];
  }

}