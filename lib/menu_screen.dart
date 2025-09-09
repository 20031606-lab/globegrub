import 'package:flutter/material.dart';
import 'main.dart'; // To access kPrimaryOrange

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFF2F2F7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filters',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryOrange,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterChip('Vegan Only', true),
                _buildFilterChip('Halal Only', false),
              ],
            ),
            const SizedBox(height: 16),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterChip('Vegetarian Only', false),
                _buildFilterChip('Non-Veg Only', true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: kPrimaryOrange,
          shadows: [
            const Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(50, 0, 0, 0),
            ),
          ],
        );
    
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFilterSheet(context),
        backgroundColor: kPrimaryOrange,
        child: const Icon(Icons.filter_list, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Menu', style: titleStyle),
                  Container(
                    width: 30, height: 30,
                    decoration: const BoxDecoration(
                      color: kPrimaryOrange,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              _buildMenuItem(context, 'Butter Chicken'),
              const SizedBox(height: 16),
              _buildMenuItem(context, 'Paneer Tikka'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://placehold.co/80x80/FFF/000?text=Food',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kPrimaryOrange, width: 2),
            color: isSelected ? kPrimaryOrange.withOpacity(0.2) : Colors.transparent,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: kPrimaryOrange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
