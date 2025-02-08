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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../../event_details/data/repository/event_repository_impl.dart';
import '../bloc/event_bloc.dart';

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      EventBloc(
        fetchTrendingEventsUseCase: FetchTrendingEventsUseCase(
          eventRepository: EventRepositoryImpl(),
        ),
      )
        ..add(FetchEventsEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: AppPaddings.horizontal.add(AppPaddings.vertical),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primaryLight,
                        child: Icon(Icons.arrow_back, size: 20,
                            color: AppColors.primary),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                            Icons.upload, size: 24, color: AppColors.primary),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    if (state is EventLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is EventError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else if (state is EventLoaded) {
                      
                      final event = state.events.first;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        event.bannerImage,
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(event.name,
                                        style: AppTextStyles.heading),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.location_on, size: 16,
                                                color: Colors.blue),
                                            const SizedBox(width: 5),
                                            Text(event.venue,
                                                style: AppTextStyles
                                                    .subheading),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Colors.yellow),
                                            const SizedBox(width: 4),
                                            Text(event.rating.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Row(
                                      children: [
                                        Icon(Icons.calendar_month,
                                            color: Colors.blue),
                                        SizedBox(width: 4),
                                        Text('', style: TextStyle(
                                            fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About the Race',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'This is a detailed explanation about the event. It includes all the details such as race type, participants, rules, and any additional information.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      );
                    }
                    return const Center(child: Text('No Events Available'));
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 1)),
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
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: AppColors.primary, width: 2),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      onPressed: () {
                        context.push('/register');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}