import 'package:flutter/material.dart';
// To access kPrimaryOrange

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F7),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Logo
                Row(
                  children: [
                    const Icon(Icons.public, color: Colors.black54, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      'GlobeGrub',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                
                // 2. Main Text Content
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5EA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Authentic Food from Your Home Country',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Connecting international students in Australia with the flavors of home. Discover restaurants serving traditional cuisine from around the world.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black54,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),

                // 3. "Hop In!" Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next screen
                    },
                    child: const Text('Hop In!'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}