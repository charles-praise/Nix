import 'package:web_socket_channel/io.dart';
import 'widget/chat_widgets.dart';

import '../../export.dart';

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
    List names = <String>['john', 'rita', 'Brad', 'dan'];

    final friends = List<Friend>.generate(
      names.length,
      (index) => Friend(
          names[index], Assets.avatars[0], 'Hello, how are you?', '1 hr.'),
    );
    final messages = List.generate(
        friends.length, (index) => messagesWidget(context, friends[index]));
    final ureadMessage = List.generate(friends.length,
        (index) => unreadMessagesWidget(context, friends[index], '5'));
    final missedCall = List.generate(
        friends.length, (index) => missedCallsWidget(friends[index]));

    SingleChildScrollView allMessages() => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages,
            ),
          ),
        );
    SingleChildScrollView unreadMessages() => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ureadMessage,
            ),
          ),
        );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shoplax',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: ButtonsTabBar(
            unselectedBorderColor: Colors.transparent,
            borderColor: Colors.white,
            borderWidth: 1,
            backgroundColor: Colors.green.shade200,
            unselectedBackgroundColor: Colors.grey.shade200,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelSpacing: 5,
            tabs: const [
              Tab(icon: Icon(Icons.message_sharp), text: 'Messages'),
              Tab(
                  icon: Icon(Icons.notifications_none_outlined),
                  text: 'Unread Messages'),
            ],
          ),
          actions: [const Icon(Icons.menu), SizedBox(width: 12.w)],
        ),
        body: TabBarView(
          children: [
            allMessages(),
            unreadMessages(),
          ],
        ),
      ),
    );
  }
}
