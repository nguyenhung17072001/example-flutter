import 'package:flutter/material.dart';
import '../components/my_text_field.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  /// Holds the _category, model of the current selected control
 
  @override
  State<StatefulWidget> createState() => LayoutPageState();
}

class LayoutPageState extends State<LoginScreen> {

  
  @override
  Widget build(BuildContext context) {





    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromRGBO(45, 182, 163, 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            
            children: [
              Flexible(
                
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  width: 300,
                  child: Image.asset('lib/src/assets/images/login.png', fit: BoxFit.contain,),
                )
              ),
              const Flexible(
                
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('Welcome', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                child: const AuthTextField(
                  
                  icon: Icon(Icons.verified_user, color: Color.fromRGBO(45, 182, 163, 100)),
                  labelText: 'Username',
                ),
              ),
              Container(
                child: const AuthTextField(
                  icon: Icon(Icons.lock, color: Color.fromRGBO(45, 182, 163, 100)),
                  labelText: 'Password',
                ),
              ),
              Flexible(
                child: Padding(
                  padding:  const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {}, 
                        child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 14),)
                      ),
                      TextButton(
                        onPressed: () {}, 
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.black, fontSize: 14),)
                      )
                    ],
                  ),
                )
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(223, 180, 151, 100),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(60, 15, 60, 15)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/my-tab');
                    }, 
                      child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 14),)
                  ),
                )
              )
              
            ]
          ),
        )
      )
    );
  }

}

