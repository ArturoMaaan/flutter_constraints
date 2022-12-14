import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

const red = Colors.brown;
const green = Colors.yellow;
const blue = Colors.green;
const big = TextStyle(fontSize: 30);

//////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlutterLayoutArticle([
      Example1(),
      Example2(),
      Example3(),
      Example4(),
      Example5(),
      Example6(),
      Example7(),
      Example8(),
      Example9(),
      Example10(),
      Example11(),
      Example12(),
      Example13(),
      Example14(),
      Example15(),
      Example16(),
      Example17(),
      Example18(),
      Example19(),
      Example20(),
      Example21(),
      Example22(),
      Example23(),
      Example24(),
      Example25(),
      Example26(),
      Example27(),
      Example28(),
      Example29(),
    ]);
  }
}

//////////////////////////////////////////////////

abstract class Example extends StatelessWidget {
  const Example({super.key});

  String get code;

  String get explanation;
}

//////////////////////////////////////////////////

class FlutterLayoutArticle extends StatefulWidget {
  const FlutterLayoutArticle(
    this.examples, {
    super.key,
  });

  final List<Example> examples;

  @override
  State<FlutterLayoutArticle> createState() => _FlutterLayoutArticleState();
}

//////////////////////////////////////////////////

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    count = 1;
    code = const Example1().code;
    explanation = const Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    code = example.code;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Article',
      home: SafeArea(
        child: Material(
          color: Colors.black,
          child: FittedBox(
            child: Container(
              width: 400,
              height: 670,
              color: const Color(0xFFCCCCCC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: double.infinity, height: double.infinity),
                          child: widget.examples[count - 1])),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < widget.examples.length; i++)
                            Container(
                              width: 58,
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: button(i + 1),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 273,
                    color: Colors.grey[50],
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        key: ValueKey(count),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Center(child: Text(code)),
                              const SizedBox(height: 15),
                              Text(
                                explanation,
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(int exampleNumber) {
    return Button(
      key: ValueKey('button$exampleNumber'),
      isSelected: count == exampleNumber,
      exampleNumber: exampleNumber,
      onPressed: () {
        showExample(
          exampleNumber,
          widget.examples[exampleNumber - 1].code,
          widget.examples[exampleNumber - 1].explanation,
        );
      },
    );
  }

  void showExample(int exampleNumber, String code, String explanation) {
    setState(() {
      count = exampleNumber;
      this.code = code;
      this.explanation = explanation;
    });
  }
}

//////////////////////////////////////////////////

class Button extends StatelessWidget {
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.isSelected,
    required this.exampleNumber,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: isSelected ? Colors.grey : Colors.grey[800],
      ),
      child: Text(exampleNumber.toString()),
      onPressed: () {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
          alignment: 0.5,
        );
        onPressed();
      },
    );
  }
}
//////////////////////////////////////////////////

class Example1 extends Example {
  const Example1({super.key});

  @override
  final code = 'Container(color: brown)';

  @override
  final explanation = '1.	La pantalla es el padre del contendedor, y obliga al contenedor a ser exactamente del mismo tama??o que la pantalla.'
      '\n\n'
      'Entonces el contenedor llena la pantalla y la pinta de caf??';

  @override
  Widget build(BuildContext context) {
    return Container(color: red);
  }
}

//////////////////////////////////////////////////

class Example2 extends Example {
  const Example2({super.key});

  @override
  final code = 'Container(width: 100, height: 100, color: red)';
  @override
  final String explanation =
      '2.	El Contenedor caf?? quiere ser 100x100, pero no puede porque la pantalla obliga a que sea exactamente del mismo tama??o que la pantalla.'
      '\n\n'
      'Entonces el Contenedor llena la pantalla.';

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

//////////////////////////////////////////////////

class Example3 extends Example {
  const Example3({super.key});

