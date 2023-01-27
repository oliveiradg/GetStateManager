import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ReatividadePage extends StatelessWidget {
  ReatividadePage({Key? key}) : super(key: key);

  // Transformando a váriavel comum: final _counter = 0; 
  //em variáveis reativas observadas apenas colocando a extesion observable .obs,
  final _counter = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Básico Reatividade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: '),
            Obx(() => Text('${_counter.value}')),

            // Adicionando apenas o $_counter não surtirá efeito, porque o _counter não é ,mais um inteiro, agora ele é um RxInt (Reative X), ou seja, uma variável reativa do tipo inteiro.
            //Como pega o Valor então? O 0.obs é um RxInt, então para pegar o valor dele, basta colocar o .value no final, assim: _counter.value.
            ElevatedButton(
                onPressed: () {
                  _counter.value++;
                  //acrescentando apenas o  _counter.value++; ele somará o valor, mas não apresentará nada na tela.
                  //Como em qualquer outra gerÊncia de estado, ele precisa de alguém que
                  //fique observando as mudanças e atualize a tela, para isso, usamos o OBX.
                  // Obx(() => Text('${_counter.value}')),
                  // A Variável OBX é a responsável por ficar escutando as variáveis .OBS, e ela também tem a responsabilidade de fechar a stream que está aberta por conta desta variável observavel.
                },
                child: const Text('Soma 1'))
          ],
        ),
      ),
    );
  }
}
