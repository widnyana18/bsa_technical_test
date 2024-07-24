import 'package:flutter/material.dart';
import 'package:form_input/controllers/arithmetic_provider.dart';
import 'package:form_input/controllers/login_provider.dart';
import 'package:form_input/controllers/user_provider.dart';
import 'package:form_input/model/user.dart';
import 'package:form_input/services/local_storage_service.dart';
import 'package:form_input/ui/routes/app_router.dart';
import 'package:form_input/ui/views/login_view.dart';
import 'package:form_input/ui/views/number_operation_view.dart';
import 'package:form_input/ui/views/profile_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bima Sakti Altera Technical Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo[800]!),
        useMaterial3: true,
      ),
      // onGenerateRoute: generateRoute,
      home: FutureBuilder<String?>(
        future: LocalStorageService.readUser(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            print('CHECK LOGIN : ${snapshot.data}');
            return ChangeNotifierProvider(
              create: (context) => ArithmeticProvider(),
              child: NumberOperationView(),
            );
          }
          return ChangeNotifierProvider.value(
            value: LoginProvider(),
            child: LoginView(),
          );
        },
      ),
    );
  }
}
