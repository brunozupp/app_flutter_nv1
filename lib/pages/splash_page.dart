import 'package:flutter/material.dart';
import 'package:repos_pattern_flutter/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    // Passando uma lista de Futures
    Future.wait([checkIfIsAuth(), Future.delayed(const Duration(seconds: 2))])
      // Aqui só vai executar o then depois que acabar todos os itens da lista. O índice indica o resultado de cada item, em ordem como foi colocado na lista
      .then((values) => Navigator.of(context).pushReplacementNamed(values[0] 
        ? "/home" : "/login"));
  }

  Future<bool> checkIfIsAuth() async {
    return await PrefsService.isAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}