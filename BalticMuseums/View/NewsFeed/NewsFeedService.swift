//
//  NewsFeedService.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 18/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class NewsFeedService {
    static func getNewsFeed() -> [NewsFeedModel] {
        return [
            NewsFeedModel(text: """
Balony zazwyczaj kojarzą nam się z dobrą zabawą... i o to właśnie chodzi! 🎈🎈🎈
Podczas weekendowych warsztatów rodzinnych SIŁA POD CIŚNIENIEM z pomocą balonów tworzymy własne poduszkowce, przelewamy wodę bez użycia rąk, sprawdzamy jak zachowują się one w próżni! A to tylko część doświadczeń, które przeprowadzamy w naszym experymentowym laboratorium.
""", photos: [ UIImage(named: "1-1")! , UIImage(named: "1-2")!, UIImage(named: "1-3")!  ]),
            NewsFeedModel(text: """
"Wyobraźcie sobie świat, który trzeba zbudować od nowa. Przed wielką eksplozją, która zniszczyła obecną cywilizację, naukowcy wyrzucili w kosmos kapsułę z fragmentami opisów najważniejszych wynalazków. Kapsuła rozbiła się na przestrzeni Centrum Nauki EXPERYMENT. Żeby informacje nie dostały się w niepowołane ręce, naukowcy zakodowali je w formie zagadek do rozwiązania."😲
Nauczycielki, które uczestniczyły we wczorajszym wydarzeniu AKTYWNIE z EXPERYMENTEM, świetnie poradziły sobie z rozwiązaniem tych zagadek 🙏👏 Co więcej na koniec spotkania, wykorzystując zdobytą wiedzę, skonstruowały własne wynalazki❗
Mam nadzieję, że podobne scenariusze zajęć przeprowadzicie teraz ze swoimi uczniami
""", photos: [ UIImage(named: "2-1")! , UIImage(named: "2-2")!, UIImage(named: "2-3")!  ]),
            NewsFeedModel(text: """
To była zaledwie rozgrzewka, a już padło tyle pomysłów na aplikacje mobilne dla EXPERYMENTU i Akwarium Gdyńskie. WIELKIE DZIĘKI❗❗❗ Widzimy się w najbliższą sobotę, 17 marca w EXPERYMENCIE na Baltathonie❗❗❗
#wgdyni #akwariumgdynskie #experyment #netcamp #hackathon2018 #hack4balticmuseums
""", photos: [ UIImage(named: "3-1")! , UIImage(named: "3-2")!, UIImage(named: "3-3")!  ]),
            NewsFeedModel(text: """
Jesteś nauczycielem lub bibliotekarzem❓ Zapraszamy na kolejne spotkanie z cyklu AKTYWNIE Z EXPERYMENTEM, w ramach którego staramy się pokazywać, jak kreatywnie wykorzystać wizytę z uczniami na naszej wystawie.
➡ KAPSUŁA CZASU - HISTORIA W WYNALAZKACH
➡ czwartek, 15 marca
➡ godzina 15.00
➡ Udział w spotkaniu jest bezpłatny. Obowiązuje wcześniejsze rejestracja. Liczba miejsc ograniczona.
""", photos: [ UIImage(named: "4-1")! , UIImage(named: "4-2")!, UIImage(named: "4-3")!  ])
        ]
    }
}
