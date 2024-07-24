import 'package:flutter/material.dart';
import 'package:form_input/model/user.dart';

class ProfileDetailsView extends StatelessWidget {
  final User user;
  const ProfileDetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: BackButton(),
        title: Text(
          'Profile Details',
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
                user.name,
                textAlign: TextAlign.center,
                style:
                    txtTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Username :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.username),
                        SizedBox(height: 30),
                        Text(
                          'Email :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.email),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Phone :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.phone),
                        SizedBox(height: 30),
                        Text(
                          'Website :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.website),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Address',
                textAlign: TextAlign.center,
                style:
                    txtTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Street :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.address.street),
                        SizedBox(height: 30),
                        Text(
                          'Suite :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.address.suite),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'City :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.address.city),
                        SizedBox(height: 30),
                        Text(
                          'Zip Code :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.address.zipCode),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Coordinate',
                textAlign: TextAlign.center,
                style:
                    txtTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: Text('Latitude : ${user.address.geo.lat}')),
                  SizedBox(width: 20),
                  Flexible(child: Text('Longitude : ${user.address.geo.lng}')),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Company',
                textAlign: TextAlign.center,
                style:
                    txtTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Name :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.company.name),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Catch Phrase :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.company.catchPhrase),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Bs :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(user.company.bs),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
