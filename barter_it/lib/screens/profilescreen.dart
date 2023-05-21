import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'registrationscreen.dart';

class ProfileScreenn extends StatefulWidget {
  const ProfileScreenn({super.key});

  @override
  State<ProfileScreenn> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenn> {
  String maintitle = "Profile";
  int _currIndex = 2;

  @override
  void initState(){
    super.initState();
    print("Profile");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Flexible(
          flex: 4,
          child: Card(
            elevation: 10,
            child: Row(
              children: [
         
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    shrinkWrap: true,
                    children:  [
                      MaterialButton(
                    onPressed: (){
                      Navigator.push(context, 
      MaterialPageRoute(builder: (content) => const RegistrationScreen()));
                    },
                    child: const Text("REGISTER",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                   const Divider(
                    height: 2,
                  ),

                   MaterialButton(
                    onPressed: (){
                      Navigator.push(context, 
      MaterialPageRoute(builder: (content) => const LoginScreen()));
                    },
                    child: const Text("LOG IN",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                   const Divider(
                    height: 2,
                  ),
                    ],
                  )
                  ),
              ], 
            ),
          ),
        )
      ]),
      //child: Text(maintitle),
    );
  }

}