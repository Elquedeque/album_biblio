import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center ( child: GestureDetector(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const SizedBox(height: 40),
            // Imagen
            CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            // Nombre
            const Text(
            'Francisco Salazar Figueroa',
            style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            shadows: [
            Shadow(
            offset: Offset(1.2, 1.2),
            blurRadius: 1.5,
            color: Color.fromARGB(255, 43, 53, 46),
            ),
            ],
            ),
            ),
            const SizedBox(height: 40),
            //Descripcion
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
              'Estudiante de Ingenieria en Informatica cursando el 7tmo semestre en el TecNM campus Hermosillo',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
              shadows: [
              Shadow(
              offset: Offset(1, 1),
              blurRadius: 1,
              color: Color.fromARGB(255, 40, 46, 42),
              ),
              ],
              ),
              ),
              ),
              const SizedBox(height: 40),
              //Datos Generales
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 6.0),
              child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade700, width: 1),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
              Text(
              'Email: l22330883@hermosillo.tecnm.mx',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 6),
              Text(
              'Teléfono: +52 637 103 7897',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 6),
              Text(
              'LinkedIn: www.linkedin.com/in/fasf0412',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
            ) ,
            ),
            ),
          ],
        ),
  ),),)
  ,);}}