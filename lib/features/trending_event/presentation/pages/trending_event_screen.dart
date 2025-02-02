import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/event_card.dart';
import '../bloc/event_bloc.dart';
import '../bloc/event_event.dart';
import '../bloc/event_state.dart';

class TrendingEventScreen extends StatefulWidget {
  @override
  _TrendingEventScreenState createState() => _TrendingEventScreenState();
}

class _TrendingEventScreenState extends State<TrendingEventScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch correct event to fetch trending events
    context.read<EventBloc>().add(LoadTrendingEvents());  // ✅ Fixed event name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Events'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());  // Show loading spinner
          } else if (state is EventLoaded) {
            if (state.events.isEmpty) {
              return const Center(
                child: Text(
                  'No trending events available.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];
                return EventCard(
                  event: event,
                  eventName: event.date,
                  eventLocation: event.location,
                  eventPrice: event.price,
                  eventImage: event.imageUrl,
                );
              },
            );
          } else if (state is EventError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          return const Center(child: Text('Fetching trending events...'));
        },
      ),
    );
  }
}
