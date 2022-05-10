class EventCategory {
  final String title;
  final int numberOfEvents;
  final String imageUrl;

  EventCategory({
    required this.title,
    required this.numberOfEvents,
    required this.imageUrl,
  });
}

List<EventCategory> categories = [
  EventCategory(
    title: 'Conference',
    numberOfEvents: 2,
    imageUrl:
        'https://cdn.pixabay.com/photo/2019/11/25/12/31/french-bulldog-4651905_1280.png',
  ),
  EventCategory(
    title: 'Meeting',
    numberOfEvents: 1,
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/04/01/22/55/submarine-7105870_1280.png',
  ),
  EventCategory(
    title: 'Concert',
    numberOfEvents: 1,
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/04/09/19/02/moon-7122089_1280.png',
  ),
  EventCategory(
    title: 'Party',
    numberOfEvents: 1,
    imageUrl:
        'https://cdn.pixabay.com/photo/2021/09/26/20/49/world-6658881_1280.jpg',
  ),
];
