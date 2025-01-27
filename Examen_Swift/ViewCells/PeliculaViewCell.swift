//
//  PeliculaViewCell.swift
//  Examen_Swift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class PeliculaViewCell: UITableViewCell {

    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblPelicula: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render (pelicula: PeliculaClass){
        lblPelicula.text = "\(pelicula.Title) (\(pelicula.Year))"
        imgPelicula.loadFrom(url: pelicula.Poster)
    }
}

