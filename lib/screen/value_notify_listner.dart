import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  //acts as a provider
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  //2.for textforfield
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Column(
        children: [


         ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return  TextFormField(
            obscureText: toggle.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffix: InkWell(
                  onTap: () {
                    toggle.value = !toggle.value;
                  },
                  child: Icon(
                    toggle.value 
                    ?  Icons.visibility_off_outlined 
                    :  Icons.visibility,
                    )),
            ),
          );
              },
            ),

         
          Center(
            // acts like a consumer e.g in provider
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
