import 'package:flutter/material.dart';

class TransactionTabs extends StatelessWidget {
  final List<String> titles;
  final List<Widget> tabContents;

  const TransactionTabs({
    required this.titles,
    required this.tabContents,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Column(
        children: [
          // Tab Bar with rounded container
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

                // Remove bottom line
                dividerColor:
                    Colors.transparent, // Removes the default bottom line
                overlayColor: MaterialStateProperty.all(
                    Colors.transparent), // Removes highlight effect

                tabs: titles
                    .map(
                      (title) => Tab(
                        child: Center(child: Text(title)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          // Tab Bar View
          Expanded(
            child: TabBarView(
              children: tabContents,
            ),
          ),
        ],
      ),
    );
  }
}