  @override
  final code = 'Center(\n'
      '   child: Container(width: 100, height: 100, color: red))';
  @override
  final String explanation =
      '3.	La pantalla obliga al Centro a ser exactamente del mismo tama??o que la pantalla, para que el Centro llene la pantalla. '
      '\n\n'
      'El Centro le dice al Contenedor que puede ser del tama??o que quiera, pero no mas grande que la pantalla. Ahora el contenedor puede ser de 100x100.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example4 extends Example {
  const Example4({super.key});

  @override
  final code = 'Align(\n'
      '   alignment: Alignment.bottomRight,\n'
      '   child: Container(width: 100, height: 100, color: red))';
  @override
  final String explanation =
      '4.	Esto es diferente del ejemplo anterior en que usa Alinear en lugar de Centrar.'
      '\n\n'
      'Align tambi??n le dice al Contenedor que puede tener el tama??o que desee, pero si hay espacio vac??o, no centrara el Contenedor. '
      'En su lugar, alinea el Contenedor en la parte inferior derecha del espacio disponible.';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example5 extends Example {
  const Example5({super.key});

  @override
  final code = 'Center(\n'
      '   child: Container(\n'
      '              color: red,\n'
      '              width: double.infinity,\n'
      '              height: double.infinity))';
  @override
  final String explanation =
      '5.	La pantalla obliga al Centro a ser exactamente del mismo tama??o que la pantalla, '
      'para que el Centro llene la pantalla.'
      '\n\n'
      'El Centro le dice al Contenedor que puede ser del tama??o que quiere, pero no mas grande que la pantalla.'
      'El Contenedor quiere tener un tama??o infinito, pero como no puede ser mas grande que la pantalla, solo llena la pantalla.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity, height: double.infinity, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example6 extends Example {
  const Example6({super.key});

  @override
  final code = 'Center(child: Container(color: red))';
  @override
  final String explanation =
      '6.	La pantalla obliga al centro a ser exactamente del mismo tama??o que la pantalla'
      'para que el Centro llene la pantalla.'
      '\n\n'
      'El Centro le dice al Contenedor que puede ser del tama??o que quiera, pero no mas grande que la pantalla.'
      '\n\n'
      'Dado que el Contenedor no tiene un ni??o ni un tama??o fijo, decide que quiere se lo mas grande posible, por lo que llena toda la pantalla.'
      '\n\n'
      'Pero ??por qu?? el contenedor decide eso? Simplemente porque esa es una decisi??n de dise??o de quienes crearon el widget Container. '
      'Podr??a haber sido creado de manera diferente, y debe leer la documentaci??n del contenedor para comprender como se comporta, seg??n las circunstancias. ';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example7 extends Example {
  const Example7({super.key});

  @override
  final code = 'Center(\n'
      '   child: Container(color: red\n'
      '      child: Container(color: green, width: 30, height: 30)))';
  @override
  final String explanation =
      '7.	El centro le dice al Contenedor rosa que puede ser del tama??o que quiera, '
      'pero no mas grande que la pantalla. '
      '\n\n'
      'Dado que el contenedor rosa no tiene tama??o, pero tiene un hijo, decide que quiere ser del mismo tama??o que su hijo.'
      '\n\n'
      'El Contenedor rosa le dice a su hijo que puede ser del tama??o que quiera, pero no mas grande que la pantalla.'
      '\n\n'
      'El ni??o es un Contenedor verde que quiere ser de 30x30.'
      '\n\n'
      'Dado que el ???Contenedor??? rosa no tiene tama??o, pero tiene un hijo, decide que quiere ser del mismo tama??o que su hijo. El color rosa no es visible, ya que el Contenedor lila cubre completamente todo el contenedor rosa.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example8 extends Example {
  const Example8({super.key});

  @override
  final code = 'Center(\n'
      '   child: Container(color: red\n'
      '      padding: const EdgeInsets.all(20.0),\n'
      '      child: Container(color: green, width: 30, height: 30)))';
  @override
  final String explanation =
      'El contenedor rojo se ajusta al tama??o de sus hijos, pero tiene en cuenta su propio relleno. '
      'As?? que tambi??n es 30x30 m??s relleno. '
      'El color rojo es visible debido al relleno, y el Contenedor verde tiene el mismo tama??o que en el ejemplo anterior.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example9 extends Example {
  const Example9({super.key});

  @override
  final code = 'ConstrainedBox(\n'
      '   constraints: BoxConstraints(\n'
      '              minWidth: 70, minHeight: 70,\n'
      '              maxWidth: 150, maxHeight: 150),\n'
      '      child: Container(color: red, width: 10, height: 10)))';
  @override
  final String explanation =
      '9.	Puede suponer que el contenedor  debe tener entre 70 y 150 px, pero estar??a equivocado.  '
      'constrainedBox solo impone restricciones ADICIONALES de las que recibe de su padre.'
      '\n\n'
      'Aqu??, la pantalla obliga a ConstrainedBox a tener exactamente el mismo tama??o que la pantalla, '

      'thus ignoring its \'constraints\' parameter.';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(color: red, width: 10, height: 10),
    );
  }
}

//////////////////////////////////////////////////

class Example10 extends Example {
  const Example10({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 10, height: 10))))';
  @override
  final String explanation =
      '10.	Ahora, Center que ConstrainedBox tenga cualquier tama??o hasta el tama??o de la pantalla.'
      '\n\n'
      'ConstrainedBox impone restricciones ADICIONALES desde su par??metro ???constraints??? a su hijo.'
      '\n\n'
      'El contenedor debe tener entre 70 y 150px. Quiere tener 10 px, por lo que terminara teniendo 70 (el MINIMO).';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 10, height: 10),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example11 extends Example {
  const Example11({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 1000, height: 1000))))';
  @override
  final String explanation =
      '11.	Center permite que ConstrainedBox tenga cualquier tama??o hasta el tama??o de la pantalla.'
      'constrainedBox impone restricciones ADICIONALES desde su par??metro ???constraints??? a su hijo'
      '\n\n'
      'El contenedor debe tener entre 70 y 150 px. Quiere tener 1000 px, por lo que acaba teniendo 150(el MAXIMO).';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 1000, height: 1000),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example12 extends Example {
  const Example12({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 100, height: 100))))';
  @override
  final String explanation =
      '12. Center permite que ConstrainedBox tenga cualquier tama??o hasta el tama??o de la pantalla.'
      'ConstrainedBox impone restricciones ADICIONALES desde su par??metro ???constraints??? a su hijo.'
      '\n\n'
      'El contenedor debe tener entre 70 y 150 px. Quiere tener 100 px, y ese es el tama??o que tiene, ya que esta entre 70 y 150.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 100, height: 100),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example13 extends Example {
  const Example13({super.key});

  @override
  final code = 'UnconstrainedBox(\n'
      '   child: Container(color: red, width: 20, height: 50));';
  @override
  final String explanation =
      'T13.	La pantalla obliga a UnconstrainedBox a tener exactamente el mismo tama??o que la pantalla.'
      'Sin embargo, UnconstrainedBox permite que su contenedor secundario tenga el mismo tama??o que desee.';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 20, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example14 extends Example {
  const Example14({super.key});

  @override
  final code = 'UnconstrainedBox(\n'
      '   child: Container(color: red, width: 4000, height: 50));';
  @override
  final String explanation =
      '14.	La pantalla obliga a UnconstrainedBox a tener exactamente el mismo tama??o que la pantalla '
      'y UnconstrainedBox permite que su Contenedor secundario tenga el tama??o que desee.'
      '\n\n'
      'Desafortunadamente, en este caso, el contenedor tiene 4000 px de ancho y es demasiado grande para caber en el cuadro sin restricciones, '
      'Entonces UnconstrainedBox muestra la tan temida ???advertencia de desbordamiento???.';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example15 extends Example {
  const Example15({super.key});

  @override
  final code = 'OverflowBox(\n'
      '   minWidth: 0.0,'
      '   minHeight: 0.0,'
      '   maxWidth: double.infinity,'
      '   maxHeight: double.infinity,'
      '   child: Container(color: red, width: 4000, height: 50));';
  @override
  final String explanation =
      '15.	La pantalla obliga al OverflowBox a tener exactamente el mismo tama??o que la pantalla, '
      'y OverflowBox permite que su contenedor secundario tenga el mismo tama??o que desee.'
      '\n\n'
      'OverflowBox es similara UncostrainedBox, y la diferencia es que no mostrara ninguna advertencia si el ni??o no cabe en el espacio. '
      '\n\n'
      'En este caso, el contenedor tiene 4000 px de ancho y es demasiado grande para caber en el OverflowBox. '
      'Pero el OverflowBox simplemente muestra todo lo que puede, sin dar advertencias.';

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example16 extends Example {
  const Example16({super.key});

  @override
  final code = 'UnconstrainedBox(\n'
      '   child: Container(color: Colors.red, width: double.infinity, height: 100));';
  @override
  final String explanation =
      '16.	Esto no genera nada y vera un error en la consola.'
      '\n\n'
      'The UnconstrainedBox permite que su hijo sea del tama??o que quiera, '
      'sin embargo, su hijo es un Contenedor de tama??o infinito.'
      '\n\n'
      'Flutter no puede representar tama??os infinitos, por lo que arroja un error con el siguiente mensaje:  '
      '"BoxConstraints fuerza un ancho infinito."';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: Colors.red, width: double.infinity, height: 100),
    );
  }
}

