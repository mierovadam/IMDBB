//
//  MovieViewController.swift
//  IMDBB
//
//  Created by Adam Mierov on 12/10/2021.
//
import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UINavigationBar!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    
    var utils = Utils()

    var movie:Movie?
    var image:UIImage?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.topItem?.title = movie?.title
        movieRate.text = "\(movie?.vote_average ?? 0.0)"
        movieOverview.text = movie?.overview
        movieYear.text = utils.convertDateFormater(movie?.release_date)
        moviePoster.image = image
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
