import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _studentDeals = true;

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F7),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              controller: controller,
              children: [
                _buildFilterOption('Filter by Country', true),
                const SizedBox(height: 16),
                _buildFilterOption('Filter by Preference', false),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildFilterOption('Filter Student Exclusive Deals', _studentDeals, (val) {
                setState(() => _studentDeals = val);
              }),
              const SizedBox(height: 20),
              Expanded(child: _buildRestaurantCard()),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: _showFilterSheet,
                child: const Text("Show Filters"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, bool value, [Function(bool)? onChanged]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Switch(value: value, onChanged: onChanged ?? (val) {}),
      ],
    );
  }

  Widget _buildRestaurantCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://placehold.co/600x400/FFF/000?text=Ramen',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: const Column(
              children: [
                Text('Tokyo Ramen House', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Japanese • Japan', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

