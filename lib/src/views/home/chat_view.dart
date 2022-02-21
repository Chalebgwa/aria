import 'dart:math';

import 'package:aria/src/constants.dart';
import 'package:aria/src/painters.dart';
import 'package:aria/src/views/home/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  static const String routeName = "/chat";

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _user = const types.User(
    id: '06c33e8b-e835-4736-80f4-63f44b66666c',
  );
  int? _page;

  void resetPage() {
    setState(() {
      _page = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          floatingActionButton: !checkDeskTop(context)
              ? FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(FontAwesomeIcons.envelope),
                )
              : null,
          body: Row(
            children: [
              _buildChatsList(context, size),
              if (checkDeskTop(context))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildChatPage(),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }

  ChatPage _buildChatPage() {
    return ChatPage(
      username: _page.toString(),
      callback: resetPage,
    );
  }

  SizedBox _buildChatsList(BuildContext context, Size size) {
    return SizedBox(
      width: checkDeskTop(context) ? 100.w : 360.w,
      child: !checkDeskTop(context) && _page != null
          ? ChatPage(username: _page.toString(), callback: resetPage)
          : Stack(
              children: [
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/bg.jpg",
                            ),
                          ),
                        ),
                        width: size.width,
                        //height: 200.h,
                        child: Container(
                          color: Colors.black.withOpacity(.4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.arrowLeft),
                                    color: Colors.white,
                                    iconSize: 20.sp,
                                  ),
                                  Spacer(),
                                  Badge(
                                    badgeContent: const Text(
                                      "1",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    badgeColor: Theme.of(context).primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.solidEnvelope,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: checkDeskTop(context) ? 10.w : 30.w,
                                  ),
                                  Badge(
                                    badgeContent: const Text(
                                      "1",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    badgeColor: Theme.of(context).primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.globeAfrica,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: checkDeskTop(context) ? 5.w : 20.w,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Text(
                                      "Messages",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: !checkDeskTop(context)
                                            ? 30.sp
                                            : 10.w,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 16.h,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Search Messages",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverAnimatedList(
                      initialItemCount: 13,
                      itemBuilder: (c, i, a) {
                        return _buildMessageItem(a, i);
                      },
                    )
                  ],
                )
              ],
            ),
    );
  }

  SizeTransition _buildMessageItem(Animation<double> a, int i) {
    return SizeTransition(
      sizeFactor: a,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          splashColor: Colors.green.shade100,
          onTap: () {
            setState(() {
              _page = i;
            });
          },
          child: ListTile(
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  i % 2 == 1
                      ? FontAwesomeIcons.envelopeOpen
                      : FontAwesomeIcons.envelope,
                  size: 10.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "10:30",
                  style: TextStyle(
                    fontSize: 6.sp,
                  ),
                ),
              ],
            ),
            //tileColor: Colors.red,
            subtitle: const Text("Hello"),
            //horizontalTitleGap: 0.w,
            //minLeadingWidth: 0.w,
            // contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: checkDeskTop(context) ? 10.w : 30.w,
              backgroundColor: Colors.green,
              child: const Icon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
            ),
            title: Text("$i"),
          ),
        ),
      ),
    );
  }
}
