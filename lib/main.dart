import 'package:flutter/material.dart';
import 'package:form_input/controllers/login_provider.dart';
import 'package:form_input/controllers/user_provider.dart';
import 'package:form_input/model/user.dart';
import 'package:form_input/ui/routes/app_router.dart';
import 'package:form_input/ui/views/login_view.dart';
import 'package:form_input/ui/views/profile_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = UserProvider();

    return MaterialApp(
      title: 'Bima Sakti Altera Technical Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo[800]!),
        useMaterial3: true,
      ),
      // onGenerateRoute: generateRoute,
      home: FutureProvider<List<User>>(
        create: (context) => userProvider.getData(),
        initialData: const [],
        child: ProfileView(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => LoginProvider(),
      //   child: LoginView(),
      // ),
    );
  }
}
