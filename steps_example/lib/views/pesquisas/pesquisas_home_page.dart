import 'package:flutter/material.dart';
import 'dados_pessoais/pesquisa_dados_pessoais.dart';

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
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: continued,
                              child: const Text("Avançar"),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          TextButton(
                            onPressed: cancel,
                            child: const Text("Voltar"),
                          ),
                        ],
                      ),
                    );
                  },
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      content: PageStep(),
                      state: StepState.complete,
                      isActive: true,
                      title: _stepSelecionado == 0
                          ? const Text("Dados Pessoais")
                          : const Text(""),
                    ),
                    Step(
                      content: const Center(
                        child: Text("Pesquisa sobre suas dores"),
                      ),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 1
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 1
                          ? const Text("Sobre suas dores")
                          : const Text(""),
                    ),
                    Step(
                      content: const Center(
                        child: Text("Região da dor"),
                      ),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 2
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 2
                          ? const Text("Região da dor")
                          : const Text(""),
                    ),
                    Step(
                      content: const Center(
                        child: Text("Escala da dor"),
                      ),
                      isActive: _stepSelecionado >= 0,
                      state: _stepSelecionado >= 3
                          ? StepState.complete
                          : StepState.disabled,
                      title: _stepSelecionado == 3
                          ? const Text("Escala de dor")
                          : const Text(""),
                    ),
                    Step(
                      content: const Center(
                        child: Text("Atividades fisicas"),
                      ),
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
