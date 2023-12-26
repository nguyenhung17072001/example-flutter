import 'package:flutter/material.dart';

import '../../theme/index.dart';
import '../../widgets/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _constructionUsernameValue = TextEditingController();
  final TextEditingController _constructionUPasswordValue = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width *0.5,
              width: MediaQuery.of(context).size.width *0.5,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              )
            ),
            Column(
              children: [
                TextInput(
                  controller: _constructionUsernameValue,
                  labelText: 'Tên đăng nhập',
                  icon: Icons.account_circle,
                ),
                TextInput(
                  controller: _constructionUPasswordValue,
                  labelText: 'Mật khẩu',
                  icon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ],
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.all(30.0),
                //height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:  AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.fromLTRB(60, 15, 60, 15)
                  ),
                  onPressed: () {
                    
                  }, 
                  child: const Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 14),)
                ),
              )
            )
          ],
        ),
      )
    );
  }
}