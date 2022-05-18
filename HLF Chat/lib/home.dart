import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hlfchat/chat_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:hlfchat/themes/text_theme.dart';

import 'models/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final clientID = 'Jobin';

  List<bool> bottomNav = [true, false, false, false];
  List<User1> users = [
    User1(name: 'Jeffin', isOnline: false, messages: [
      Message(
        content: 'Hi',
        timestamp: DateTime.utc(2022, 1, 1, 12, 40),
        isMe: true,
      ),
      Message(
        content: 'Hello',
        timestamp: DateTime.utc(2022, 1, 1, 12, 41),
        isMe: false,
      ),
    ]),
    User1(name: 'Navaneeth', isOnline: true, messages: [
      Message(
        content: 'Hi',
        timestamp: DateTime.utc(2022, 1, 1, 12, 40),
        isMe: true,
      ),
      Message(
        content: 'Hello',
        timestamp: DateTime.utc(2022, 1, 1, 12, 41),
        isMe: false,
      ),
    ]),
    User1(name: 'Alan', isOnline: true, messages: [
      Message(
        content: 'Hi',
        timestamp: DateTime.utc(2022, 1, 1, 12, 40),
        isMe: true,
      ),
      Message(
        content: 'Hello',
        timestamp: DateTime.utc(2022, 1, 1, 12, 41),
        isMe: false,
      ),
    ]),
  ];
  final IO.Socket socket = IO.io(
      'http://172.16.3.81:3001',
      IO.OptionBuilder()
          .setTransports(['websocket']).setQuery({'chatID': 'Jobin'}).build());

  socketInit() {
    print("Socket init");

    // socket.connect();
    socket.onConnect((_) {
      print('connect');
      socket.emit('message', {
        'message': 'Connected to client device : $clientID',
      });
    });
    socket.onConnectError((data) {
      print('connect error ${data}');
    });
    socket.on('receive_message', (jsonData) {
      var data = jsonData as Map<String, dynamic>;
      // Map<dynamic, dynamic> data = json.decode(jsonData as String);
      print(data);
    });

    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  @override
  void initState() {
    socketInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: HLFTextTheme.kSubHeadTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
              radius: 18,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChatListHeader(
              user: users[0],
              socket: socket,
            ),
            ChatListHeader(
              user: users[1],
              socket: socket,
            ),
            ChatListHeader(
              user: users[2],
              socket: socket,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 38, vertical: 5),
        height: 52,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  bottomNav = [true, false, false, false];
                });
              },
              icon: Image.asset(
                'assets/icons/chat.png',
                color: bottomNav[0] ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  bottomNav = [false, true, false, false];
                });
              },
              icon: Image.asset(
                'assets/icons/phone.png',
                color: bottomNav[1] ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  bottomNav = [false, false, true, false];
                });
              },
              icon: Image.asset(
                'assets/icons/user.png',
                color: bottomNav[2] ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  bottomNav = [false, false, false, true];
                });
              },
              icon: Image.asset(
                'assets/icons/settings.png',
                color: bottomNav[3] ? Colors.black : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatListHeader extends StatelessWidget {
  final User1? user;
  final IO.Socket? socket;
  const ChatListHeader({
    Key? key,
    this.user,
    this.socket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => ChatScreen(
                  user: user,
                  socket: socket,
                ),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(14),
            height: 75,
            width: Get.width * 0.94,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 236, 241),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 25,
                ),
                Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user!.name!,
                        style: HLFTextTheme.kNameTextStyle,
                      ),
                      SizedBox(height: 3),
                      Text(
                        'You: Okay',
                        style: HLFTextTheme.kStatusTextStyle,
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '04:25 PM',
                      style: HLFTextTheme.kTimeTextStyle,
                    ),
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: user!.isOnline! ? Colors.green : Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
