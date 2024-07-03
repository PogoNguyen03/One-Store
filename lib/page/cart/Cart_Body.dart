import 'package:flutter/material.dart';
import '../../data/model/product_model.dart';

class ItemCartGridView extends StatefulWidget {
  final ProductModel product;
  final Function(bool isChecked, int totalPrice) onChanged;

  const ItemCartGridView({
    Key? key,
    required this.product,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ItemCartGridViewState createState() => _ItemCartGridViewState();
}

class _ItemCartGridViewState extends State<ItemCartGridView> {
  bool isChecked = false;
  int quantity = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = int.parse(widget.product.price) * quantity;
  }

  void increment() {
    setState(() {
      quantity++;
      calculateTotalPrice();
      if (isChecked) {
        widget.onChanged(isChecked, totalPrice);
      }
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        calculateTotalPrice();
        if (isChecked) {
          widget.onChanged(isChecked, totalPrice);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                  widget.onChanged(isChecked, totalPrice);
                });
              },
              checkColor: Colors.white,
              activeColor: const Color(0xFFEC8F5E),
            ),
            const SizedBox(width: 12),
            Image.asset(
              "assets/image/book/${widget.product.imageUrl}",
              width: 80,
              height: 110,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${widget.product.price} VND',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFF3B664).withOpacity(0.65),
                    ),
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: const Text(
                      'Màu:     Trắng',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      InkWell(
                        onTap: increment,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFF3B664),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: decrement,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFF3B664),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
