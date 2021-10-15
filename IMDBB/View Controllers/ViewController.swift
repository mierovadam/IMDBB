import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var indexSelected:IndexPath!
    
    private var movieViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovies()

        tableView.delegate = self
    }
    
    private func loadMovies() {
        movieViewModel.fetchPopularMoviesData { [weak self] in
            self?.tableView.dataSource = (self!)
            self?.tableView.reloadData()
        }
    }
    
    //Prepare movie info screen when cell selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetail" {
            let controller = segue.destination as! MovieViewController
            
            controller.movie = movieViewModel.movieAtRow(indexPath: indexSelected)

            let cell = tableView.cellForRow(at: indexSelected) as! MovieTableViewCell
            controller.image = cell.moviePoster.image
        }
    }
}

// MARK: - TableView
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.countMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = movieViewModel.movieAtRow(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath
        self.performSegue(withIdentifier: "MovieDetail", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //if end of the tableview reached, load another page
        if indexPath.row == movieViewModel.countMovies() - 1 {
            loadMovies()
        }
    }
    
}

