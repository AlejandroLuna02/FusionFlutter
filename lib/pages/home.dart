import 'package:flutter/material.dart';
import 'contact.dart'; // Asegúrate de importar correctamente
import 'api.dart'; // Asegúrate de importar correctamente

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
              },
              child: Text("Ir a Contact"),
            ),
            SizedBox(height: 20), // Espacio entre botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Api()),
                );
              },
              child: Text("Ir a Game"),
            ),
          ],
        ),
      ),
    );
  }
}
