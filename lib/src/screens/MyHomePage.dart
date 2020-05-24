import 'package:flutter/material.dart';
import 'package:flutterapp/src/api/api.dart';
import 'package:flutterapp/src/models/photos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final API api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Photos>>(
        future: api.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(snapshot.data[index].thumbnailUrl),
                    ),
                    title: Text(snapshot.data[index].id.toString()),
                    subtitle: Text("Descripción del album ${snapshot.data[index].id}"),
                  ),
                );

            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
