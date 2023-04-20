import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projekt2/bloc/cubit/components_cubit.dart';
import 'package:projekt2/bloc/cubit/components_state.dart';
import 'package:projekt2/data/db.dart';
import 'package:projekt2/ui/widgets/buttons.dart';
import 'package:projekt2/ui/widgets/headers.dart';
import 'package:projekt2/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  List<Color> colors = [];
  final grey = const Color.fromARGB(255, 214, 214, 214);
  final red = const Color.fromARGB(255, 202, 113, 106);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ComponentsCubit, ComponentsState>(
      listener: (context, state) {
        colors = context.read<ComponentsCubit>().state.map(
              initial: (_) => [],
              loading: (_) => [],
              loaded: (loadedState) {
                print(loadedState.isRed);
                return List.generate(
                  loadedState.componentsList.length * 15,
                  (index) => loadedState.isRed[index ~/ 15] ? red : grey,
                  growable: true,
                );
              },
            );
      },
      child: Scaffold(
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
                        child: Buttons(
                          formKey: formKey,
                        )),
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
                          loaded: (loadedState) {
                            return Scrollbar(
                              child: Column(
                                children: [
                                  const Headers(),
                                  ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        loadedState.componentsList.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      List<String> row = loadedState
                                          .componentsList[i]
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
                                                int currentIndex =
                                                    15 * i + count;
                                                TextEditingController
                                                    controller =
                                                    loadedState.controllers[
                                                        15 * i + count];
                                                String textFromState =
                                                    state.map(
                                                  initial: (_) => '',
                                                  loading: (_) => '',
                                                  loaded: (s) => s
                                                      .componentsList[i]
                                                      .split(';')[count],
                                                );

                                                count++;

                                                return SizedBox(
                                                  height: 50,
                                                  width: 100,
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      if (value !=
                                                          textFromState) {
                                                        setState(() {
                                                          colors.replaceRange(
                                                            currentIndex ~/
                                                                15 *
                                                                15,
                                                            currentIndex ~/
                                                                    15 *
                                                                    15 +
                                                                15,
                                                            List.generate(
                                                                15,
                                                                (index) =>
                                                                    Colors
                                                                        .white),
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          colors.replaceRange(
                                                            currentIndex ~/
                                                                15 *
                                                                15,
                                                            currentIndex ~/
                                                                    15 *
                                                                    15 +
                                                                15,
                                                            List.generate(
                                                                15,
                                                                (index) => colors[
                                                                    currentIndex] = loadedState
                                                                            .isRed[
                                                                        currentIndex ~/
                                                                            15]
                                                                    ? red
                                                                    : grey),
                                                          );
                                                        });
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                      fillColor:
                                                          colors[currentIndex],
                                                      filled: true,
                                                      errorStyle:
                                                          const TextStyle(
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final db = MyDatabase();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DriftDbViewer(db),
                            ),
                          );
                        },
                        child: const Text('Baza danych'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<ComponentsCubit>().reset(),
                        child: const Text('Reset'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
