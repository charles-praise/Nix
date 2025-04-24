import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController messageController = TextEditingController();
  late IOWebSocketChannel channel;
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // Connect to FastAPI WebSocket
    channel = IOWebSocketChannel.connect("ws://localhost:8000/ws");

    // Listen for messages
    channel.stream.listen((message) {
      setState(() {
        messages.add(message);
      });
    });
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      channel.sink.add(messageController.text);
      messageController.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: messageController,
                        decoration:
                            InputDecoration(hintText: "Enter message"))),
                IconButton(icon: Icon(Icons.send), onPressed: sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
