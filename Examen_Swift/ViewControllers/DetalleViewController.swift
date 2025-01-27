//
//  DetalleViewController.swift
//  Examen_Swift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var Titulolbl: UILabel!
    @IBOutlet weak var Directorlbl: UILabel!
    @IBOutlet weak var Paislbl: UILabel!
    @IBOutlet weak var Generolbl: UILabel!
    @IBOutlet weak var Duracionlbl: UILabel!
    @IBOutlet weak var aniolbl: UILabel!
    @IBOutlet weak var SinopsisText: UITextView!
    
    var peliculaID: String!
    var pelicula: PeliculaClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadPelicula(id: peliculaID)
    }
    
    func LoadPelicula(id: String){
        Task {
            do {
                pelicula = try await PeliculasProvider.findPeliculaBy(id: id)
                DispatchQueue.main.async {
                    self.MostrarPelicula()
                }
            } catch {
                print(error)
            }
        }
    }
    
    func MostrarPelicula(){
        Poster.loadFrom(url: pelicula.Poster)
        Titulolbl.text = pelicula.Title
        Directorlbl.text = pelicula.Director
        Paislbl.text = pelicula.Year
        Generolbl.text = pelicula.Genre
        Duracionlbl.text = pelicula.Runtime
        aniolbl.text = pelicula.Year
        SinopsisText.text = pelicula.Plot
    }
}
