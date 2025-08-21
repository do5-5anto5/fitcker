
import 'package:fitcker/providers/quote/quote_provider.dart';
import 'package:fitcker/presentation/screens/workout_list_screen/components/workout_calendar_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutAppBar extends StatelessWidget implements PreferredSizeWidget{
  const WorkoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const SizedBox.shrink(),
      toolbarHeight: 240,
      flexibleSpace: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 56.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                Consumer(
                  builder: (_, WidgetRef ref, _) {
                    final quote = ref.watch(getQuoteProvider);
                    return quote.maybeWhen(
                      data: (data) {
                        return Column(
                          children: [
                            Text(
                              data.quote,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // The refresh() method returns a AsyncValue<T> .
                                // So essentially, refresh is an invalidate() method followed by a read to grab the updated state.
                                // final _ = ref.refresh(getQuoteProvider);
                                ref.invalidate(getQuoteProvider);
                              },
                              child: Text('Refresh'),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                WorkoutCalendarGraph(),
              ],
            ),
          ),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: TabBar(
          tabs: [
            Tab(text: 'Upper Body'),
            Tab(text: 'Lower Body'),
          ],
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(270);
}
