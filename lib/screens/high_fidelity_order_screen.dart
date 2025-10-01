import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOrderScreen extends StatefulWidget {
  const HighFidelityOrderScreen({super.key});

  @override
  State<HighFidelityOrderScreen> createState() =>
      _HighFidelityOrderScreenState();
}

enum OrderType { deliver, pickup }

class _HighFidelityOrderScreenState extends State<HighFidelityOrderScreen> {
  OrderType _selectedType = OrderType.deliver;
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildOrderTypeSelector(),
                  const SizedBox(height: 24),
                  _buildDeliveryAddress(),
                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFFE3E3E3), height: 1),
                  const SizedBox(height: 20),
                  _buildCheckoutItem(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 4,
              color: const Color(0xFFF4EDE8),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDiscountCard(),
                  const SizedBox(height: 20),
                  _buildPaymentSummary(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildPaymentFooter(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2F2D2C)),
      ),
      title: Text(
        'Order',
        style: GoogleFonts.sora(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2F2D2C),
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildOrderTypeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _buildTypeButton(OrderType.deliver, 'Deliver'),
          _buildTypeButton(OrderType.pickup, 'Pick Up'),
        ],
      ),
    );
  }

  Widget _buildTypeButton(OrderType type, String text) {
    final bool isSelected = _selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedType = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C)),
        ),
        const SizedBox(height: 16),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF303336)),
        ),
        const SizedBox(height: 8),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF808080)),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildAddressChip(Icons.edit_outlined, 'Edit Address'),
            const SizedBox(width: 8),
            _buildAddressChip(Icons.description_outlined, 'Add Note'),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressChip(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE3E3E3)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF303336)),
            const SizedBox(width: 4),
            Text(
              label,
              style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF303336)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutItem() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/I216_505_417_715.png',
            width: 54,
            height: 54,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2F2D2C)),
            ),
            const SizedBox(height: 4),
            Text(
              'Deep Foam',
              style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9B9B9B)),
            ),
          ],
        ),
        const Spacer(),
        _buildQuantitySelector(),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, _decrementQuantity),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            '$_quantity',
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
        ),
        _buildQuantityButton(Icons.add, _incrementQuantity),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF2F2D2C)),
      ),
    );
  }

  Widget _buildDiscountCard() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer, color: Color(0xFFC67C4E)),
            const SizedBox(width: 12),
            Text(
              '1 Discount is applied',
              style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2F2D2C)),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                size: 20, color: Color(0xFF2F2D2C)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C)),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Price', '\$ 4.53'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2F2D2C)),
            ),
            Row(
              children: [
                Text(
                  '\$ 2.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2F2D2C),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$ 1.0',
                  style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F2D2C)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2F2D2C)),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C)),
        ),
      ],
    );
  }

  Widget _buildPaymentFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 20,
            offset: Offset(0, -10),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const Icon(Icons.account_balance_wallet_outlined,
                    color: Color(0xFFC67C4E)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash/Wallet',
                      style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C)),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '\$ 5.53',
                      style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC67C4E)),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down,
                    color: Color(0xFF2F2D2C)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.go('/order_success');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Order',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}