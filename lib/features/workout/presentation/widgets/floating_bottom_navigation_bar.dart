import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iworkout/core/configs/themes/bottom_bar_color.dart';

class FloatingBottomNavigationBar extends StatefulWidget {
  const FloatingBottomNavigationBar({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  State<FloatingBottomNavigationBar> createState() => _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState extends State<FloatingBottomNavigationBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onItemTapped(index);
  }

  final List<Icon> _items = const [
    Icon(Icons.home),
    Icon(Icons.fitness_center),
    Icon(Icons.show_chart),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(maxWidth: 768),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: BottomBarColor.bottomBarBackground.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: BottomBarColor.shadowDark.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.05),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              return Expanded(
                child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  child: AnimatedOpacity(
                    opacity: _currentIndex == index ? 1 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -4,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: _currentIndex == index ? 20 : 0,
                            decoration: BoxDecoration(
                              color: BottomBarColor.accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: IconTheme(
                            data: IconThemeData(
                              color: _currentIndex == index
                                  ? BottomBarColor.accentColor
                                  : BottomBarColor.iconInactive,
                              size: 24,
                            ),
                            child: _items[index],
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    _onItemTapped(index);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}