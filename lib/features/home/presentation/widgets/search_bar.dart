import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {  // Ensure this name matches
  final String searchText;  // Ensure this parameter is defined

  const CustomSearchBar({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Search clicked!"),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Search for $searchText...',  // Using searchText here
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
