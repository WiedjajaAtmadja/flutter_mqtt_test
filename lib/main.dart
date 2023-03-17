import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final textMsgToSend = TextEditingController()..text = 'Hello World';
  final textMQTTBroker = TextEditingController()..text = 'broker.emqx.io';
  var fLedRed = false;
  List listMessages = [
    'Message 1',
    'Message 2',
    'Message 3',
  ];

  void mqttSend() {
    debugPrint('Publish: ${textMsgToSend.text}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('MQTT Client')),
        body: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(children: [
                SizedBox(
                    width: 280,
                    child: TextField(
                        controller: textMQTTBroker,
                        decoration: const InputDecoration(
                          hintText: 'MQTT Broker',
                          border: OutlineInputBorder(),
                        ))),
                TextButton(
                    onPressed: () {
                      debugPrint('Connect to ${textMQTTBroker.text}');
                    },
                    child: const Text("Connect"))
              ]),
              const SizedBox(height: 10),
              Row(children: [
                SizedBox(
                    width: 280,
                    child: TextField(
                        controller: textMsgToSend,
                        decoration: const InputDecoration(
                          hintText: 'Message',
                          border: OutlineInputBorder(),
                        ))),
                TextButton(
                    onPressed: () {
                      debugPrint('publish to ${textMsgToSend.text}');
                    },
                    child: const Text("Publish"))
              ]),
              Row(children: [
                const Text("Led Red"),
                Switch(
                  value: fLedRed,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      fLedRed = value;
                    });
                    debugPrint('Led Red: $value');
                  },
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () {}, child: const Text("Subscribe")),
                  TextButton(
                      onPressed: () {}, child: const Text("Unsubscribe")),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                      itemCount: listMessages.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Text(listMessages[index]),
                          const Divider()
                        ]);
                        // return ListTile(title: Text(listMessages[index]));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
