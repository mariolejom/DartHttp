import 'package:flutter/material.dart';
import 'package:flutterapp/src/api/api.dart';
import 'package:flutterapp/src/models/photos.dart';
import 'package:flutterapp/src/models/posts.dart';

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
      body: FutureBuilder<List<Posts>>(
        future: api.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: ListTile(
//                      leading: CircleAvatar(
//                        radius: 30,
//                        backgroundImage: NetworkImage(snapshot.data[index].title),
//                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].body),
                    ),
                  );

                });
          } else {
            return Center(
              child: LinearProgressIndicator(),
            );
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
