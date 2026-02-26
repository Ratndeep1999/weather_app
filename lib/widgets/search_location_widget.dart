import 'package:flutter/material.dart';
import 'package:weather_app/commons/text_styles.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({
    super.key,
    required this.searchController,
    required this.isNight,
  });

  final TextEditingController searchController;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint("Search Location got"),
      child: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        style: TextStyles.alegreyaSansBold,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hint: Text("Search Location", style: TextStyles.alegreyaSansBold),
          filled: true,
          fillColor: isNight ? Color(0xFF0c3a8a) : Color(0xFF278dc4),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          isDense: false,
        ),
      ),
    );
  }
}