//////////////////////////////////////////////////

class Example17 extends Example {
  const Example17({super.key});

  @override
  final code = 'UnconstrainedBox(\n'
      '   child: LimitedBox(maxWidth: 100,\n'
      '      child: Container(color: Colors.red,\n'
      '                       width: double.infinity, height: 100));';
  @override
  final String explanation = 
      '17.	Aqu?? ya no obtendr??s un error, porque cuando el UnconstrainedBox le da a LimitedBox un tama??o infinito, pasa un ancho m??ximo de 100 hasta su hijo.'
      '\n\n'
      'Si cambia el UnconstrainedBox por un widget Center, '
      'LimitedBox ya no aplicara su limite (ya que su limite solo se aplica cuando tiene restricciones infinitas), '
      'y se permite que el ancho del Contenedor crezca mas all?? de 100.'
      '\n\n'
      'Esto explica la diferencia entre un limitedBox y un ConstrainedBox.';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 100,
        child: Container(
          color: Colors.red,
          width: double.infinity,
          height: 100,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example18 extends Example {
  const Example18({super.key});

  @override
  final code = 'FittedBox(\n'
      '   child: Text(\'Some Example Text.\'));';
  @override
  final String explanation =
      'La pantalla obliga a la FittedBox a tener el mismo tama??o que la pantalla.'
      'El texto tiene un ancho natural (tambi??n llamado ancho intrinseco) que depende de la cantidad de texto, el tama??o de la fuente, etc.'
      '\n\n'
      'FittedBox permite que el texto tenga el tama??o que desee. '
      'pero despu??s de que el Texto le dice su tama??o al FittedBox. '
      'FiteedBox escala el texto hasta que llena todo el ancho disponible.';

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      child: Text('Some Example Text.'),
    );
  }
}

