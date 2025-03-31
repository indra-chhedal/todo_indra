import 'package:flutter/material.dart';

class ToduScreen extends StatefulWidget {
  const ToduScreen({super.key});

  @override
  State<ToduScreen> createState() => _ToduScreenState();
}

class _ToduScreenState extends State<ToduScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> tasks = [
    {"title": "Complete all the college assignments", "date": "May 16", "done": false},
    {"title": "Buy watch for dad on Father's Day", "date": "May 17", "done": false},
    {"title": "Complete the Case Study and send it to the professor", "date": "May 17", "done": false},
    {"title": "My best Friend's Birthday Party", "date": "May 20", "done": false},
    {"title": "Help sister with her Calculus Homework", "date": "", "done": false},
  ];

  void toggleTask(int index) {
    setState(() {
      tasks[index]['done'] = !tasks[index]['done'];
    });
  }

  void addTask(String title, String date) {
    setState(() {
      tasks.add({"title": title, "date": date, "done": false});
    });
  }

  void showAddTaskDialog() {
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Task Title"),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: "Due Date"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                addTask(titleController.text, dateController.text);
                Navigator.pop(context);
              }
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("My Todo"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              color: Colors.green.shade100,
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text("Complete Flutter UI App challenge and upload it on Github"),
                subtitle: Text("1hr 25m"),
              ),
            ),
            SizedBox(height: 10),
            Text("Remaining Tasks (${tasks.length})",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: tasks[index]['done'],
                        onChanged: (value) => toggleTask(index),
                      ),
                      title: Text(tasks[index]['title']),
                      subtitle: Text(tasks[index]['date']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade700,
      ),
    );
  }
}
