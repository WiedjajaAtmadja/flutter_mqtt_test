import 'package:flutter/material.dart';
import 'textfield_button.dart';
import 'leds_switch.dart';

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
  var fLedGreen = false;
  var fLedBlue = false;
  List listMessages = [
    'Message 1',
    'Message 2',
    'Message 3',
  ];

  void mqttSend() {
    debugPrint('Publish: ${textMsgToSend.text}');
  }

  void onLedRedChanged(bool value) {
    setState(() {
      fLedRed = value;
    });
    debugPrint('onLedRedChanged: $fLedRed');
  }

  void onLedGreenChanged(bool value) {
    setState(() {
      fLedGreen = value;
    });
    debugPrint('onLedGreenChanged: $fLedGreen');
  }

  void onLedBlueChanged(bool value) {
    setState(() {
      fLedBlue = value;
    });
    debugPrint('onLedBlueChanged: $fLedBlue');
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
              TextFieldButton(
                  textController: textMQTTBroker,
                  onPressed: () {
                    debugPrint('Connect to ${textMQTTBroker.text}');
                  },
                  hintText: 'MQTT Broker',
                  textButton: 'Connect'),
              const SizedBox(height: 10),
              TextFieldButton(
                  textController: textMsgToSend,
                  onPressed: () {
                    debugPrint('Send to ${textMsgToSend.text}');
                  },
                  hintText: 'MQTT Message',
                  textButton: 'Publish'),
              const SizedBox(height: 10),
              Row(
                children: [
                  LedSwitch(
                      text: 'Red',
                      value: fLedRed,
                      color: Colors.red,
                      onChanged: onLedRedChanged),
                  LedSwitch(
                      text: 'Green',
                      value: fLedGreen,
                      color: Colors.green,
                      onChanged: onLedGreenChanged),
                  LedSwitch(
                      text: 'Blue',
                      value: fLedBlue,
                      color: Colors.blue,
                      onChanged: onLedBlueChanged),
                ],
              ),
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
