import 'package:flutter/material.dart';
import 'main.dart'; // To access kPrimaryOrange

class PreviousOrdersScreen extends StatelessWidget {
  const PreviousOrdersScreen({super.key});

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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F7),
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1. Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Previous Orders', style: titleStyle),
                  Container(
                    width: 30, height: 30,
                    decoration: const BoxDecoration(
                      color: kPrimaryOrange,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              
              // 2. Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Show All Results', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Switch(value: true, onChanged: (val){}),
                ],
              ),

              // 3. Order Item
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://placehold.co/100x100/FFF/000?text=Ramen',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tokyo Ramen House', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 8),
                        Text('Soya Ramen', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),

              // 4. Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: const Text('Order Again'))
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Remove History'))
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
