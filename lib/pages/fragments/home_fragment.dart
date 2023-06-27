import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final BuildContext context;
  final CarouselOptions carouselOptions;
  final String? name;
  final int? point;

  const HomeFragment({
    super.key,
    required this.context,
    required this.carouselOptions,
    this.name,
    this.point,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Hi, ${name ?? 'Unknown User'}",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${point ?? 0} Aerplus Point',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ListView(
            children: [
              CarouselSlider(
                options: carouselOptions,
                items: const [
                  Card(
                    child: Center(
                      child: Text(
                        'Banner #1',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Banner #2',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Banner #3',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Banner #4',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Banner #5',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "What's new?",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              CarouselSlider(
                options: carouselOptions,
                items: const [
                  Card(
                    child: Center(
                      child: Text(
                        'News #1',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'News #2',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'News #3',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'News #4',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'News #5',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Prize",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              CarouselSlider(
                options: carouselOptions,
                items: const [
                  Card(
                    child: Center(
                      child: Text(
                        'Prize #1',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Prize #2',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Prize #3',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Prize #4',
                      ),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text(
                        'Prize #5',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}