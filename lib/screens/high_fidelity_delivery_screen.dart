import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityDeliveryScreen extends StatelessWidget {
  const HighFidelityDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          Image.asset(
            'assets/images/216_52.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Map markers
          const Positioned(
            top: 211,
            left: 170, // Centered approx.
            child: Icon(
              Icons.location_on,
              color: Color(0xFFC67C4E),
              size: 32,
            ),
          ),

          Positioned(
            top: 311,
            right: 110, // Approx position
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/I216_86_418_950.png',
                width: 24,
                height: 24,
              ),
            ),
          ),

          _buildTopBar(context),
          _buildBottomSheet(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: () {
                  context.pop();
                },
              ),
              _buildIconButton(
                icon: Icons.gps_fixed,
                onPressed: () {
                  // Handle GPS tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF2A2A2A)),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E3E3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '10 minutes left',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF242424),
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: const Color(0xFFA2A2A2),
                ),
                children: [
                  const TextSpan(text: 'Delivery to '),
                  TextSpan(
                    text: 'Jl. Kpg Sutoyo',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2A2A2A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildProgressBar(),
            const SizedBox(height: 16),
            _buildOrderStatusCard(),
            const SizedBox(height: 16),
            _buildDriverInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 8),
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 8),
        _buildProgressSegment(isActive: true),
        const SizedBox(width: 8),
        _buildProgressSegment(isActive: false),
      ],
    );
  }

  Widget _buildProgressSegment({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF35C07E) : const Color(0xFFE3E3E3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildOrderStatusCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE3E3E3)),
            ),
            child: Image.asset(
              'assets/images/I216_65_418_950.png',
              width: 28,
              height: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivered your order',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'We will deliver your goods to you in the shortest possible time.',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFA2A2A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'assets/images/216_57.png',
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brooklyn Simmons',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Personal Courier',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: const Color(0xFFA2A2A2),
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Handle call tap
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE3E3E3)),
            ),
            child: const Icon(Icons.call_outlined, color: Color(0xFF2A2A2A)),
          ),
        ),
      ],
    );
  }
}