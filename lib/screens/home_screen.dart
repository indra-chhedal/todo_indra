import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_indra/models/todo.dart';
import 'package:todo_indra/screens/edit_screen.dart';
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
              child:
                  todos.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('images/empty.svg', width: 200),
                            Text(
                              "Empty List Items",
                              style: TextStyle(color: Colors.red, fontSize: 30),
                            ),
                          ],
                        ),
                      )
                      : ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Todo todo = todos[index];

                          return ListTile(
                            onLongPress: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.delete),
                                          title: Text("Delete"),
                                          onTap: () {
                                            //show dialog for dialog box for alert dialog
                                            Navigator.of(context).pop();
                                            setState(() {
                                              todos.removeAt(index);
                                            });
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.edit),
                                          title: Text("Edit"),
                                          onTap: () async {
                                            
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => EditScreen(
                                                      todoItem: todo,
                                                    ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            title: Text(todo.title),
                            subtitle: Text(todo.description),
                            trailing: Checkbox(
                              value: todo.isCompleted,
                              onChanged: (value) {
                                //yasma chai todos ko index lai replace garxa todo la ani complete xa vani uncomplete garxa tougle garxa
                                setState(() {
                                  //todo lai rerender garna parxa setstate garyara
                                  todos[index] = todo.copyWith(
                                    isCompleted: !todo.isCompleted,
                                  );
                                });
                              },
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
          //await rw asynchronous sadhi use garna parxa kai value lina ko lagi
          //use asynchornous for navigator.push la always wait garxa some value pop hunxa vnara if pop with value then add to list otherwise empty list items
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


//using long press and then delete list  using one dialog box with conformation.