import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final List<String> todos;
  final Function(String todo) onTodoTap;

  const TodoList({Key? key, required this.todos, required this.onTodoTap}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    print(widget.todos); // Log the todos list

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: widget.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular(20)
                  ),
                leading: const Icon(Icons.check_box_outline_blank),
                title: Text(widget.todos[index]),
                onTap: () {
                  widget.onTodoTap(widget.todos[index]);
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
        ),
      ],
    );
  }
}