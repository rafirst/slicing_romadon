import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  AppCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String title;
  final String subtitle;
  final int price;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
              height: 121,
              width: 327,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // Biarkan teks fleksibel
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 21,
                    horizontal: 16, // Kurangi padding horizontal
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(widget.subtitle, style: TextStyle(fontSize: 11)),
                      SizedBox(height: 16),
                      Text(
                        'Rp. ${widget.price}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ), // Kurangi padding kanan
                child: Column(
                  children: [
                    Row(
                      mainAxisSize:
                          MainAxisSize.min, // Hindari memaksakan lebar
                      children: [
                        IconButton(
                          onPressed: () {
                            if (widget.count > 0) {
                              widget.onDecrement();
                            }
                          },
                          icon: Image.asset(
                            'assets/images/minus.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.count.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: widget.onIncrement,
                          icon: Image.asset(
                            'assets/images/plus.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp ${widget.count * widget.price}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
