import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TextInputWidget extends StatefulWidget {
  final Function(Todo) onPressed;
  final String? selectedTodo;

  const TextInputWidget({Key? key, required this.onPressed, required this.selectedTodo}) : super(key: key);

  @override
  TextInputWidgetState createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State<TextInputWidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.selectedTodo != null) {
      textEditingController.text = widget.selectedTodo!;
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
              left: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Add new To-Do',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 20,
            right: 20,
          ),
          child: ElevatedButton(
            onPressed: () {
              Todo todo = Todo(id: DateTime.now().millisecondsSinceEpoch.toString(),text: textEditingController.text);
              textEditingController.clear();
              widget.onPressed(todo);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              minimumSize: const Size(60, 60),
              elevation: 10,
            ),
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        )],
    );
  }
}