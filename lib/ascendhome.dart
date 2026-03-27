import 'package:flutter/material.dart';
import 'package:just_ascend/physiq.dart';
import 'package:just_ascend/looksmax.dart';
import 'package:just_ascend/mindmax.dart';
import 'package:just_ascend/healthmax.dart';


class AscendHome extends StatelessWidget {
  const AscendHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Header Title
            const Text(
              'JUST ASCEND+',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            
            // Interactive Buttons List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    _buildAscendButton('PHYSIQ', context),
                    _buildAscendButton('LOOKSMAX', context),
                    _buildAscendButton('MINDMAX', context),
                    _buildAscendButton('HEALTHMAX', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build the clickable feature buttons
  Widget _buildAscendButton(String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // This logic handles the click and redirects to the correct screen
        if (label == 'PHYSIQ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhysiqScreen()),
          );
        } else if (label == 'LOOKSMAX') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LooksmaxScreen()),
          );
        } else if (label == 'MINDMAX') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MindmaxScreen()),
          );
        } else if (label == 'HEALTHMAX') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HealthmaxScreen()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          // Subtle shadow for the "Neumorphic" look
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}