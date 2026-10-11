import 'package:flutter/material.dart';

void main() {
  runApp(const StudyTrackApp());
}

class StudyTrackApp extends StatelessWidget {
  const StudyTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Task {
  String title;
  bool completed;

  Task({
    required this.title,
    this.completed = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask() {
    setState(() {
      tasks.add(Task(title: 'Estudiar Flutter'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudyTrack'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Mis tareas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Agregar tarea'),
            ),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text('Todavía no tienes tareas'),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.book),
                            title: Text(tasks[index].title),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
