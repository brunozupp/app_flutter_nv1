import 'package:repos_pattern_flutter/models/post_model.dart';

abstract class HomeRepository {

  Future<List<PostModel>> getList();
}