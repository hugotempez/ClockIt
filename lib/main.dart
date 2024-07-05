import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'models/labelModel.dart';


void main() {
  final config = Configuration.local([Label.schema/*, ici tous les autres models*/]);
  final realm = Realm(config);
  runApp(MyApp(realm: realm));
}

class MyApp extends StatelessWidget {
  final Realm realm;
  const MyApp({required this.realm, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: HomePage(realm: realm),
    );
  }
}

class HomePage extends StatefulWidget {
  final Realm realm;
  const HomePage({required this.realm, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  static final List<Widget> _displayedItem = [Labels(realm: this.realm), Test2(realm: realm), Test3(realm: realm)];
  static const List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.label), label: "Libellés"),
    BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Pointage"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historique")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClockIt!"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: _displayedItem.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
        backgroundColor: Colors.amber,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}


class Labels extends StatefulWidget {
  final Realm realm;
  const Labels({required this.realm, super.key});

  @override
  State<Labels> createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  /* Attributes */
  late TextEditingController _labelController;
  late TextEditingController _commentController;

  /* Methods */
  void processLabels() {
    print(_labelController.text);
    print(_commentController.text);
  }

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  /* Build */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Center(child: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
            Text("Ajouter un libellé :"),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _labelController,
                )
            ),
            Text("Ajouter un commentaire :"),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _commentController,
                )
            ),
            TextButton(onPressed: processLabels, child: Text("Ajouter"))
          ])
      )
      )
    );
  }
}


class Test2 extends StatelessWidget {
  final Realm realm;
  const Test2({required this.realm, super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("2");
  }
}

class Test3 extends StatelessWidget {
  final Realm realm;
  const Test3({required this.realm, super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("3");
  }
}
