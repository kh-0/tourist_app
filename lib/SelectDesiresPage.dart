import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/Home.dart';

enum ExerciseFilter { walking, running, cycling, hiking }

class SelectDesiresPage extends StatelessWidget {
  const SelectDesiresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          appBar: AppBar(
            title: Text(''),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
          drawer: Drawer(),
          body: const FilterChipExample(),
        ));
  }
}

class FilterChipExample extends StatefulWidget {
  const FilterChipExample({super.key});

  @override
  State<FilterChipExample> createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Choose the tourism desires that you prefer",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 70),
          Wrap(
            spacing: 5.0,
            children: ExerciseFilter.values.map((ExerciseFilter exercise) {
              return FilterChip(
                label: Text(exercise.name),
                selected: filters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          Text(
            'You chose it: ${filters.map((ExerciseFilter e) => e.name).join(', ')}',
            style: textTheme.labelLarge,
          ),
          MaterialButton(
              elevation: 5.0,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: const Text(
                'Select and sing in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              }),
        ],
      ),
    );
  }
}
