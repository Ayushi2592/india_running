import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_running/features/feature1/domain/entities/trending_event.dart';
import '../bloc/trending_event_bloc.dart';
import '../bloc/trending_event_state.dart';
import '../bloc/trending_event_event.dart';

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Events')),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              context.read<TrendingEventBloc>()..add(LoadTrendingEvents()),
          child: BlocBuilder<TrendingEventBloc, TrendingEventState>(
            builder: (context, state) {
              if (state is TrendingEventLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TrendingEventLoaded) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.events.length,
                  itemBuilder: (context, index) {
                    final TrendingEvent event = state.events[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                event.imageUrl,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(event.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 16, color: Colors.blue),
                                    const SizedBox(width: 5),
                                    Text(event.location,
                                        style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const SizedBox(width: 4),
                                    Text(event.rating.toString(),
                                        style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month,
                                    color: Colors.blue),
                                const SizedBox(width: 4),
                                Text(event.date,
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2),
                                ),
                              ),
                              child: const Text('Register',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is TrendingEventError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('No events available'));
            },
          ),
        ),
      ),
    );
  }
}
