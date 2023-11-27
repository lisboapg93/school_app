//import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:seduc_app/pages/chamada_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController newTaskCtrl = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _dateController = TextEditingController();
  String? selectedValueEscola;
  String? selectedValueTurma;
  String? selectedValueDisciplina;

  final List<String> escolas = ['URA', 'URE', 'URI', 'URO', ''];
  final List<String> turmas = [
    '6A Ensino Fundamental',
    '6B Ensino Fundamental',
    '8A Ensino Fundamental',
    '8B Ensino Fundamental',
    '8C Ensino Fundamental',
    '4A Ensino Fundamental',
    '4B Ensino Fundamental',
    '3A Ensino Fundamental',
    '9A Ensino Fundamental',
    '1A Ensino Medio',
    '2A Ensino Medio',
    '3A Ensino Medio',

  ];

  final List<String> disciplina = [
    'Matemática B1',
    'Portugues C4',
    'Historia A2',
    'Geografia D7',
    'Inglês F3',
    'Ciências H6'
  ];

  String formatarDataHora(DateTime dataHora) {
    var formatter = DateFormat('dd/MM', 'pt_BR');
    return formatter.format(dataHora);
  }

  DateTime _dateTime = DateTime.now();

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      setState(() {
        _dateTime = pickedDate;
        _dateController.text = formatarDataHora(_dateTime);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedValueEscola = escolas[0];
    selectedValueTurma = turmas[0];
    selectedValueDisciplina = disciplina[0];

    initializeDateFormatting('pt_BR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selecione a Escola', style: TextStyle(fontSize: 18)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red, width: 3),
              ),
              child: DropdownButton<String>(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                items: escolas.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
                value: selectedValueEscola,
                onChanged: (String? value) {
                  setState(() {
                    selectedValueEscola = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 80),
            const Text('Selecione a Turma', style: TextStyle(fontSize: 18)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromARGB(255, 1, 112, 202), width: 3)),
              child: DropdownButton<String>(
                style: const TextStyle(fontSize: 14),
                items: turmas.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  );
                }).toList(),
                value: selectedValueTurma,
                onChanged: (String? value) {
                  setState(() {
                    selectedValueTurma = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 80),
            const Text('Selecione a Disciplina',
                style: TextStyle(fontSize: 18)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromARGB(255, 196, 150, 0), width: 3)),
              child: DropdownButton<String>(
                style: const TextStyle(fontSize: 14),
                items: disciplina.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  );
                }).toList(),
                value: selectedValueDisciplina,
                onChanged: (String? value) {
                  setState(() {
                    selectedValueDisciplina = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(150, 0, 150, 0),
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Data',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 231, 240, 108), width: 3)),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChamadaPage(),
                  ),
                );
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }
}
