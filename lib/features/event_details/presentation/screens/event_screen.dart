/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../../event_details/data/repository/event_repository_impl.dart';
import '../bloc/event_bloc.dart';

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(
        fetchTrendingEventsUseCase: FetchTrendingEventsUseCase(
          eventRepository: EventRepositoryImpl(),
        ),
      )..add(FetchEventsEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    if (state is EventLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is EventError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else if (state is EventLoaded) {
                      final events = state.events;

                      return ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final event = events[index];

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: AppPaddings.all,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Event Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      event.image,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on, size: 16, color: Colors.blue),
                                          const SizedBox(width: 5),
                                          Text(event.location, style: AppTextStyles.subheading),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, color: Colors.yellow),
                                          const SizedBox(width: 4),
                                          Text(event.rating.toString(), style: const TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // Event Date
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month, color: Colors.blue),
                                      const SizedBox(width: 4),
                                      Text(event.name, style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text('No Events Available'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

//Widget raceImageWidget(){return Container();}

//Widget raceHeadingInfoWidget() {return Container();}

//Widget raceInfoWidget() {return Container();}

//Widget buildRegisterButton() {return Container();}

//Widget build(BuildContext context) {
//return Column(children: [raceImageWidget(), raceHeadingInfoWidget(),raceImageWidget(),]);
//}
////////////////////////////////////////////////////////////////////////////////////////////////////
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../event_details/data/repository/event_repository_impl.dart';
import '../../data/datasources/event_remote_data_sources.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../bloc/event_bloc.dart';
import '../../data/models/event_model.dart';
import 'package:http/http.dart' as http;

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(
        fetchTrendingEventsUseCase: FetchTrendingEventsUseCase(
          eventRepository: EventRepositoryImpl(EventRemoteDataSourceImpl(http.Client())),
        ),
        eventRepository: EventRepositoryImpl(EventRemoteDataSourceImpl(http.Client())),
      )..add(FetchEventsEvent()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: const Text(
              'Trending Events',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EventError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 60, color: Colors.red),
                      const SizedBox(height: 10),
                      Text(
                        state.message,
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                );
              } else if (state is EventLoaded) {
                final event = state.events.first;
                print('Fetched eventId: ${event.id}');
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Fetched Event ID:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        event.id.toString(),
                        style: const TextStyle(fontSize: 24, color: Colors.blue),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: Text('No Events Available'));
            },
          ),
        ),
       /*body: SafeArea(
          child: BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EventError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 60, color: Colors.red),
                      const SizedBox(height: 10),
                      Text(
                        state.message,
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<EventBloc>().add(FetchEventsEvent());
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (state is EventLoaded) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.events.length,
                  itemBuilder: (context, index) {
                    final event = state.events[index];
                    return EventCard(event: event);
                  },
                );
              }
              return const Center(child: Text('No Events Available'));
            },
          ),
        ),
        */
      );


  }
}

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () => context.push('/event_details/${event.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  event.bannerImage,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                event.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.blue),
                      const SizedBox(width: 5),
                      Text(event.venue, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        event.rating.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_month, size: 16, color: Colors.blue),
                  const SizedBox(width: 5),
                  Text(event.name, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */

////////////////////////////////////////////////////////////////////////////////////


/*import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class TrendingEventScreen extends StatefulWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  _TrendingEventScreenState createState() => _TrendingEventScreenState();
}

class TrendingEventScreenState extends State<TrendingEventScreen> {
  final Map<String, dynamic>? eventData;

  const TrendingEventScreen({Key? key, required this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (eventData == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No event data available.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      );
    }

    final int eventId = eventData!['eventId'] ?? 0;
    final String eventName = eventData!['eventName'] ?? 'N/A';
    final String eventVenue = eventData!['eventVenue'] ?? 'N/A';
    final String eventBanner = eventData!['eventBanner'] ?? 'N/A';
    print(eventData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (eventBanner.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  eventBanner,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue),
                const SizedBox(width: 5),
                Text(
                  eventVenue,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildRoundLabel('5K'),
                  const SizedBox(width: 8),
                  _buildRoundLabel('10K'),
                  const SizedBox(width: 8),
                  _buildRoundLabel('21.1K'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildExpandableSection(
              title: "About the race",
              content: "The Indian Navy Race is a thrilling event...",
            ),
            _buildExpandableSection(
              title: "Contact",
              content: "support@indiarunning.com",
            ),
            const SizedBox(height: 200),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '₹500',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'onwards',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      // Handle register button tap
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildRoundLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.shade50,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}
*/


/*import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class TrendingEventScreen extends StatelessWidget {
  final Map<String, dynamic>? eventData;

  const TrendingEventScreen({Key? key, required this.eventData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updatedEventData = Map<String, dynamic>.from(eventData ?? {});

    print('Updated eventData: $updatedEventData');

    final int eventId = updatedEventData['eventId'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Center(
        child: Text(
          'eventId: $eventId',
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

*/


///////////////////////////////////////////////////////

/*import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class TrendingEventScreen extends StatelessWidget {
  final Map<String, dynamic>? eventData;

  const TrendingEventScreen({Key? key, required this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updatedEventData = Map<String, dynamic>.from(eventData ?? {});

    print('Updated eventData: $updatedEventData');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: updatedEventData.isNotEmpty
            ? ListView.builder(
          itemCount: updatedEventData.length,
          itemBuilder: (context, index) {
            final key = updatedEventData.keys.elementAt(index);
            final value = updatedEventData[key] ?? 'N/A';
            return ListTile(
              title: Text(
                key,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(value.toString()),
            );
          },
        )
            : const Center(
          child: Text(
            'No event data available.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

 */




////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../domain/repositories/event_repository.dart';
import '../bloc/event_bloc.dart';
import '../../data/models/event_model.dart';

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key, Map<String, dynamic>? eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Events'),
      ),
      body: BlocProvider(
        create: (context) => EventBloc(
          fetchTrendingEventsUseCase: context.read<FetchTrendingEventsUseCase>(),
          eventRepository: context.read<EventRepository>(),
        )..add(FetchEventsEvent()),
        child: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventLoaded) {
              return _buildEventList(state.event);
            } else if (state is EventError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No events available.'));
          },
        ),
      ),
    );
  }

  Widget _buildEventList(List<EventModel> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(event.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Venue: ${event.venue}'),
                Text('Date: ${event.startDate}'),
                Text('Min Price: ${event.minPrice}'),
                Text('Rating: ${event.rating.toString()}'),
              ],
            ),
            leading: event.bannerImage.isNotEmpty
                ? Image.network(
              event.bannerImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
                : const Icon(Icons.event),
            onTap: () {
              final eventData = {
                'eventId': event.id,
                'eventName': event.name,
                'eventVenue': event.venue,
                'eventBanner': event.bannerImage,
              };
              print('Event Data: $eventData');
              context.read<EventBloc>().add(FetchEventDetailsEvent(event.id as String ));
            },
          ),
        );
      },
    );
  }
}

 */



