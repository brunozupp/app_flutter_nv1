import 'package:flutter/material.dart';
import 'package:repos_pattern_flutter/controllers/home_controller.dart';
import 'package:repos_pattern_flutter/models/post_model.dart';
import 'package:repos_pattern_flutter/repositories/home_repository_impl.dart';
import 'package:repos_pattern_flutter/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = HomeController(HomeRepositoryImpl());

  @override
  void initState() {
    super.initState();

    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await PrefsService.logout();

              Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => true);
            }, 
            icon: const Icon(
              Icons.exit_to_app
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_,posts,__) {
          return ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_,__) => const Divider(),
            itemBuilder: (_,index) {
              return ListTile(
                title: Text(posts[index].title),
                trailing: const Icon(
                  Icons.arrow_forward
                ),
                leading: Text(posts[index].id.toString()),
                onTap: () => Navigator.of(context).pushNamed(
                  "/details",
                  arguments: posts[index],
                ),
              );
            }
          );
        },
      ),
    );
  }
}