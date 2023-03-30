import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert' as convert;

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    final _zipController = TextEditingController();
    final _addressController = TextEditingController();
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
                  child: TextFormField(
                    controller: _zipController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    http.Response response = await http.get(
                      Uri.https('zipcloud.ibsnet.co.jp', '/api/search',
                          {'zipcode': _zipController.text}),
                    );
                    print(response.body);

                    //inspect(response.body);
                    Map<String, dynamic> jsonResponse =
                        convert.jsonDecode(response.body)['results'][0];
                    print(jsonResponse);
                    _addressController.text =
                        '${jsonResponse['address1']}${jsonResponse['address2']}${jsonResponse['address3']}';
                    // print(jsonResponse);
                  },
                  child: const Text('検索'),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _addressController,
            ),
          ],
        ),
      ),
    );
  }
}
