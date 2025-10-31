import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/productProvider.dart';

class ProductSearchBar extends StatefulWidget {
  @override
  _ProductSearchBarState createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // Optionally pre-populate with provider.searchQuery if you want retained value
    final provider = context.read<ProductProvider>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductProvider>();

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            // provider.clearSearch();
            // setState(() {}); // update suffixIcon state
          },
        )
            : null,
      ),
      onChanged: (q) {
        // provider.searchProducts(q);
        // setState(() {}); // to show/hide clear icon
      },
    );
  }
}