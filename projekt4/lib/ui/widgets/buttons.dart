import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projekt2/bloc/cubit/components_cubit.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: [
        ElevatedButton(
          onPressed: () => context.read<ComponentsCubit>().loadData(),
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
          onPressed: () => context.read<ComponentsCubit>().loadFromXML(),
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
        Container(
          width: 2,
          height: 30,
          color: Colors.blue,
        ),
        ElevatedButton(
          onPressed: () => context.read<ComponentsCubit>().loadFromDb(),
          child: const Text('Wczytaj dane z bazy danych'),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ComponentsCubit>().saveToDatabase();
            } else {
              showToaster(
                text: 'Popraw błędy w tabeli',
                duration: ToastDuration.short,
              );
            }
          },
          child: const Text('Zapisz dane do bazy danych'),
        ),
      ],
    );
  }
}
