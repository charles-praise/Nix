import '../../../export.dart';

// ---- unread Messages Widget --------
GestureDetector unreadMessagesWidget(Friend friend, String messageCount) =>
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF565973), width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              // ------- User Image ------
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
                child: SizedBox(
                  height: 50,
                  width: 60,
                  child: Ink(
                    width: 37.0,
                    height: 37.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage(friend.image), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

              ///
              ///
              /// Name and previous message widget
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          friend.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          friend.msgTime,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      friend.message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              ///
              ///
              ///
              /// Call and Video iconButton
              Row(
                children: <Widget>[
                  Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                          child: Text(
                        messageCount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
//
//
//

// ------ Missed Calls Widget -------
GestureDetector missedCallsWidget(
  Friend friend,
) =>
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF565973), width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              // ------- User Image ------
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
                child: SizedBox(
                  height: 70,
                  width: 90,
                  child: Ink(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage(friend.image), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

              ///
              ///
              /// Name and previous message widget
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          friend.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          friend.msgTime,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      friend.message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              ///
              ///
              ///
              /// Call and Video iconButton
              Row(
                children: <Widget>[
                  Container(
                    width: 42.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.call_missed),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
//
//
// ---- All Messages widget ------
GestureDetector messagesWidget(
  Friend friend,
) =>
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF565973), width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              // ------- User Image ------
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
                child: SizedBox(
                  height: 50,
                  width: 60,
                  child: Ink(
                    width: 37.0,
                    height: 37.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage(friend.image), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

              ///
              ///
              /// Name and previous message widget
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          friend.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          friend.msgTime,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      friend.message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              ///
              ///
              ///
              /// Call and Video iconButton
              Row(
                children: <Widget>[
                  Container(
                    width: 42.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    // child: IconButton(
                    //   color: Colors.black,
                    //   icon: const Icon(Icons.call),
                    //   onPressed: () {},
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
