import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('検索'),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
