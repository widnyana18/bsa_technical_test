import 'package:flutter/material.dart';
import 'package:form_input/controllers/user_provider.dart';
import 'package:form_input/model/user.dart';
import 'package:form_input/ui/views/profile_details_view.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final users = context.watch<List<User>>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile',
          style: txtTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: users.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].phone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileDetailsView(user: users[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
