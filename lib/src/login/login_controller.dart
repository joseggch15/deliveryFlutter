import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  // Método constructor o inicializador de la clase
  void init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login(){
    String email = emailController.text.trim(); // captura el texto que el usuario digita dentro del campo
    String password = passwordController.text.trim(); // el metodo trim elimina espacios en blanco

    print('EMAIL: $email');
    print('Password: $password');
  }





}