//////////////////////////////////////////////////

class Example19 extends Example {
  const Example19({super.key});

  @override
  final code = 'Center(\n'
      '   child: FittedBox(\n'
      '      child: Text(\'Some Example Text.\')));';
  @override
  final String explanation =
      '19.	Pero, ??Qu?? sucede si coloca el FitteedBox dentro de un widget del Centro?  '
      'El centro permite que FittedBox sea del tama??o que quiera, hasta el tama??o de la pantalla.'
      '\n\n'
      'FittedBox se ajusta al tama??o del texto y permite que el texto tenga el tama??o que desee.'
      '\n\n'
      'Dado que tanto FittedBox como el texto tienen el mismo tama??o, no se escala.';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FittedBox(
        child: Text('Some Example Text.'),
      ),
    );
  }
}

////////////////////////////////////////////////////

class Example20 extends Example {
  const Example20({super.key});

  @override
  final code = 'Center(\n'
      '   child: FittedBox(\n'
      '      child: Text(\'???\')));';
  @override
  final String explanation =
      '20.	Sin embargo, ??Qu?? sucede si FittedBox esta dentro de un widget de Center, pero el texto es demasiado grande para caber en la pantalla?'
      '\n\n'
      'FittedBox intenta adaptarse al tama??o del  texto, pero no puede ser mas grande que la pantalla.  '
      'Luego asume el tama??o de la pantalla y cambia el tama??o del texto para que tambi??n se ajusta la pantalla.';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FittedBox(
        child: Text(
            'Este es un texto muy, muy grande que es demasiado grande para caber en una pantalla normal en una sola l??nea.'),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example21 extends Example {
  const Example21({super.key});

  @override
  final code = 'Center(\n'
      '   child: Text(\'???\'));';
  @override
  final String explanation = '21.	Sin embargo, si elimina el FittedBox, '
      'el Texto obtiene su ancho m??ximo de la pantalla, '
      'y rompe la l??nea para que se ajuste a la pantalla.';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'Este es un texto muy, muy grande que es demasiado grande para caber en una pantalla normal en una sola l??nea.'),
    );
  }
}

