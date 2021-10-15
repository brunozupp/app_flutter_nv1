import 'package:flutter/material.dart';
import 'package:repos_pattern_flutter/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {

  final LoginController loginController;

  const CustomLoginButtonComponent({ 
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_,inLoader,__) {

        if(inLoader) {
          return const CircularProgressIndicator();
        } 

        return ElevatedButton(
          onPressed: () async {
            final result = await loginController.auth();
          
            if(result) {
              Navigator.of(context).pushReplacementNamed("/home");
            } else {

              var snackBar = const SnackBar(
                content: Text(
                  'Falha no login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            }
          }, 
          child: const Text("Login")
        );
      }
    );
  }
}