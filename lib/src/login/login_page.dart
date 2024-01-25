/***  import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Delivery App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Este es el texto numero 1'),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Descripcion',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
***/


/*** import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Delivery App'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        Text('Hola como estas'),
          // permite separar a nivel de ancho SizedBox(width: 40),
          Text('Bien'),
        ],
      ),
    );
  }
} ***/


/*** import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Delivery App'),

      ),
      body: Stack(
        children: [  // Inicia la lista de widgets aquí
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.lime
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
              child:Text('LOGIN'),
          )

        ],  // Termina la lista de widgets aquí
      ),
    );
  }
} ***/
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:udemy_flutter_delivery/src/login/login_controller.dart';
import 'package:udemy_flutter_delivery/src/util/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Delivery App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circuleLogin(),
            ),
            Positioned(
              child: _textLogin(),
              top: 60,
              left: 25,
            ),
            SingleChildScrollView( // se envuelve con un SingleChildScrollView para poder scrollear al desplegar keyb
              child: Column(
                children: [
                  _lottieAnimation(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, left: 30, bottom: MediaQuery.of(context).size.height * 0.10),
      child: Lottie.asset(
          'assets/json/delivery.json', width: 350, height: 200, fit: BoxFit.fill),
    );
  }

  Widget _textLogin() {
    return Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'Angeline Vintage_Demo'),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: MyColors.primaryColor),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.login, // se llama al metodo de login
        child: Text('INGRESAR'),
        style: ElevatedButton.styleFrom(
          primary: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true, // propiedad para ocultar caracter y salga pepitas o password
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.emailController, // se llama el controlador del email
        keyboardType: TextInputType.emailAddress,  // permite que se despliegue el @ para consignar email
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _circuleLogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }
}
