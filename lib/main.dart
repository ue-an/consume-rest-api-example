// import 'package:consume_rest_api_app/screens/home.dart';
import 'package:consume_rest_api_app/controllers/profile_controller.dart';
import 'package:consume_rest_api_app/screens/home2.dart';
import 'package:consume_rest_api_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        // home: const Home(),
        home: const Home2(),
        routes: Routes.routes,
      ),
    );
  }
}
