import Foundation

class MovieViewModel {
    private var apiService = ApiService()
    private var moviesData = [Movie]()

    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        apiService.getMoviesData { [weak self] (result) in
            switch result {
            case .success(let listOf):
                if self?.moviesData != nil {
                    self?.moviesData += listOf.results
                }else {
                    self?.moviesData = listOf.results
                }
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }

    func countMovies() -> Int {
        if moviesData.count != 0 {
            return moviesData.count
        }
        return 0
    }
    
    func movieAtRow (indexPath: IndexPath) -> Movie {
        return moviesData[indexPath.row]
    }
    
    
}
