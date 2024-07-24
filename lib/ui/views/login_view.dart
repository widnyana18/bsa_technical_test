import 'package:flutter/material.dart';
import 'package:form_input/controllers/arithmetic_provider.dart';
import 'package:form_input/controllers/login_provider.dart';
import 'package:form_input/ui/views/number_operation_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _pswController = TextEditingController();
  String? usernameHistory;

  @override
  void initState() {
    _usernameController.text = usernameHistory ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final notifier = context.watch<LoginProvider>();

    _usernameController.addListener(
      () => context
          .read<LoginProvider>()
          .userNameChanged(_usernameController.text),
    );

    _pswController.addListener(
      () => context.read<LoginProvider>().passwordChanged(_pswController.text),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Login',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mohon masukkan email dan password dengan benar',
                textAlign: TextAlign.center,
                style:
                    txtTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  label: Text('Username'),
                  hintText: 'test@example.com',
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _pswController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  hintText: 'Gunakan huruf, numeric, capital, dan symbol',
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              FilledButton(
                onPressed: notifier.isInputNotEmpty
                    ? () {
                        _submit(context, notifier);
                      }
                    : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context, LoginProvider notifier) {
    context.read<LoginProvider>().validateUsernamePassword(
          usernameInput: _usernameController.text,
          passwordInput: _pswController.text,
        );

    if (notifier.isValid) {
      usernameHistory = notifier.username!;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ArithmeticProvider(),
              child: NumberOperationView(),
            ),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau Password Tidak Valid'),
        ),
      );
    }
  }
}
