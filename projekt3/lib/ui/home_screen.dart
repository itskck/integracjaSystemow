import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projekt2/bloc/cubit/components_cubit.dart';
import 'package:projekt2/bloc/cubit/components_state.dart';
import 'package:projekt2/ui/widgets/headers.dart';
import 'package:projekt2/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              context.read<ComponentsCubit>().loadData(),
                          child: const Text('Wczytaj dane z pliku TXT'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<ComponentsCubit>().saveData();
                            } else {
                              showToaster(
                                text: 'Popraw błędy w tabeli',
                                duration: ToastDuration.short,
                              );
                            }
                          },
                          child: const Text('Zapisz dane do pliku txt'),
                        ),
                        Container(
                          width: 2,
                          height: 30,
                          color: Colors.blue,
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<ComponentsCubit>().loadFromXML(),
                          child: const Text('Wczytaj dane z pliku XML'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<ComponentsCubit>().saveAsXml();
                            } else {
                              showToaster(
                                text: 'Popraw błędy w tabeli',
                                duration: ToastDuration.short,
                              );
                            }
                          },
                          child: const Text('Zapisz dane do pliku XML'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ComponentsCubit, ComponentsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        loading: (_) => const Center(
                          child: SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(),
                          ),
                        ),
                        orElse: () => const SizedBox(),
                        loaded: (value) {
                          return Scrollbar(
                            child: Column(
                              children: [
                                const Headers(),
                                ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.componentsList.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    List<String> row = value.componentsList[i]
                                        .split(';')
                                      ..removeLast();
                                    int count = 0;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          for (var element in row)
                                            Builder(builder: (context) {
                                              final bool numberValidation =
                                                  count == 6 || count == 7;

                                              TextEditingController controller =
                                                  value.controllers[
                                                      15 * i + count];
                                              count++;

                                              return SizedBox(
                                                height: 50,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    errorStyle: TextStyle(
                                                      fontSize: 8,
                                                    ),
                                                  ),
                                                  validator: (text) {
                                                    if (numberValidation) {
                                                      if (text == null) {
                                                        return 'pole nie może być puste';
                                                      } else if (!isNumeric(
                                                          text)) {
                                                        return 'pole musi być liczbą całkowitą';
                                                      } else {
                                                        return null;
                                                      }
                                                    } else {
                                                      if (text == null ||
                                                          text.length < 2) {
                                                        return 'pole musi mieć więcej niż 2 znaki';
                                                      } else {
                                                        return null;
                                                      }
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  controller: controller,
                                                ),
                                              );
                                            }),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
