class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Checar email'),
      ToDo(id: '02', todoText: 'Limpar quarto'),
      ToDo(id: '03', todoText: 'Prova Banco de Dados'),
      ToDo(id: '04', todoText: 'Tarefa POO'),
    ];
  }
}