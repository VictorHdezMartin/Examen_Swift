//
//  MainViewController.swift
//  Examen_Swift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var PeliculasTableView: UITableView!
    
    var PeliculasList: [Peliculas] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PeliculasTableView.dataSource = self
        
     // vemos la barra de búsqueda  -----------------------------------------------
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
// funciones del TableView  ----------------------
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PeliculasList.count
    }
                
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PeliculaViewCell
        let peliculas = PeliculasList[indexPath.item]
        cell.render(pelicula: peliculas)
        return cell
    }
    
// movernos a otro ViewController pasando parámetros --------------------------------------------------
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDetalle") {
            let DetalleViewController = segue.destination as! DetalleViewController
            let indexPath = PeliculasTableView.indexPathForSelectedRow!
            let PeliculaClass = PeliculasList[indexPath.row]
                
            DetalleViewController.peliculaID = PeliculaClass.imdbID
            PeliculasTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
// Barra de búsqueda: OnChange  ------------------------------------------------------------------------
                
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
        if let query = searchBar.text {
           findPeliculaBy(name: query)
        }
    }
    
// Búsqueda de Categoría por nombre ---------------------------------------------------------------
                
    func findPeliculaBy(name: String) {
        Task {
            do {
                PeliculasList = try await PeliculasProvider.findPeliculasBy(name: name)
                DispatchQueue.main.async {
                    self.PeliculasTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
            

}
