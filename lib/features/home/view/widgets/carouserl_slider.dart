import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class MainCarouselSlider extends StatelessWidget {
  const MainCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: CarouselSlider(
          items: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/carousel-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/carousel-2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/carousel-4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 250,
            aspectRatio: 1,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (int index, reason) {},
            scrollDirection: Axis.horizontal,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            clipBehavior: Clip.antiAlias,
            pauseAutoPlayInFiniteScroll: true,
            pauseAutoPlayOnManualNavigate: true,
          ),
        ),
      ),
    );
  }
}
