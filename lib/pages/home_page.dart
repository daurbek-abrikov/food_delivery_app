import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    // В большинстве случаев Scaffold используется,
    // как корневой виджет для страницы или экрана
    // Scaffold позволяет вам указать AppBar, BottomNavigationBar,
    // Drawer, FloatingActionButton и другие не менее важные
    // компоненты (виджеты).
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
        child: AnimatedSwitcher(duration: const Duration(milliseconds: 900), reverseDuration: const Duration(milliseconds: 0), child: Text(
          "$_counter",
          key: ValueKey<int>(_counter),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      )
        
      ),
      floatingActionButton: FloatingActionButton(
        // указываем иконку
        // Flutter предлагает нам большой спектр встроенных иконок
        child: Icon(Icons.animation),
        onPressed: () {
          // наконец то мы дошли до функции setState
          // которая даст сигнал, что пора перерисовывать 
          // наши виджеты. 
          // здесь мы просто увеличиваем наш счетчик
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}