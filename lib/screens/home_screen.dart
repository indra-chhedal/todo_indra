import 'package:flutter/material.dart';
import 'package:todo_indra/models/todo.dart';
import 'package:todo_indra/screens/todo_add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO APP"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("Total Number of list is (${todos.length})"),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo todo = todos[index];

                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //use asynchornous
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoAdd()),
          );
          if (todo != null) {
            setState(() {
              todos.add(todo);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


//if list item is empty show todo is empty otherwise show todos