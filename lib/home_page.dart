import 'package:example04/details.dart';
import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const people = [
  Person(name: 'John', age: 20, emoji: '🙋🏻‍♂️'),
  Person(name: 'Jane', age: 21, emoji: '👸🏽'),
  Person(name: 'Jack', age: 22, emoji: '🧔🏿‍♂️'),
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("People"),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(
                      person: people[index],
                    );
                  },
                ));
              },
              leading: Hero(
                  tag: people[index].name, child: Text(people[index].emoji)),
              title: Text(people[index].name),
              subtitle: Text("${people[index].age} Years old!"),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
        ));
  }
}
