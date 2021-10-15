import Foundation

class ApiService {
    private var pageRead = 1
    
    func getMoviesData(completion: @escaping (Result<Response, Error>) -> Void) {
            
        //Page progresses as user reaches end of the table
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=" + String(pageRead)

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }

            //Data recieved
            var results: Response?
            do {
                // Parse the data
                results = try JSONDecoder().decode(Response.self, from: data)

                self.pageRead += 1
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(results!))
                }
            } catch let error {
                print("failed to convert \(error.localizedDescription)")
                completion(.failure(error))
            }
            
        }).resume()
        
    }

}
