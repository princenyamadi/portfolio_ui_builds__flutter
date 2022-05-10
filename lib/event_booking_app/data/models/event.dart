class Event {
  final String imageUrl;
  final String title;
  final String description;
  final EventType type;

  Event({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.type,
  });
}

enum EventType { conference, meeting, concert, party }

String getEventTypeString(EventType eventType) {
  switch (eventType) {
    case EventType.conference:
      return 'Conference';
    case EventType.meeting:
      return 'Meeting';
    case EventType.concert:
      return 'Concert';
    case EventType.party:
      return 'Party';
  }
}

List<Event> events = [
  Event(
    imageUrl:
        'https://cdn.pixabay.com/photo/2021/12/19/21/48/eurasian-pygmy-owl-6881984_1280.jpg',
    title: 'Event 1',
    description: 'This is a description for event 1',
    type: EventType.conference,
  ),
  Event(
    imageUrl:
        'https://cdn.pixabay.com/photo/2020/05/19/13/48/cartoon-5190942_1280.jpg',
    title: 'Event 2',
    description: 'This is a description for event 2',
    type: EventType.meeting,
  ),
  Event(
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/05/01/15/18/swan-7167802_1280.jpg',
    title: 'Event 3',
    description: 'This is a description for event 3',
    type: EventType.concert,
  ),
  Event(
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/04/23/20/51/nature-7152461_1280.jpg',
    title: 'Event 4',
    description: 'This is a description for event 4',
    type: EventType.party,
  ),
];
