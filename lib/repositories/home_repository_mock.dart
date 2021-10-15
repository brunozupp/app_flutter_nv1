import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:repos_pattern_flutter/models/post_model.dart';
import 'package:repos_pattern_flutter/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  
  @override
  Future<List<PostModel>> getList() async {
    
    var value = await rootBundle.loadString("assets/data.json");

    List postsJson = jsonDecode(value);

    return postsJson.map((e) => PostModel.fromMap(e)).toList();
  }

}