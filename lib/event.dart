import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event {
  final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchLine2,
      fees,
      date,comments,
  coverUrl;
  final List categoryIds, galleryImages;
  String rating;
  ListView list;
  List<String> commentsList=[];
  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages,
      this.fees,
      this.date,
      this.rating,
        this.coverUrl,
      this.list,this.comments});
}

final techEvent = Event(
    imagePath: "assets/event_images/music_concert.jpeg",
    title: "AI",
    description:
        "Here we will discuss about AI, and how to start a career in this field.",
    location: "SJT",
    duration: "3h",
    punchLine1: "Let Create!",
    punchLine2: "Learn.",
    fees: "Rs. 150",
    date: "19-06-2000",
    rating: "4.5/5",
    comments: "",
    list: ListView(
      // padding: const EdgeInsets.all(8),
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // runSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,

                child: Text(
                  'Best Event Ever',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,

                child: Text(
                  'Want to attend again',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,
                child: Text(
                  'The Hosts were great',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,
                child: Text(
                  'Waiting for more such events',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,

                child: Text(
                  'Learnt a lot',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,
                child: Text(
                  'Thanks to club for this event',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,
                child: Text(
                  'Greater then expectations',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        )
      ],
    ),
    galleryImages: [],
    categoryIds: [0, 2]);

final musicEvent = Event(
    imagePath: "assets/event_images/music_concert.jpeg",
    title: "Music Competition",
    description: "Competition",
    location: "Food Court",
    duration: "4h",
    punchLine1: "Music",
    punchLine2: "Lata Mangeshkar",
    fees: "Rs. 200",
    date: "19-06-2000",
    rating: "4.5/5",
    categoryIds: [0, 1],
    galleryImages: []);

final poemCompetition = Event(
    imagePath: "assets/event_images/music_concert.jpeg",
    title: "poem comp.",
    description: " Description",
    location: "SMV",
    duration: "3h",
    punchLine1: "Sunaye ",
    punchLine2: "You speak we listen.",
    fees: "Free",
    date: "19-06-2000",
    rating: "4.5/5",
    galleryImages: [],
    categoryIds: [0, 3]);

final News1 = Event(
    imagePath: "assets/event_images/VITEEE.jpg",
    title: "VITEE ",
    description:
        "The Vellore Institute of Technology (VIT) has announced the exam schedule for the VIT Engineering Entrance Exam (VITEEE) 2021. The exam will be conducted in online proctored mode from May 28, 29 and 31, 2021. Applicants can apply before May 20 at viteee.vit.ac.in.",
    location: "Vellore",
    duration: "",
    punchLine1: "VITEEE 2021 exam date announced, exam to held in online proctored mode",
    punchLine2: "",
    fees: "",
    date: "",
    rating: "",
    galleryImages: [],
    categoryIds: [4]);

final News2 = Event(
    imagePath: "assets/event_images/VIT-Fruit-orchard.jpg",
    title: "VITEE ",
    description: "VIT Engineering Entrance Exam",
    location: "Vellore",
    duration: "",
    punchLine1: "",
    punchLine2: "",
    fees: "",
    date: "",
    rating: "",
    galleryImages: [],
    categoryIds: [4]);

final News3 = Event(
    imagePath: "assets/event_images/VITEEE.jpg",
    title: "Inauguration of VIT Fruit Orchard Planting",
    description: " Inauguration of VIT Fruit Orchard Planting",
    location: "Vellore",
    duration: "",
    punchLine1: "",
    punchLine2: "",
    fees: "",
    date: "19-06-2000",
    rating: "4.5/5",
    galleryImages: [],
    categoryIds: [4]);

final events = [
  techEvent,
  musicEvent,
  poemCompetition,
  News1,
  News2,
  News3,
];
