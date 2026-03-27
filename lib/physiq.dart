import 'package:flutter/material.dart';
// Ensure these imports match your actual filenames exactly
import 'package:just_ascend/looksmax.dart';
import 'package:just_ascend/mindmax.dart';
import 'package:just_ascend/healthmax.dart';

class PhysiqScreen extends StatelessWidget {
  const PhysiqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Adding an AppBar allows users to go back to the Home/AscendHome screen
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Header
            const Center(
              child: Text(
                'PHYSIQ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Staggered Tags Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildTag('Bodyweight Mastery', Alignment.centerLeft),
                  const SizedBox(height: 15),
                  _buildTag('Strength & Hypertrophy', Alignment.centerRight),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTag('Personalize Programs', Alignment.centerLeft),
                      _buildTag('Cardio', Alignment.centerRight),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildTag('Mike Mentzer Method', Alignment.centerRight),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Progress Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Progress',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LinearProgressIndicator(
                value: 0.1, // 10% progress
                backgroundColor: Colors.grey.shade100,
                color: Colors.blue,
                minHeight: 4,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Status...', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),

            const Spacer(),

            // Custom Bottom Navigation Bar - Passing context here
            _buildBottomNav(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper for the gray bubbles
  Widget _buildTag(String label, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // Updated Bottom Nav with context support
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(context, 'PHYSIQ', const PhysiqScreen(), isActive: true),
          _navItem(context, 'LOOKSMAX', const LooksmaxScreen(), isActive: false),
          _navItem(context, 'MINDMAX', const MindmaxScreen(), isActive: false),
          _navItem(context, 'HEALTHMAX', const HealthmaxScreen(), isActive: false),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, String label, Widget destination, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => destination,
              transitionDuration: Duration.zero, // Instant switch
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.blue : Colors.black54,
          ),
        ),
      ),
    );
  }
}