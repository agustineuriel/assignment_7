import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int firstNum = 0;
  int secondNum = 0;
  int result = 0;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  void _performOperation(String operation) {
    setState(() {
      switch (operation) {
        case '+':
          result = firstNum + secondNum;
          break;
        case '-':
          result = firstNum - secondNum;
          break;
        case '*':
          result = firstNum * secondNum;
          break;
        case '/':
          if (secondNum != 0) {
            result = firstNum ~/ secondNum;
          } else {
            result = 0; // Handle division by zero
          }
          break;
      }
    });
  }

  void _clearInput() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
      firstNum = 0;
      secondNum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: secondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _performOperation('+'),
              ),
            ],
          ),

          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: secondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => _performOperation('-'),
              ),
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: secondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => _performOperation('*'),
              ),
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: secondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $result'),
              IconButton(
                icon: const Icon(Icons.horizontal_rule), // Corrected Icon
                onPressed: () => _performOperation('/'),
              ),
            ],
          ),

          // Clear Button
          ElevatedButton(
            onPressed: _clearInput,
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
