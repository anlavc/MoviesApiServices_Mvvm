//
//  ViewController.swift
//  tableView
//
//  Created by Anıl AVCI on 10.04.2022.
//

import UIKit
protocol HomeScreenInteface: AnyObject {
    func configureVC()
    func reloadTableView()
    func navigateToDetailScreen(movie: MovieResult)
  
    
}
//Tablo oluştururken mutlaka eklenmesi gerekenler

//bir alt satırda UITableViewDelegate, UITableViewDataSource mutlaka eklenir
final class HomeScreen: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    private let viewModel = HomeViewModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        //bu iki satır viewcontrollera eşitlenir
        tableView.delegate = self
        tableView.dataSource = self
        
        //Landmark book data
        // isim için dizi tanımlandı
        
        navigationItem.title = "Populer Movies"   //BAŞLIK ATMA
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! TableViewCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.getDetail(id: viewModel.movies[indexPath.row]._id)
    }
    func configureCollectionView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func navigateToDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailScreen(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
}
extension HomeScreen: HomeScreenInteface {
    func reloadTableView() {
        tableView.reloadOnMainThread()
    }
    
    func configureVC() {
        
    }
    
    // pagination --> Kaydırma işlemi bittiğinde çalışan fonksiyon. sayfanın alt kısmına geldiğinde çalışır.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        if offsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
    }
    
}

