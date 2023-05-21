
import 'dart:convert';

import 'package:barter_it/myconfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final TextEditingController _emailEditingController = TextEditingController();
final TextEditingController _passEditingController = TextEditingController();
final TextEditingController _pass2EditingController = TextEditingController();
bool  _isChecked = false;
final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
         backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(height: 250,color: Colors.transparent, 
           child : Image.asset('assets/images/register.jpg'),
              // to insert image
          ),
          Card(
            elevation: 8,
            child: Container(
               margin: const EdgeInsets.all(16),
                child: Column(children: [
                  const Text("Log In Form"),
                Form(
                  key : _formKey,
                  child: Column(children: [  
                  
                  TextFormField(
                    controller: _emailEditingController,
                    validator: (val) => val!.isEmpty || !val.contains("@") || !val.contains(".")  //! means should 
                    ? "enter a valid email"
                    : null,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                     labelText: 'Email',
                     labelStyle: TextStyle(
                     ),
                     icon: Icon(Icons.email),
                     focusedBorder: OutlineInputBorder(
                     borderSide:BorderSide( width: 2.0),
                    ))),
                  
                  TextFormField(
                    controller: _passEditingController,
                     validator: (val) => val!.isEmpty || (val.length < 5)
                     ? "password must be longer 5"
                     : null,
                    obscureText: true,  //to hide password
                    decoration: const InputDecoration(
                     labelText: 'Password',
                     labelStyle: TextStyle(
                     ),
                     icon: Icon(Icons.lock),
                     focusedBorder: OutlineInputBorder(
                     borderSide:BorderSide( width: 2.0),
                    ))),
               Row(children: [
                Checkbox(
                 value: _isChecked,
                 onChanged: (bool? value) {
                   if (!_isChecked) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "TSucess.")));
                              }

                 setState(() {
                 _isChecked = value!;
                });
                },
                ),
                GestureDetector(
                  onTap: null, 
                  child: const Text('Remember Me', 
                  style: TextStyle( 
                    fontSize: 16,
                  fontWeight: FontWeight.bold,
                    )),
                 ),
                  const SizedBox(width : 16, ),
                  Expanded(
                    child: ElevatedButton(
                    onPressed: onLogInDialog, 
                    child: const Text("Log In")))],
                        
                      )
                ]),           
          )
          ]),
          ),
          ),
        
   
        ]),
      ),  
    
    );
  }
  void onLogInDialog() {
  if (!_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Check you input")));
    return;
   }

  if (!_isChecked) {
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please agree with the terms and condition")));
      return;
  }

  String password = _passEditingController.text;
  String pass2 = _pass2EditingController.text;
  if ( password != pass2 ) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please check your password")));
      return;
  }


   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Register new account?",

            style: TextStyle(),
          ),
          content: const Text("Are you sure?",
              style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                registerUser();
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(
                   
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  void registerUser() {
    /* showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Please Wait"),
          content: Text("Registration..."),
        );
      },
    ); */

   //String name  = _nameEditingController.text;
   String email = _emailEditingController.text;
   //String phone = _phoneEditingController.text;
   String password  = _passEditingController.text;

   //print("Name: " +name+ "\nEmail: " +email+ "\nPhone: " +phone+ "\nPassword: " +password);

   http.post(Uri.parse("${MyConfig().SERVER}/barter_it/php/register_user.php"), 
   //http://10.144.131.233/barter_it/php/register_user.php"),
    //MyConfig().SERVER}/barter_it/php/register_user.php"),
    //"${MyConfig().SERVER}/barterit/php/register_user.php"), 
        body: {
         // "name": name, 
          "email": email, 
          //"phone": phone, 
          "password": password,
          }).then((response) {
     //print(response.body);

  
    
    
  });
}


}
 
