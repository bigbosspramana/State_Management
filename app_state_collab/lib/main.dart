import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

/// Model untuk mengelola status
class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Pemberitahuan ke semua widget yang mendengarkan
  }

  void decrement() {
    _counter--;
    notifyListeners(); // Pemberitahuan ke semua widget yang mendengarkan
  }
}

/// Aplikasi Utama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inisialisasi model
    final counterModel = CounterModel();

    return ScopedModel<CounterModel>(
      model: counterModel,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Scoped Model Example')),
          body: Column(
            children: [
              Expanded(child: CounterDisplay()), // Menampilkan nilai counter
              CounterControls(), // Kontrol untuk increment & decrement
              AnotherWidget(), // Widget lain yang mengakses status
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget untuk Menampilkan Nilai Counter
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => Center(
        child: Text(
          'Counter Value: ${model.counter}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

/// Widget untuk Kontrol (Increment & Decrement)
class CounterControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: model.increment,
            child: Text('Increment'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: model.decrement,
            child: Text('Decrement'),
          ),
        ],
      ),
    );
  }
}

/// Widget Lain yang Mengakses Status
class AnotherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Another Widget sees Counter: ${model.counter}',
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ),
    );
  }
}
