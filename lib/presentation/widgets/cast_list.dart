import 'package:flutter/material.dart';

class CastList extends StatefulWidget {
  final List castList;

  const CastList({super.key, required this.castList});

  @override
  State<CastList> createState() => _CastListState();
}

class _CastListState extends State<CastList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.castList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150,
            child: ListTile(
              title: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade400,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  maxLines: 2,
                  widget.castList[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF20224D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
