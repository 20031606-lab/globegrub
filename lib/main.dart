import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';

// A constant for our primary orange color for reusability
const kPrimaryOrange = Color(0xFFF97316);

  void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlobeGrub',
      theme: ThemeData(
        // Set the primary and scaffold colors to match the design
        primaryColor: kPrimaryOrange,
        scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Dark background
        
        // Use Google Fonts for a modern look.
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

        // Custom theme for the toggle switches (Switch)
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(kPrimaryOrange),
          trackColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? kPrimaryOrange.withOpacity(0.5)
                : Colors.grey.shade600;
          }),
        ),

        // Custom theme for filled buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryOrange,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),

        // Custom theme for outlined buttons
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
             foregroundColor: Colors.black,
             side: const BorderSide(color: Colors.black54, width: 2),
             textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
             ),
             shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
             ),
             padding: const EdgeInsets.symmetric(vertical: 16),
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}