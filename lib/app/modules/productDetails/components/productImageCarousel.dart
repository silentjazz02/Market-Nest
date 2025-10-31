// dart
// File: `lib/app/modules/productDetails/components/productImageCarousel.dart`
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketnest/core/theme/Utils.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double mainHeight;

  const ProductImageCarousel({
    super.key,
    required this.imageUrls,
    this.mainHeight = 200,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return Container(
        height: widget.mainHeight,
        decoration: BoxDecoration(
          color: context.colorPalette.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Icon(Icons.broken_image, size: 48, color: context.colorPalette.disabledHint)),
      );
    }

    if(widget.imageUrls.length == 1) {
      return _carouselImage(widget.imageUrls[0]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Main slider
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          carouselController: _controller,
          itemBuilder: (context, index, realIndex) {
            return _carouselImage(widget.imageUrls[index]);
          },
          options: CarouselOptions(
            height: widget.mainHeight,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
        ),

        const SizedBox(height: 12),

        // Dots indicator
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.imageUrls.length, (index) {
              final isActive = index == _current;
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(index);
                  setState(() => _current = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: isActive ? 12 : 8,
                  height: isActive ? 12 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? context.colorPalette.primary : context.colorPalette.disabledHint,
                    shape: BoxShape.circle,
                    boxShadow: isActive
                        ? [
                      BoxShadow(
                        color: context.colorPalette.primary.withOpacity(0.25),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      )
                    ]
                        : null,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _carouselImage(String imageUrl) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          height: widget.mainHeight,
          errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
