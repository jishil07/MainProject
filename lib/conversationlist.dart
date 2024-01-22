import 'package:flutter/material.dart';

Widget conversation(
    String url, String name, String message, String time, bool messageSeen) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(url),
            radius: 25.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(time),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text(message)),
                    if (messageSeen)
                      Icon(
                        Icons.check_circle,
                        size: 16.0,
                        color: Colors.green,
                      ),
                    if (!messageSeen)
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                        size: 16.0,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
