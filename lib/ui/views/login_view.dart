import 'package:flutter/material.dart';
import 'package:form_input/controllers/arithmetic_provider.dart';
import 'package:form_input/controllers/login_provider.dart';
import 'package:form_input/services/local_storage_service.dart';
import 'package:form_input/ui/views/number_operation_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _pswController = TextEditingController();

  // @override
  // void initState() async {
  //   super.initState();
  //   final username = await LocalStorageService.readUser();
  //   _usernameController = TextEditingController(text: username);
  // }

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
              const SizedBox(height: 30),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  label: Text('Username'),
                  hintText: 'test@example.com',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pswController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  hintText: 'Gunakan huruf, numeric, capital, dan symbol',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: notifier.isInputNotEmpty
                    ? () {
                        _submit(context, notifier);
                      }
                    : null,
                child: const Text('Submit'),
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
      LocalStorageService.storeUserData(
        username: notifier.username!,
        password: notifier.password!,
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ArithmeticProvider(),
              child: const NumberOperationView(),
            ),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password Tidak Valid'),
        ),
      );
    }
  }
}
