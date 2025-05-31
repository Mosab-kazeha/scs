import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: OrigtionBuilderScreen());
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 400,
                //   child: ListWheelScrollView(
                //     // offAxisFraction: 0.3,
                //     // magnification: 0.5,
                //     // useMagnifier: true,
                //     onSelectedItemChanged: (value) {
                //       print(value);
                //     },
                //     itemExtent: 200,
                //     children: List.generate(
                //       10,
                //       (index) => Container(
                //         width: 300,
                //         height: 200,
                //         color: Colors.red,
                //         margin: EdgeInsets.all(10),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 200,
                  color: Colors.green,
                  width: (350/395)*MediaQuery.of(context).size.width,
                ),
                Center(
                  child: Checkbox.adaptive(
                    value: true,
                    onChanged: (va) async {
                      //  await   showDatePicker(

                      //       context: context,
                      //       firstDate: DateTime(2010),
                      //       lastDate: DateTime(2026),
                      //     );
                      // await showTimePicker(
                      //   context: context,
                      //   initialTime: TimeOfDay.now(),
                      // );
                      await showCupertinoDialog(
                        context: context,
                        builder:
                            (context) => Container(
                              color: Colors.white70,
                              child: CupertinoDatePicker(
                                // backgroundColor: Colors.grey,
                                onDateTimeChanged: (value) {
                                  print(value);
                                },
                              ),
                            ),
                      );
                    },
                  ),
                ),
              ],
            );
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
