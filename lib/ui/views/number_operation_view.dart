import 'package:flutter/material.dart';
import 'package:form_input/controllers/arithmetic_provider.dart';
import 'package:form_input/controllers/login_provider.dart';
import 'package:form_input/controllers/user_provider.dart';
import 'package:form_input/model/user.dart';
import 'package:form_input/services/local_storage_service.dart';
import 'package:form_input/ui/views/login_view.dart';
import 'package:form_input/ui/views/profile_view.dart';
import 'package:provider/provider.dart';

class NumberOperationView extends StatefulWidget {
  @override
  State<NumberOperationView> createState() => _NumberOperationViewState();
}

class _NumberOperationViewState extends State<NumberOperationView> {
  final _firstNumController = TextEditingController();
  final _secondNumController = TextEditingController();

  @override
  void dispose() {
    _firstNumController.dispose();
    _secondNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final notifier = context.watch<ArithmeticProvider>();
    final UserProvider userProvider = UserProvider();

    _firstNumController.addListener(
      () => context
          .read<ArithmeticProvider>()
          .firstNumChanged(_firstNumController.text),
    );

    _secondNumController.addListener(
      () => context
          .read<ArithmeticProvider>()
          .secondNumChanged(_secondNumController.text),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Aritmatika Sederhana',
          style: txtTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Silahkan pilih mode operasi :'),
              SizedBox(height: 12),
              Row(
                children: [
                  Flexible(
                    child: CheckboxListTile(
                        title: Text('Penjumlahan'),
                        value: notifier.sumMode,
                        onChanged:
                            context.read<ArithmeticProvider>().sumModeChanged),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: CheckboxListTile(
                        title: Text('Perkalian'),
                        value: notifier.multipleMode,
                        onChanged: context
                            .read<ArithmeticProvider>()
                            .multipleModeChanged),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Silahkan masukan bilangan :'),
              SizedBox(height: 12),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _firstNumController,
                      decoration: InputDecoration(labelText: 'Angka Pertama'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: TextField(
                      controller: _secondNumController,
                      decoration: InputDecoration(labelText: 'Angka Kedua'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Hasil : ${notifier.result.toString()}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              FilledButton(
                  onPressed: notifier.isInputValid ? _operation : null,
                  child: Text('Hitung')),
              SizedBox(height: 12),
              FilledButton(
                  onPressed: () {
                    LocalStorageService.removeUserData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: LoginProvider(),
                          child: LoginView(),
                        ),
                      ),
                    );
                  },
                  child: Text('Logout')),
              SizedBox(height: 12),
              FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureProvider<List<User>>(
                          create: (context) => userProvider.getData(),
                          initialData: const [],
                          child: ProfileView(),
                        ),
                      ),
                    );
                  },
                  child: Text('Load Data')),
            ],
          ),
        ),
      ),
    );
  }

  void _operation() {
    context.read<ArithmeticProvider>().runOperation();
  }
}
