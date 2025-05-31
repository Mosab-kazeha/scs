import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OrigtionBuilderScreen());
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: size.height > size.width ? Colors.white : Colors.black,
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Center(
        child:
            size.height > size.width
                ? Container(
                  width: size.width / 2,
                  height: size.height / 8,
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      "mobile",
                      style: TextStyle(fontSize: size.height == 100 ? 20 : 50),
                    ),
                  ),
                )
                : Container(
                  width: size.width,
                  height: size.height / 12,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "tab",
                      style: TextStyle(fontSize: size.height == 100 ? 70 : 30),
                    ),
                  ),
                ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}

class ResposiveBuilderScreen extends StatelessWidget {
  const ResposiveBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 700 && constraints.maxHeight > 200) {
            return Container(
              color: Colors.teal,
              width: size.width / 2,
              height: size.height / 4,
              child: Text("tab"),
            );
          } else if (constraints.maxHeight > 400 &&
              constraints.maxWidth < constraints.maxHeight) {
            return Container(
              color: Colors.blueGrey,
              width: size.width / 2,
              height: size.height / 4,
              child: Text("mobile"),
            );
          } else {
            return Container(
              color: Colors.blueGrey,
              width: size.width / 2,
              height: size.height / 4,
              child: Text("deives"),
            );
          }
        },
      ),
    );
  }
}

class OrigtionBuilderScreen extends StatelessWidget {
  const OrigtionBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return FlutterLogo();
          } else {
            return Container(
              color: Colors.blueGrey,
              width: size.width / 2,
              height: size.height / 4,
              child: Text("mobile"),
            );
          }
        },
      ),
    );
  }
}
