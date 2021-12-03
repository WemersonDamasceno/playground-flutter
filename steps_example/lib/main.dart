import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Examples',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _stepSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo_sem_nome.png",
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Obrigado por",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "participar da nossa pesquisa!",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  elevation: 0,
                  physics: const ScrollPhysics(),
                  currentStep: _stepSelecionado,
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      content: const PageStep(),
                      state: StepState.complete,
                      isActive: true,
                      title: _stepSelecionado == 0
                          ? const Text("Dados Pessoais")
                          : const Text(""),
                    ),
                    Step(
                      content: const PageStep(),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 1
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 1
                          ? const Text("Sobre suas dores")
                          : const Text(""),
                    ),
                    Step(
                      content: const PageStep(),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 2
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 2
                          ? const Text("Região da dor")
                          : const Text(""),
                    ),
                    Step(
                      content: const PageStep(),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 3
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 3
                          ? const Text("Escala de dor")
                          : const Text(""),
                    ),
                    Step(
                      content: const PageStep(),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 4
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 4
                          ? const Text("Atividades fisicas")
                          : const Text(""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  continued() {
    setState(() {
      _stepSelecionado < 4
          ? setState(() => _stepSelecionado += 1)
          : print(
              "Enviar pra tela de finalização",
            );
    });
  }

  cancel() {
    _stepSelecionado > 0 ? setState(() => _stepSelecionado -= 1) : null;
  }
}

class PageStep extends StatelessWidget {
  const PageStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: "Data de nascimento",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                prefixIcon: Icon(Icons.calendar_today_rounded)),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: "Em que cidade onde você mora?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              prefixIcon: Icon(Icons.location_on_outlined)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: "Você estudou por quantos anos?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                prefixIcon: Icon(Icons.calendar_today_rounded)),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Altura(cm)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    prefixIcon: Icon(Icons.info)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Peso(kg)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      prefixIcon: Icon(Icons.info)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
