import 'package:ai_app/screens/page_view/preseantion/widgets/page_view_body.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {
  static String id = 'PageScreen';
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image':
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800&h=1200&fit=crop',
      'title': 'AI Assistant',
      'subtitle': 'Your intelligent companion for everyday tasks',
      'button': 'Get Started'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=800&h=1200&fit=crop',
      'title': 'Smart Solutions',
      'subtitle': 'Advanced AI technology at your fingertips',
      'button': 'Explore Now'
    },
    {
      'image':
          'https://unsplash.com/photos/stainless-steel-robot-toy-in-close-up-photography-_3KdlCgHAn0?w=800&h=1200&fit=crop',
      'title': 'Future Ready',
      'subtitle': 'Experience the next generation of AI',
      'button': 'Join Us',
      'imageAsset': 'assets/ai.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return PageViewBody(
                imageUrl: _pages[index]['image']!,
                title: _pages[index]['title']!,
                subtitle: _pages[index]['subtitle']!,
                textButton: _pages[index]['button']!,
                imageAsset: _pages[index]['imageAsset'] ?? '',
                fontSizeTitle: 32,
              );
            },
          ),
          // Page Indicators
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Skip Button
          Positioned(
            top: 60,
            right: 20,
            child: TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  _pages.length - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
