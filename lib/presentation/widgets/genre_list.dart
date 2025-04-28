import 'package:flutter/material.dart';

class GenreList extends StatefulWidget {
  final List genres;
  const GenreList({super.key, required this.genres});

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.genres.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Chip(
              label: Text(
                widget.genres[index],
                style: const TextStyle(
                  color: Color(0xFF20224D),
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.white,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Color(0xFFBCC0CD),
                  width: 1,
                ),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}
