import 'package:flutter/material.dart';

class RegisterController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();



  void init(BuildContext context){ // metodo constructor o inicializador de la clase
    this.context = context;
  }



  void register(){
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print(email);
    print(name);
    print(lastname);
    print(phone);
    print(password);
    print(confirmPassword);




  }


}