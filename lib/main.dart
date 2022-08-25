import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Список 1', 'Список 2'];
  final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фотографии': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homework example'),
          bottom: TabBar(
              tabs: data.keys.map((String item) => Tab(text: item)).toList()),
        ),
        body: TabBarView(
          children: data.keys.map((name) {
            return ListView(
              key: PageStorageKey(name),
              children: <Widget>[
                if (data[name] != null)
                  for (var el in data[name])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: //Image.network(el),
                          Image.network(
                        el,
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.noRepeat,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text(
                              'Whoops!',
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        },
                      ),
                    ),

                // вариант 2
                //...data[name].map((value) => Image.network(value.toString()))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
