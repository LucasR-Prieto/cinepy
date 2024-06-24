//
//  ViewController.swift
//  cinePY
//
//  Created by lucas on 2024-06-21.
//

import UIKit

class ViewController: UIViewController {
    let viewModel: HomeViewModel = HomeViewModel()
    
    private let titleView: UILabel = {
        let title = UILabel()
        title.text = "Peliculas en Cartelera"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    private let titlePopularsView: UILabel = {
        let title = UILabel()
        title.text = "Peliculas Populares"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    private let scrollContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerMoviePopular :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private let cardsViewNowPaying: CardsViewHome = {
        let view = CardsViewHome()
        view.widthCollection = 320
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let cardsViewMoviePopulars: CardsViewHome = {
        let view = CardsViewHome()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        getMovies()
        getMoviesPopulars()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollContainer)
        scrollContainer.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor) // This makes the contentView's width match the scrollView's width
        ])
    }
    
    func getMovies() {
        viewModel.getMovies(view: view) { result in
            switch result {
            case .success(let response):
                self.addListMovies(movies: response.results)
            case .failure(_):
                print("no funco")
            }
        }
    }
    
    func getMoviesPopulars() {
        viewModel.getMoviesPopulars(view: view) { result in
            switch result {
            case .success(let response):
                self.addListMoviesPopular(movies: response.results)
                print("dibujamos la pantalla de peliculas populares")
            case .failure(_):
                print("no funco")
            }
        }
        
    }
    
    func addListMoviesPopular (movies: [Movie]){
        self.containerMoviePopular.addSubview(self.cardsViewMoviePopulars)
        
        
        self.cardsViewMoviePopulars.movies = Array(movies.prefix(5))
        
        NSLayoutConstraint.activate([
            cardsViewMoviePopulars.topAnchor.constraint(equalTo: containerMoviePopular.topAnchor),
            cardsViewMoviePopulars.leadingAnchor.constraint(equalTo: containerMoviePopular.leadingAnchor),
            cardsViewMoviePopulars.trailingAnchor.constraint(equalTo: containerMoviePopular.trailingAnchor),
            cardsViewMoviePopulars.bottomAnchor.constraint(equalTo: containerMoviePopular.bottomAnchor)
        ])
        
        
    }
    
    func addListMovies(movies: [Movie]) {
        self.cardsViewNowPaying.movies = Array(movies.prefix(5))
                
        let View2 :UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .blue
            
            return view
            
        }()
        
        let View3 :UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            return view
            
        }()
        
        contentView.addSubview(titleView)
        contentView.addSubview(cardsViewNowPaying)
        contentView.addSubview(titlePopularsView)
        
        contentView.addSubview(containerMoviePopular)
        contentView.addSubview(View2)
        contentView.addSubview(View3)
        
        
        View2.isHidden = true
        View3.isHidden = true

        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            cardsViewNowPaying.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            cardsViewNowPaying.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardsViewNowPaying.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardsViewNowPaying.heightAnchor.constraint(equalToConstant: 250),
            
            titlePopularsView.topAnchor.constraint(equalTo: cardsViewNowPaying.bottomAnchor, constant: 20),
            titlePopularsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            
            containerMoviePopular.topAnchor.constraint(equalTo: titlePopularsView.bottomAnchor , constant: 20),
            containerMoviePopular.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerMoviePopular.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerMoviePopular.heightAnchor.constraint(equalToConstant: 250),
            
            
            View2.topAnchor.constraint(equalTo: containerMoviePopular.bottomAnchor , constant: 20),
            View2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            View2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            View2.heightAnchor.constraint(equalToConstant: 200),
            
            
            View3.topAnchor.constraint(equalTo: View2.bottomAnchor , constant: 20),
            View3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            View3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            View3.heightAnchor.constraint(equalToConstant: 200),
            View3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

            
        ])
    }
}



