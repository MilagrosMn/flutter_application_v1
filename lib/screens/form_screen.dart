import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';


// Este es un StatefulWidget para demostrar el uso de setState() y gestionar el estado del formulario.
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Clave global para validar el formulario
  final _formKey = GlobalKey<FormState>();
  
  // Variables de estado del formulario (manejadas por setState)
  String _movieTitle = '';
  bool _isBlockbuster = false; // Requisito: Switch/Checkbox
  String _submissionMessage = ''; // Mensaje que se actualiza con setState()

  // Función que se ejecuta al presionar el botón
  void _submitForm() {
    // Requisito: TextFormField validation
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // Requisito: Uso de setState() para actualizar el mensaje y la UI
      setState(() {
        _submissionMessage = 'Película enviada: "$_movieTitle". Es Blockbuster: $_isBlockbuster.';
        
        // Limpiamos los campos del formulario después del envío (opcional)
        _movieTitle = ''; 
      });

      // Muestra un SnackBar (pequeño mensaje temporal)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_submissionMessage),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Registro (Stateful)'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      
      drawer: const DrawerMenu(),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Añadir Nuevo Registro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Requisito: TextFormField
              TextFormField(
                initialValue: _movieTitle,
                decoration: InputDecoration(
                  labelText: 'Título de la Película',
                  hintText: 'Ej: El Caballero Oscuro',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.movie_creation_outlined),
                ),
                // Lógica de validación
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un título.';
                  }
                  return null;
                },
                // Guardar el valor en la variable de estado
                onSaved: (value) {
                  _movieTitle = value!;
                },
              ),
              
              const SizedBox(height: 25),

              // Requisito: Switch/Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '¿Es considerada un Blockbuster?',
                    style: TextStyle(fontSize: 16),
                  ),
                  // El Switch usa setState para cambiar su estado (_isBlockbuster)
                  Switch(
                    value: _isBlockbuster,
                    onChanged: (bool newValue) {
                      // **IMPORTANTE: Uso de setState para actualizar el estado**
                      setState(() {
                        _isBlockbuster = newValue;
                      });
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 30),

              // Botón de Envío
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submitForm, // Llama a la función de envío
                  icon: const Icon(Icons.send),
                  label: const Text(
                    'Guardar Película (Demo)',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              
              // Sección para mostrar el estado actualizado con setState
              Container( // Requisito: Container
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estado de la App:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    // Este texto se actualiza cada vez que se llama a setState()
                    Text(
                      _submissionMessage.isEmpty 
                        ? 'Esperando el envío del formulario...' 
                        : _submissionMessage,
                      style: TextStyle(fontStyle: FontStyle.italic, color: _submissionMessage.isEmpty ? Colors.grey : Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}