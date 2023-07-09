import 'package:flutter/material.dart';
import 'models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final Function(Todo todo) onTodoTap;

  const TodoList({Key? key, required this.todos, required this.onTodoTap}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {

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
                leading: const Icon(Icons.list_alt),
                title: Text(widget.todos[index].text),
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