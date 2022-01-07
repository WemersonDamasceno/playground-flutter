import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chips Selecionados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<EventoChip> _listEventos = [
    EventoChip(isSelecionado: false, titulo: "Niver Manu"),
    EventoChip(isSelecionado: false, titulo: "Super festa"),
    EventoChip(isSelecionado: false, titulo: "Reuniao familia"),
    EventoChip(isSelecionado: false, titulo: "Roda de violao"),
    EventoChip(isSelecionado: false, titulo: "Cinema"),
    EventoChip(isSelecionado: false, titulo: "Aniversario Pai"),
    EventoChip(isSelecionado: false, titulo: "Niver Maiara"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFF707070),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "De qual evento é essa foto?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      //Container dos eventos (chips)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 90, 90, 90),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: List<Widget>.generate(
                                    _listEventos.length, (i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 2.0,
                                      left: 8.0,
                                      right: 8.0,
                                    ),
                                    child: FilterChip(
                                      label: Text(_listEventos[i].titulo),
                                      selected: _listEventos[i].isSelecionado,
                                      onSelected: (bool value) {
                                        setState(() {
                                          _listEventos[i].isSelecionado =
                                              !_listEventos[i].isSelecionado;
                                        });
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Botao de criar novo evento
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () => showDialogAddEvento(context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: const Text(
                            "Não existe? Crie um evento agora!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogAddEvento(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DialogAddEvento();
      },
    );
  }
}

class DialogAddEvento extends StatelessWidget {
  const DialogAddEvento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF989898),
              Color(0xFF363636),
            ],
          ),
        ),
        height: 145,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Qual o nome do evento?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Digite aqui...",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text("Definir evento"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventoChip {
  String titulo;
  bool isSelecionado;

  EventoChip({required this.titulo, required this.isSelecionado});
}
