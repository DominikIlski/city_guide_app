class DummyData {
  static final events = [
    <String, dynamic>{
      'id': 'test1',

      'name': 'Concert',
      'description':
          'Orange Warsaw Festival 2022 is coming and announcing a big part of it’s line-up. Florence + The Machine and Tyler, The Creator headline one of the biggest music festivals in Poland. Also joining the list are Charli XCX, NAS, Foals, Stormzy, Earl Sweatshirt and Sigrid, as well as great local acts - Żabson x Young Igi, Szczyl and Kacperczyk. See you at Horse Racetrack Warszawa - Służewiec, June 3-4.',
      'place': {'lat': 52.1597, 'lon': 21.0087},
      'images': [
        'https://www.konferencje.pl/gfx/konferencje/userfiles/images/Event%20czym%20jest%20event%20w%20plenerze.jpg'
      ]
    },
    <String, dynamic>{
      'id': 'test2',

      'name': 'Silent Disco',
      'description':
          'No plans for Saturday ?! An amazing event in Warsaw, Juwenalia University of Music and the quietest party in the capital, Silent Disco. Follow closely!',
      'place': {'lat': 53.1096, 'lon': 23.1475},
      'images': [
        'https://www.konferencje.pl/gfx/konferencje/userfiles/images/Event%20czym%20jest%20event%20w%20plenerze.jpg'
      ]
    },
    <String, dynamic>{
      'id': 'test3',

      'name': 'Outdoor cinema',
      'description':
          'Powiśle power plant together with Millennium Docs Against Gravity invite you to the unique THIRD edition of summer cinema in Powiśle!' +
              'For the coming months, we meet every Tuesday and Saturday at 19:30 at the Power Plant.',
      'place': {'lat': 52.2414, 'lon': 21.0275},
      'images': [
        'https://www.konferencje.pl/gfx/konferencje/userfiles/images/Event%20czym%20jest%20event%20w%20plenerze.jpg'
      ]
    },
    <String, dynamic>{
      'id': 'test4',
      'name': '',
      'description': '',
      'place': {'lat': 0.0, 'lon': 0.0},
      'images': [
        'https://www.konferencje.pl/gfx/konferencje/userfiles/images/Event%20czym%20jest%20event%20w%20plenerze.jpg'
      ]
    }
  ];
  static final places = [
    <String, dynamic>{
      'id': 'test1',
      'name': 'Łazienki Królewskie',
      'description': 'The Royal Łazienki Museum, called "the happiest place in Warsaw", was the summer residence of King Stanisław August. It is made up of classicist monuments and historical gardens.',
      'place': {'lat': 52.2156, 'lon': 21.0349},
      'images': [
        'https://warsawtour.pl/wp-content/uploads/2018/08/%C5%81azienki-Kr%C3%B3lewskie-Pa%C5%82ac-na-Wyspie_fot.-z-archiwum-Warszawskiej-Organizacji-Turystycznej.jpg'
      ],
      'video': 'https://www.youtube.com/watch?v=0QnPuZ3AfPc'
    },
    <String, dynamic>{
      'id': 'test2',
      'name': 'Royal Castle in Warsaw',
      'description': 'With its characteristic shape and distinct colour, you will not mistake this building for any other. The Royal Castle is the former seat of the rulers of Poland. Go inside and look at the royal apartments and the Throne Room. Pay attention to original paintings by Rembrandt and the canvases of Bernardo Bellotto, known as Canaletto, which were used during the reconstruction of Warsaw after it was destroyed in World War II. See also the Senator’s Hall, in which in 1791 the 3rd May Constitution was passed – the first constitution in Europe and the second in the world. At the end, enter the beautifully reconstructed gardens: the upper garden situated on the castle slope and the lower one at its feet where the river used to flow in the seventeenth century. Carefully recreated in the style of the 1920s and 1930s, it not only complements the residence but it is also an ideal place to relax. The huge lawn, flower beds, fountains and mazes created from several-metre high hedges will give you a boost of energy for further sightseeing. If you have more time, stay a bit longer to see the charm of the garden in the glow of the illuminations after dark.',
      'place': {'lat': 52.2481, 'lon': 21.0152},
      'images': [
        'https://warsawtour.pl/wp-content/uploads/2018/11/Zamek-Kr%C3%B3lewski-fot.-Roman-Gorielov_Fotolia.jpg'
      ],
      'video': 'https://www.youtube.com/watch?v=0QnPuZ3AfPc'
    }
  ];
  static final accomodation = [
    <String, dynamic>{
      'id': 'test1',
      'name': 'Mercure Warszawa',
      'description': 'Offering a bar, Mercure Warszawa Ursus Station is located in Warsaw in the Masovian Region Region. The distance to important places from the hotel is: Blue City Shopping Center - 6 km, Warsaw Uprising Museum - 8 km. Facilities include a restaurant, a 24-hour front desk, room service and free WiFi in all areas. The hotel offers a sauna and luggage storage.',
      'place': {'lat': 52.2156, 'lon': 21.0349},
      'images': [
        'https://www.konferencje.pl/gfx/konferencje/userfiles/images/Event%20czym%20jest%20event%20w%20plenerze.jpg'
      ],
    }
  ];

  static final toures = [
    <String, dynamic>{
      'id': 'test1',
      'name': 'Guide 1',
      'descrption': 'First warsaw guide',
      'places': ['test1', 'test2']
    },
  ];
}
