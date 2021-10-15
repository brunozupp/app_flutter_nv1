import 'package:flutter/cupertino.dart';
import 'package:repos_pattern_flutter/models/post_model.dart';
import 'package:repos_pattern_flutter/repositories/home_repository.dart';

class HomeController {

  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  final posts = ValueNotifier<List<PostModel>>([]);

  Future<void> fetch() async {
    posts.value = await _homeRepository.getList();
  }
}