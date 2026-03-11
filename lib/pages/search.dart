import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _semuaItem = [
    'Flutter',
    'Dart',
    'Android',
    'iOS',
    'Material Design',
    'Widget',
    'State Management',
    'Navigation',
  ];
  List<String> _hasil = [];

  void _cari(String query) {
    setState(() {
      _hasil = query.isEmpty
          ? []
          : _semuaItem
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cari',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              onChanged: _cari,
              decoration: InputDecoration(
                hintText: 'Ketik sesuatu...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _controller.text.isEmpty
                  ? const Center(
                      child: Text(
                        'Mulai ketik untuk mencari',
                        style: TextStyle(color: Colors.black38),
                      ),
                    )
                  : _hasil.isEmpty
                      ? const Center(
                          child: Text(
                            'Tidak ditemukan',
                            style: TextStyle(color: Colors.black38),
                          ),
                        )
                      : ListView.separated(
                          itemCount: _hasil.length,
                          separatorBuilder: (_, __) =>
                              const Divider(height: 1),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.label_outline,
                                  color: Colors.indigo),
                              title: Text(_hasil[index]),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
