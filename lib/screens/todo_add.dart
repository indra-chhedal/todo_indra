import 'package:flutter/material.dart';

class TodoAdd extends StatefulWidget {
  const TodoAdd({super.key});

  @override
  State<TodoAdd> createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 242, 242),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(115, 125, 124, 124),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10,
              children: [
                Text("Add a Item", style: TextStyle(fontSize: 24)),

                TextField(
                  
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 254, 254),
                    hintText: "Enter title",
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                TextField(
                  maxLines: 3,

                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 254, 254, 254),
                    hintText: "Enter Description",

                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 211, 210, 209),
                    ),
                  ),
                  child: Text(
                    "Add Item",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
