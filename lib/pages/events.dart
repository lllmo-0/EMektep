import 'package:flutter/material.dart';
// import 'package:emektep/pages/cards.dart';
// import 'package:emektep/router.dart';

class EventsNewsPage extends StatefulWidget {
  // final Widget child;
  // const EventsNewsPage({super.key, required this.child});
  @override
  _EventsNewsPageState createState() => _EventsNewsPageState();
}

class _EventsNewsPageState extends State<EventsNewsPage> {
  ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        _appBarOpacity = (offset / 200).clamp(0.0, 1.0);
      });
    });
  }

  final List<Map<String, String>> events = [
    {
      'image':
          'data:image/jpeg;base64,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',
      'description':
          'Первое событие: Описание важного мероприятия, которое требует развернутого представления.',
      'date': '10 января 2025'
    },
    {
      'image':
          'data:image/jpeg;base64,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',
      'description':
          'Второе событие: Краткое описание события.lkasnflgnalsnlfgalsflals',
      'date': '15 февраля 2025'
    },
    {
      'image':
          'data:image/jpeg;base64,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',
      'description':
          'Третье событие: Подробнее о новом событии.aofobpapfbpasnfbpans',
      'date': '20 марта 2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF007E86),
                  Color(0xFF192B50),
                  Color(0xFF000000),
                ],
              ),
            ),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  title: Text(
                    'EMektep',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromARGB(255, 12, 13, 13)
                      .withOpacity(_appBarOpacity),
                  floating: false,
                  pinned: true,
                  expandedHeight: 60.0,
                  actions: <Widget>[
                    Icon(
                      Icons.add, // Иконка суммы
                      size: 30, // Размер иконки
                      color: Colors.white, // Белый цвет
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return EventCard(
                        imageUrl: events[index]['image']!,
                        description: events[index]['description']!,
                        date: events[index]['date']!,
                      );
                    },
                    childCount: events.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String date;

  const EventCard({
    required this.imageUrl,
    required this.description,
    required this.date,
  });

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(widget.imageUrl,
                  height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      children: [
                        TextSpan(
                          text: isExpanded
                              ? widget.description
                              : (widget.description.length > 50
                                  ? widget.description.substring(0, 50)
                                  : widget.description),
                        ),
                        if (widget.description.length > 50)
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Text(
                                isExpanded ? ' Скрыть' : '... Еще',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
