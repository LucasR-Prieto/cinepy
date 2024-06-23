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
        title.text = "Peliculas en Carteleta"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        getMovies()
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
    
    func addListMovies(movies: [Movie]) {
        let cardsView = CardsViewHome()
        cardsView.movies = movies
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let View1 :UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .yellow
            
            return view
            
        }()
        
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
        contentView.addSubview(cardsView)
        contentView.addSubview(View1)
        contentView.addSubview(View2)
        contentView.addSubview(View3)
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            cardsView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            cardsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardsView.heightAnchor.constraint(equalToConstant: 350),
            
            
            View1.topAnchor.constraint(equalTo: cardsView.bottomAnchor , constant: 20),
            View1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            View1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            View1.heightAnchor.constraint(equalToConstant: 200),
            
            
            View2.topAnchor.constraint(equalTo: View1.bottomAnchor , constant: 20),
            View2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            View2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            View2.heightAnchor.constraint(equalToConstant: 200),
            
            
            View3.topAnchor.constraint(equalTo: View2.bottomAnchor , constant: 20),
            View3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            View3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            View3.heightAnchor.constraint(equalToConstant: 200),
            View3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20) // This makes the bottom of cardsView 20 puntos por encima de contentView bottom


            
            
        ])
    }
}



