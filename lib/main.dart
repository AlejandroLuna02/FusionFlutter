import 'package:flutter/material.dart';
import 'package:flutter_application_tarea/pages/home.dart';

void main() => runApp(FusionFlutter());

class FusionFlutter extends StatelessWidget {
  const FusionFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fusion Flutter",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context), // Pasar contexto aquí
    );
  }
}

// Actualizado para tomar el contexto como un parámetro
Widget cuerpo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/originals/c2/8f/90/c28f905121b0077482e4c0e0075a391e.jpg"),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          login(),
          userField(),
          passwordField(),
          SizedBox(
            height: 10.0,
          ),
          buttonLogin(context),
        ],
      ),
    ),
  );
}

Widget login() {
  return Text(
    "Fusion Flutter",
    style: TextStyle(
        color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget userField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget passwordField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

// Ajustado para tomar el contexto como un argumento
Widget buttonLogin(BuildContext context) {
  return MaterialButton(
    color: Colors.grey,
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => home()), // Asegúrate de que 'Home' es la página correcta
      );
    },
    child: Text(
      "Entrar",
      style: TextStyle(fontSize: 25, color: Colors.white),
    ),
  );
}
