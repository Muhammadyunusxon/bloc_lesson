import 'package:bloc_lesson/validate/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validate Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text("Username"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocConsumer<ValidateCubit, ValidateState>(
              buildWhen: (prev, current) {
                return prev.isTrue != current.isTrue;
              },
              builder: (context, state) {
                return !state.isTrue
                    ? const Text("Error")
                    : const SizedBox.shrink();
              },
              listenWhen: (prev, current) {
                return current.isTrue;
              },
              listener: (context, state) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Awesome Snackbar!'),
                    action: SnackBarAction(
                      label: 'Well done',
                      onPressed: () {},
                    ),
                  ),
                );
              },

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ValidateCubit>().check(_controller?.text);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
