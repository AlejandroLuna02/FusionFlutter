import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa url_launcher para realizar llamadas y enviar mensajes

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  // Función para enviar un mensaje de texto
  void _sendMessage(String number) async {
    final Uri smsUri = Uri(
      scheme: 'sms', // Define el esquema para SMS
      path: number, // Número de teléfono al que se enviará el mensaje
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri); // Envía el mensaje
    } else {
      throw 'No se pudo enviar el mensaje a $number'; // Maneja el error si no se puede enviar el mensaje
    }
  }

  // Función para hacer una llamada telefónica
  void _makeCall(String number) async {
    final Uri telUri = Uri(
      scheme: 'tel', // Define el esquema para llamadas telefónicas
      path: number, // Número de teléfono al que se llamará
    );
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri); // Realiza la llamada
    } else {
      throw 'No se pudo realizar la llamada a $number'; // Maneja el error si no se puede realizar la llamada
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'), // Título del AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0), // Margen alrededor de la lista
        children: [
          // Crea elementos de lista para cada contacto
          _buildContactItem(
            context,
            'Jesus Alejandro Guillen Luna',
            '221198',
            '9651052289',
          ),
          _buildContactItem(
            context,
            'Carlos Eduardo Gumeta Navarro',
            '221199',
            '9711315960',
          ),
          _buildContactItem(
            context,
            'Joel de Jesús López Ruíz',
            '221204',
            '9661130883',
          ),
        ],
      ),
    );
  }

  // Construye un elemento de contacto individual
  Widget _buildContactItem(
      BuildContext context, String name, String id, String phone) {
    return Card(
      child: ListTile(
        title: Text(name), // Muestra el nombre del contacto
        subtitle: Text('ID: $id'), // Muestra el ID del contacto
        trailing: Row(
          mainAxisSize: MainAxisSize
              .min, // Ajusta el tamaño de la fila al mínimo necesario
          children: [
            // Botón para enviar mensaje
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () =>
                  _sendMessage(phone), // Envía mensaje al presionar
              tooltip: 'Enviar mensaje', // Tooltip para el botón
            ),
            // Botón para hacer llamada
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () => _makeCall(phone), // Hace llamada al presionar
              tooltip: 'Llamar', // Tooltip para el botón
            ),
          ],
        ),
      ),
    );
  }
}