//////////////////////////////////////////////////

class Example22 extends Example {
  const Example22({super.key});

  @override
  final code = 'FittedBox(\n'
      '   child: Container(\n'
      '      height: 20.0, width: double.infinity));';
  @override
  final String explanation =
      '22.	fittedBox solo puede escalar un widget que esta LIMITADO (no tiene un ancho y una altura infinitos). De lo contrario, no generara nada y vera un error en la consola.';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 20.0,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example23 extends Example {
  const Example23({super.key});

  @override
  final code = 'Row(children:[\n'
      '   Container(color: red, child: Text(\'Hello!\'))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  @override
  final String explanation =
      '23.	La pantalla obliga a que la Fila sea exactamente del mismo tama??o que la pantalla.'
      '\n\n'
      'Al igual que un UnconstrainedBox, Row no impondr?? ningua restricci??n a sus elementos secundarios y en cambio les permite ser del tama??o que quieran.'
      '\n\n'
      'The Row luego los coloca uno al lado del otro, y cualquier espacio adicional permanece vacio.';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: red, child: const Text('Hello!', style: big)),
        Container(color: green, child: const Text('Goodbye!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example24 extends Example {
  const Example24({super.key});

  @override
  final code = 'Row(children:[\n'
      '   Container(color: red, child: Text(\'???\'))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  @override
  final String explanation =
      '24.	Dado que Row no impondr?? ninguna restricci??n a sus hijos, '
      'Es muy probable que los ni??os sean demasiado grandes para caber en el ancho disponible de la Fila.'
      '. En este caso, al igual que UnconstrainedBox, la fila muestra ???la advertencia de desbordamiento???.';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: red,
          child: const Text(
            'Este es un texto muy largo que '
            'no encajar?? en la l??nea.',
            style: big,
          ),
        ),
        Container(color: green, child: const Text('Adi??s!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example25 extends Example {
  const Example25({super.key});

  @override
  final code = 'Row(children:[\n'
      '   Expanded(\n'
      '       child: Container(color: red, child: Text(\'???\')))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  @override
  final String explanation =
      '25.	Cuando el hijo de una Fila se envuelve en un widget Expandido, la Fila ya no permitir?? que este hijo defina su propio ancho.'
      '\n\n'
      'En cambio, define el ancho Expandido de acuerdo con los otros ni??os, y solo entonces el widget Ecpandido obliga al ni??o original a tener el ancho Expandido.'
      '\n\n'
      'En otras palabras, una ves que usa Expandido, el ancho del ni??o original se vuelve irrelevante y se ignora.';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              color: red,
              child: const Text(
                'Este es un texto muy largo que no encajar?? en la l??nea.',
                style: big,
              ),
            ),
          ),
        ),
        Container(color: green, child: const Text('Adi??s!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example26 extends Example {
  const Example26({super.key});

  @override
  final code = 'Row(children:[\n'
      '   Expanded(\n'
      '       child: Container(color: red, child: Text(\'???\')))\n'
      '   Expanded(\n'
      '       child: Container(color: green, child: Text(\'Goodbye!\'))]';
  @override
  final String explanation =
      '26.	Si todos los elementos secundarios de Row???s est??n envueltos en widgets Expandidos, cada Expandido tiene un tama??o proporcional a su par??metro flexible, '
      'y solo entonces cada widget Expandido obliga a su hijo a tener el ancho de Expandido.'
      '\n\n'
      'En otras palabras, Expanded ignora el ancho preferido de sus hijos.';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: red,
            child: const Text(
              'Este es un texto muy largo que no encajar?? en la l??nea.',
              style: big,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: green,
            child: const Text(
              'Adi??s!',
              style: big,
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example27 extends Example {
  const Example27({super.key});

  @override
  final code = 'Row(children:[\n'
      '   Flexible(\n'
      '       child: Container(color: red, child: Text(\'???\')))\n'
      '   Flexible(\n'
      '       child: Container(color: green, child: Text(\'Goodbye!\'))]';
  @override
  final String explanation =
      '27.	La ??nica diferencia si usa Flexible en lugar de Expandido, '
      ', es que Flexible permite que su hijo sea M??S PEQUE??O que el ancho de Flexible, '
      'mientras que Expandido obliga a su hijo a tener el mismo ancho que Expandido.'
      '\n\n'
      'Pero tanto Expandido como Flexible ignoran el ancho de sus hijos cuando se miden a si mismos. '
      '\n\n'
      'Esto significa que es IMPOSIBLE expandir los ni??os de Fila proporcionalmente a sus tama??os. '
      'La fila usa el ancho exacto del ni??o o lo ignora por completo cuando usa Expandido o Flexible.';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: red,
            child: const Text(
              'Este es un texto muy largo que no encajar?? en la l??nea.',
              style: big,
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: green,
            child: const Text(
              'Adi??s!',
              style: big,
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example28 extends Example {
  const Example28({super.key});

  @override
  final code = 'Scaffold(\n'
      '   body: Container(color: blue,\n'
      '   child: Column(\n'
      '      children: [\n'
      '         Text(\'Hello!\'),\n'
      '         Text(\'Goodbye!\')])))';

  @override
  final String explanation =
      'La pantalla obliga al Scaffold a ser exactamente del mismo tama??o que la pantalla, '
      'para que el Scaffold llene la pantalla.'
      '\n\n'
      'El Andamio le dice al Contenedor que puede ser del tama??o que quiera, pero no m??s grande que la pantalla.'
      '\n\n'
      'Cuando un widget le dice a su hijo que puede ser m??s peque??o que cierto tama??o, '
      'decimos que el widget proporciona restricciones "sueltas" a su hijo. M??s sobre eso m??s tarde.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blue,
        child: Column(
          children: const [
            Text('Hola!'),
            Text('Adi??s!'),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example29 extends Example {
  const Example29({super.key});

  @override
  final code = 'Scaffold(\n'
      '   body: Container(color: blue,\n'
      '   child: SizedBox.expand(\n'
      '      child: Column(\n'
      '         children: [\n'
      '            Text(\'Hello!\'),\n'
      '            Text(\'Goodbye!\')]))))';

  @override
  final String explanation =
      'Si desea que el ni??o de Scaffold sea exactamente del mismo tama??o que el propio Scaffold, '
      'puede envolver su hijo con SizedBox.expand.'
      '\n\n'
      'Cuando un widget le dice a su hijo que debe tener un tama??o determinado, '
      'decimos que el widget proporciona restricciones ???estrictas??? a su hijo. Mas sobre eso m??s adelante.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: blue,
          child: Column(
            children: const [
              Text('Hola!'),
              Text('Adi??s!'),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////