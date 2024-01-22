import 'package:flutter/material.dart';
import 'package:homeline/conversationlist.dart';
import 'package:homeline/storyitem.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController _searchController = TextEditingController();

  List<String> imageurl = [
    "https://images1.wionews.com/images/wion/900x1600/2023/6/9/1686314317100_ChrisHemsworthh.jpg",
    "https://static.toiimg.com/thumb/msid-103526119,width-1280,resizemode-4/103526119.jpg",
    "https://static.toiimg.com/thumb/msid-93204620,width-1280,resizemode-4/93204620.jpg",
    "https://www.indiaherald.com/Assets/ArticleUpload/20224712533519_FPpfFTaVQAQUtn2.jpg",
    "https://indiadarpan.com/wp-content/plugins/phastpress/phast.php/c2VydmljZT1pbWFnZXMmc3JjPWh0dHBzJTNBJTJGJTJGaW5kaWFkYXJwYW4uY29tJTJGd3AtY29udGVudCUyRnVwbG9hZHMlMkYyMDIyJTJGMDklMkZGYWhhZC1GYXppbC5qcGcmY2FjaGVNYXJrZXI9MTY4NzQ1MTg1OC0yODc5NiZ0b2tlbj0zNzkyZjQxOGVmMGVmY2Jm.q.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    storyItem(imageurl[0], "Hemsworth"),
                    storyItem(imageurl[1], "SRK"),
                    storyItem(imageurl[2], "Mammootty"),
                    storyItem(imageurl[3], "Surya"),
                    storyItem(imageurl[4], "Fahad")
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Container(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                        onPressed: () => _searchController.clear(),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        )),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
              child: ListView(
                children: [
                  conversation(
                      imageurl[0], "Hemsworth", "How it been?", "7 AM", true),
                  conversation(
                      imageurl[1], "SRK", "Where are you?", "5 PM", false),
                  conversation(
                      imageurl[2], "Mammootty", "It's fine", "Yesterday", true),
                  conversation(
                      imageurl[3], "Surya", "Take care", "1'st Jul", true),
                  conversation(
                      imageurl[4], "Fahad", "I am going", "7'th Jul", false)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
