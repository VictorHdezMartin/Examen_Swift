//
//  PeliculasResponse.swift
//  Examen_Swift
//
//  Created by Tardes on 27/1/25.
//

import Foundation


//  http://www.omdbapi.com/?apikey=fb7aca4&s=superman

class PeliculasProvider {
    
    static func findPeliculasBy(name: String) async throws -> [PeliculaClass] {
        let url = URL(string: "https://www.omdbapi.com/?apikey=fb7aca4&s=\(name)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(PeliculasResponse.self, from: data)
        return result.Search
    }
    
    static func findPeliculaBy(id: String) async throws -> PeliculaClass {
        let url = URL(string: "https://www.omdbapi.com/?apikey=fb7aca4&i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(PeliculaClass.self, from: data)
        return result
    }
}

struct PeliculasResponse: Decodable {
    let Search: [PeliculaClass]
}

struct PeliculaClass: Codable {
    var Title: String
    let imdbID: String
    var Poster: String
    var Year: String
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Plot: String?
}
    
    
/*
 "Title": "Superman",
 "Year": "1978",
 "Rated": "PG",
 "Released": "15 Dec 1978",
 "Runtime": "143 min",
 "Genre": "Action, Adventure, Sci-Fi",
 "Director": "Richard Donner",
 "Writer": "Jerry Siegel, Joe Shuster, Mario Puzo",
 "Actors": "Christopher Reeve, Margot Kidder, Gene Hackman",
 "Plot": "An alien orphan is sent from his dying planet to Earth, where he grows up to become his adoptive home's first and greatest superhero.",
 "Language": "English",
 "Country": "United States, United Kingdom, Switzerland, Panama",
 "Awards": "Nominated for 3 Oscars. 19 wins & 23 nominations total",
 "Poster": "https://m.media-amazon.com/images/M/MV5BMzFlZDJjMDAtZDYxZS00NzZhLTk2ODMtZWRlODA3Njk3ZTdmXkEyXkFqcGc@._V1_SX300.jpg",
 "Ratings": [
 {
 "Source": "Internet Movie Database",
 "Value": "7.4/10"
 },
 {
 "Source": "Rotten Tomatoes",
 "Value": "93%"
 },
 {
 "Source": "Metacritic",
 "Value": "82/100"
 }
 ],
 "Metascore": "82",
 "imdbRating": "7.4",
 "imdbVotes": "191,580",
 "imdbID": "tt0078346",
 "Type": "movie",
 "DVD": "N/A",
 "BoxOffice": "$134,478,449",
 "Production": "N/A",
 "Website": "N/A",
 "Response": "True"
 }
 */
