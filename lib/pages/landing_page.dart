import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Properties of the landingPageState
  late double _deviceHeight;
  String _title = "Title";

  @override
  Widget build(BuildContext context) {
    // Getting the value of the device height
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 128, 145),
        toolbarHeight: _deviceHeight * 0.15,
        title: Text(
          _title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: taskView(),
      floatingActionButton: FloatingActionButton(
        onPressed: setNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget tasklist() {
    return ListView(
      children: const [
        ListTile(
          title: Text(
            "Task1",
          ),
          subtitle: Text("Task 1 description"),
          trailing: Icon(Icons.check_box_outline_blank),
        ),
        ListTile(
          title: Text(
            "Task1",
          ),
          subtitle: Text("Task 1 description"),
          trailing: Icon(Icons.check_box_outline_blank),
        ),
        ListTile(
          title: Text(
            "Task1",
          ),
          subtitle: Text("Task 1 description"),
          trailing: Icon(Icons.check_box_outline_blank),
        )
      ],
    );
  }

  Widget taskView() {
    return FutureBuilder(
        future:Hive.openBox('box'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return tasklist();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void setNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Put the title"),
            content: TextField(
              onSubmitted: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
          );
        });
  }
}