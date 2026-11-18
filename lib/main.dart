import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "otra calculadora",
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 145, 222, 255),
        ),
      ),
      home: const Calculadora(title: "Calculadora"),
    );
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});

  final String title;
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _numero1 = TextEditingController();
  final TextEditingController _numero2 = TextEditingController();
  String _resultado = "Resultado:";

  @override
  void dispose() {
    _numero1.dispose();
    _numero2.dispose();
    super.dispose();
  }

  void _calcular(String operacion) {
    final double? numero1 = double.tryParse(_numero1.text.trim());
    final double? numero2 = double.tryParse(_numero2.text.trim());

    if (numero1 == null || numero2 == null) {
      setState(() => _resultado = "Resultado: ingresa dos numeros validos");
      return;
    }

    double? resultado;
    switch (operacion) {
      case "+":
        resultado = numero1 + numero2;
        break;
      case "-":
        resultado = numero1 + numero2;
        break;
      case "x":
        resultado = numero1 + numero2;
        break;
      case "/":
        if (numero2 == 0) {
          setState(() => _resultado = "Resultado: Ingresa dos numeros validos");
          return;
        }
        resultado = numero1 / numero2;
        break;
    }
    setState(() => _resultado = "Resultado: $resultado");
  }

  Widget _campo(String etiqueta, TextEditingController controlador) {
    return TextField(
      controller: controlador,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: etiqueta,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _boton(String texto, String operacion) {
    return ElevatedButton(
      onPressed: () => _calcular(operacion),
      child: Text(texto),
    );
  }
}
