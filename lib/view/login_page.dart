import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulppy/counter_cubit.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      body: SingleChildScrollView(
        child: Container(margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<CounterCubit,CounterState>(builder: (context,state){
                if(state.counterValue == 5){
                  return Text('wow its 5 buddy ${state.counterValue}',);
                }else if(state.counterValue.isEven){
                  return Text("it is even ${state.counterValue}");
                }else{
                  return Text("its odd${state.counterValue}");
                }
              }, listener: (context,state){
                if(state.wasIncremented == true){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('incremented')));
                }else if(state.wasIncremented==false){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('decremented')));
                }
              }),
              const SizedBox(height: 20,),
              FloatingActionButton(
                  heroTag: 1,
                  child: const Icon(Icons.plus_one),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  }),
              const SizedBox(height: 20,),
              FloatingActionButton(
                  heroTag: 2,
                  child: const Icon(Icons.exposure_minus_1),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
