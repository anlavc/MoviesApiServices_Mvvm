//
//  HomeViewModel.swift
//  MVVM-MovieApp
//
//  Created by Anıl AVCI on 19.10.2022.
//

import Foundation
protocol HomeViewModelInterface {
    
   
    func viewDidLoad()
    func getMovies()
}
final class HomeViewModel {

    
    // Servis ile bu kısımdan haberleşme sağlanır.
    private let service = MovieService()
    var movies: [MovieResult] = []
    
}
extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
       
        getMovies()
        
    }
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self =  self else { return }
            guard let returnedMovies = returnedMovies else { return }
            self.movies = returnedMovies
            print(returnedMovies)
        }
    }
}