////////////////////////////////////////////////////////////////

/*import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';

class TrendingEventScreen extends StatelessWidget {
  final List<EventModel> events;

  const TrendingEventScreen({
    Key? key,
    this.events = const [], Map<String, dynamic>? eventData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Events'),
      ),
      body: events.isNotEmpty
          ? _buildEventList(events)
          : const Center(child: Text('No events available.')),
    );
  }

  Widget _buildEventList(List<EventModel> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(event.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Venue: ${event.venue}'),
                Text('Date: ${event.startDate}'),
                Text('Min Price: ${event.minPrice}'),
                Text('Rating: ${event.rating.toString()}'),
              ],
            ),
            leading: event.bannerImage.isNotEmpty
                ? Image.network(
              event.bannerImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
                : const Icon(Icons.event),
            onTap: () {
              final eventData = {
                'eventId': event.id,
                'eventName': event.name,
                'eventVenue': event.venue,
                'eventBanner': event.bannerImage,
              };
              print('Event Data: $eventData');
            },
          ),
        );
      },
    );
  }
}

 */


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/event_bloc.dart';
import '../../data/models/event_model.dart'; // Corrected import path

class TrendingEventScreen extends StatefulWidget {
  final Map<String, dynamic>? eventData;

  const TrendingEventScreen({Key? key, required this.eventData}) : super(key: key);

  @override
  _TrendingEventScreenState createState() => _TrendingEventScreenState();
}

class _TrendingEventScreenState extends State<TrendingEventScreen> {
  late int eventId;

  @override
  void initState() {
    super.initState();
    if (widget.eventData != null) {
      eventId = widget.eventData!['eventId'] ?? 0;
      context.read<EventBloc>().add(FetchEventDetailsEvent(eventId.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is EventLoaded) {
            final EventModel event = state.event as EventModel;
            return _buildEventDetails(event.name, event.venue, event.bannerImage);
          }
          return const Center(
            child: Text(
              'No event data available.',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventDetails(String eventName, String eventVenue, String eventBanner) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eventBanner.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                eventBanner,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100, color: Colors.grey),
              ),
            ),
          const SizedBox(height: 20),
          Text(
            eventName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.blue),
              const SizedBox(width: 5),
              Text(
                eventVenue,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildRoundLabel('5K'),
                const SizedBox(width: 8),
                _buildRoundLabel('10K'),
                const SizedBox(width: 8),
                _buildRoundLabel('21.1K'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildExpandableSection(
            title: "About the race",
            content: "The Indian Navy Race is a thrilling event...",
          ),
          _buildExpandableSection(
            title: "Contact",
            content: "support@indiarunning.com",
          ),
          const SizedBox(height: 200),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildRoundLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.shade50,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '₹500',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'onwards',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: AppColors.primary, width: 2),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            onPressed: () {
            },
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 18, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
