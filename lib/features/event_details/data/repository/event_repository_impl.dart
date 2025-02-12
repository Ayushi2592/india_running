/*import 'package:india_running/core/constants/app_constants.dart';

import '../../../event_details/domain/repositories/event_repository.dart';
import '../models/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<EventModel>> getTrendingEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 1,
        name: 'India Navy',
        location: 'Location',
        date: '02 Feb',
        price: 500,
        rating: 4.5,
        description: 'Event Description',
        image: AppImages.poster5,
        title: '',
        cost: 500.0,
        race: '',
      ),
    ];
  }

  Future<List<EventModel>> fetchEvents() async {
   await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 2,
        name: 'Marathon Run',
        location: 'Delhi',
        date: '10 Feb',
        price: 750,
        rating: 4.2,
        description: 'Marathon event in Delhi',
        image: AppImages.poster4,
        title: '',
        cost: 750.0,
        race: '',
      ),
    ];
  }
}

 */

import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../../../event_details/domain/repositories/event_repository.dart';
import '../datasources/event_remote_data_sources.dart';
import '../models/event_model.dart';

/*class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<EventModel>> getTrendingEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 1,
        name: 'India Navy',
        venue: 'Location',
        startDate: '02 Feb',
        minPrice: 500,
        rating: 4.5,
        description: 'Event Description',
        bannerImage: AppImages.poster5,
        cost: 500.0,
        race: '',
      ),
    ];
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchEvents(int eventId) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 2,
        name: 'Marathon Run',
        venue: 'Delhi',
        startDate: '10 Feb',
        minPrice: 750,
        rating: 4.2,
        description: 'Marathon event in Delhi',
        bannerImage: AppImages.poster4,
        cost: 750.0,
        race: '',
      ),
    ];
  }
}

 */

///////////////////////////////////////////////////////////////////////////////////////////////////


class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getEventDetails(eventId) async {
    try {
      final eventDetails = await remoteDataSource.fetchEventDetails(eventId as int);
      return Right(eventDetails);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<List<EventModel>> fetchEvents() async {
    
    return []; 
  }

  @override
  Future<List<EventModel>> getTrendingEvents() async {
    
    return [];  
  }
}








