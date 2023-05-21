import 'package:barter_it/screens/loginscreen.dart';
import 'package:barter_it/screens/registrationscreen.dart';
import 'package:flutter/material.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
 String maintitle = "Profile";
  
@override
void initState() {
  super.initState();
  print("Profile");
}

@override
void dispose() {
  super.dispose();
  print("dispose");
}

 @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        ElevatedButton(onPressed:() {
            Navigator.push(context,
           MaterialPageRoute(builder: (content) => const LoginScreen()));
        },
         child: const Text("Login"),),

          ElevatedButton(onPressed:() {
          Navigator.push(context,
           MaterialPageRoute(builder: (content) => const RegistrationScreen()));
          },
         child: const Text("Registration"),)
      ]),
    );
  }
}