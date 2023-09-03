//
//  LaunchListView.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import UIKit

final class LaunchListView: UIView {
    
    private let viewModel = LaunchesListViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LaunchCollectionViewCell.self, forCellWithReuseIdentifier: LaunchCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray
        addSubViews(collectionView, spinner)
        addSpinnerConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.getLaunhesList()
        setUpCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addSpinnerConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        
        ])
    }
    
    private func setUpCollectionView () {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension LaunchListView: LaunchesListViewModelDelegate {
    func didLoadIntialLaunches() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            self.collectionView.alpha = 1
        }

    }
}
