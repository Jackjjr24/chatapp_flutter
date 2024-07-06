import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _pwContoller = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});



  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(_emailContoller.text, _pwContoller.text);
    }

    catch (e){
      showDialog(
          context: context, 
          builder: (context) => AlertDialog(
             title: Text(e.toString()),
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),

            Text(
              "Welcome to the Chat App",
               style: TextStyle(
                 color: Theme.of(context).colorScheme.primary,
                 fontSize: 16,
               ),
            ),

            const SizedBox(height: 25),

            MyTextfield(
              hintText: "Email",
              obscureText: false, controller: _emailContoller,
            ),

            const SizedBox(height: 10),

            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwContoller,
            ),
            const SizedBox(height: 25),


            MyButton(
              text: "login",
              onTap: ()=>login(context),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                   "Not a member?",
                   style:
                       TextStyle(color:  Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )

        
          
        ],
      ),
      ),
    );
  }
}