import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:page_dannonces/Widget/ScrollWidget.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: AppBarExample(),
      home: SettingApp(),
    );
  }
}

class SettingApp extends StatelessWidget {
  const SettingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parametre'),
        actions: [Icon(Icons.settings)],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(
              children: [
                Icon(Icons.privacy_tip),
                Text('Confidentialite'),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.notification_add),
              Text('Notificaiton'),
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.delete),
              Text('Supprimer Compte'),
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: const Row(children: [
              Icon(Icons.help),
              Text('Aide'),
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ]),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniversityApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.purple],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.newspaper),
                onPressed: () {},
                iconSize: 35,
              ),
              IconButton(
                icon: const Icon(Icons.account_box_rounded),
                onPressed: () {},
                iconSize: 35,
              ),
              IconButton(
                icon: const Icon(Icons.school),
                onPressed: () {},
                iconSize: 35,
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {},
                iconSize: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 800,
              child: ScrollableWidget(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const TextField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_box_rounded, size: 63),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          hintText: 'What is new?',
                          suffixIcon: Icon(Icons.add)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(25),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: 45,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'NameUser',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text('24day',
                                        style: TextStyle(fontSize: 9)),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2 like'),
                            Text('0 comments'),
                            Text('0 times'),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(25),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: 45,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'NameUser',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text('24day',
                                        style: TextStyle(fontSize: 9)),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2 like'),
                            Text('0 comments'),
                            Text('0 times'),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_circle_rounded,
                                size: 45,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'NameUser',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text('24day', style: TextStyle(fontSize: 9)),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_vert_rounded),
                        ],
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(25),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: 45,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'NameUser',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text('24day',
                                        style: TextStyle(fontSize: 9)),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2 like'),
                            Text('0 comments'),
                            Text('0 times'),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(25),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: 45,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'NameUser',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text('24day',
                                        style: TextStyle(fontSize: 9)),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2 like'),
                            Text('0 comments'),
                            Text('0 times'),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(25),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: 45,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'NameUser',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text('24day',
                                        style: TextStyle(fontSize: 9)),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 193,
                      ),
                      Container(
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2 like'),
                            Text('0 comments'),
                            Text('0 times'),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Icon(Icons.comment),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              )))
        ],
      ),

      /* const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),*/
    );
  }

  //Scrollablewidget({required List<Container> children}) {}
}

/*class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Action 1'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Action 2'),
          ),
        ],
      ),
    );
  }
}
*/

/*class MyApp extends StatelessWidget {
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
        // the application has a blue toolbar. Then, without quitting the app,
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
        useMaterial3: true,
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
