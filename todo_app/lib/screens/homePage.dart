import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/searchBox.dart';
import '../widgets/toDoWidget.dart';
import '../model/toDo.dart';
import '../model/toDoList.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ToDoList todoList = ToDoList([]);

  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  void _handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.list.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String text) {
    setState(() {

      todoList.list.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: text
      ));
      _todoController.clear();
    });
  }

  void _runFilter(String key) {
    List<ToDo> results = [];
    if(key.isEmpty) {
      results = todoList.list;
    }
    else {
      results = todoList.list
        .where((element) => element.todoText!
          .toLowerCase()
          .contains(key.toLowerCase()))
        .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  @override
  void initState() {
    _foundToDo = todoList.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: tdBGColor,

      appBar: _buildAppBar(),

      body: Stack( // stack para sobrepor itens
        children: [
          Container( // container para o todo itens

            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

            child: Column(

              children: [
                searchBox(changeFunction: _runFilter,),
                Expanded(
                  child: ListView(

                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All toDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo)
                        ToDoItem(todo: todo, onTodoChanged: _handleTodoChange, onDeleteItem: _deleteTodoItem,)
                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+', style: TextStyle(fontSize: 40),),
                    onPressed: () {
                      _addTodoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      minimumSize: Size(60, 60),
                    ),
                  )
                )
              ],
            ),
          )
        ],
      )
    );

  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              child: Image.asset('assets/avatar.jpeg'),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}

