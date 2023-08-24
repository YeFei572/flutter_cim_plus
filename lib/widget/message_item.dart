import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/widget/net_image_cached.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.chatRecord,
    required this.isOwn,
  }) : super(key: key);

  final ChatRecord chatRecord;
  final bool isOwn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        textDirection: isOwn ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: isOwn ? Colors.blue : Colors.white30,
          //   ),
          // ),
          CircleAvatar(
            child: chatRecord.fromAvatar == null
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                : netImageCached(chatRecord.fromAvatar!),
          ),
          const SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isOwn ? Colors.blue : Colors.white30,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              chatRecord.content ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // const SizedBox(width: 40),
        ],
      ),
    );
  }
}
