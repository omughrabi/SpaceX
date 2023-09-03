//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import SwiftUI
import UIKit

final class LaunchCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "LaunchCollectionViewCell"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    private let flighUpcomingLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming: "
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0 // Allow multiple lines
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    private let upComing: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
            
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(imageView, nameLabel, flighUpcomingLabel, detailsLabel, upComing, dateLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([

            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            detailsLabel.heightAnchor.constraint(equalToConstant: 100),
            upComing.heightAnchor.constraint(equalToConstant: 50),
            upComing.widthAnchor.constraint(equalToConstant: 25),
            flighUpcomingLabel.heightAnchor.constraint(equalToConstant: 50),
            flighUpcomingLabel.widthAnchor.constraint(equalToConstant: 72),
            
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            
                        
//            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor),
            
            
//            upComing.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            upComing.leftAnchor.constraint(equalTo: flighUpcomingLabel.rightAnchor),
            upComing.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            upComing.bottomAnchor.constraint(equalTo: detailsLabel.topAnchor),
            
//            flighUpcomingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            flighUpcomingLabel.leftAnchor.constraint(equalTo: dateLabel.rightAnchor),
            flighUpcomingLabel.rightAnchor.constraint(equalTo: upComing.leftAnchor),
            flighUpcomingLabel.bottomAnchor.constraint(equalTo: detailsLabel.topAnchor),
            
            
//            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            dateLabel.rightAnchor.constraint(equalTo: flighUpcomingLabel.leftAnchor),
//            dateLabel.bottomAnchor.constraint(equalTo: detailsLabel.topAnchor),
            
            detailsLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            detailsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            detailsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            detailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

            
            
        ])
//        The below background I keep for reviewing the fields adjustments 
//        nameLabel.backgroundColor = .red
//        flighUpcomingLabel.backgroundColor = .blue
//        detailsLabel.backgroundColor = .orange
//        dateLabel.backgroundColor = .yellow
//        imageView.backgroundColor = .brown
//        upComing.backgroundColor = .cyan
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        upComing.image = nil
        detailsLabel.text = nil
        dateLabel.text = nil
    }
    
    public func configure(with viewModel: LaunchCollectionViewCellViewModel) {
        nameLabel.text = " \(viewModel.flightNumber) -  \(viewModel.launchName)"
        dateLabel.text = viewModel.launchDate
        detailsLabel.text = viewModel.launchDetails
        
        let image = UIImage(systemName: "circle.fill")?.withRenderingMode(.alwaysTemplate)

        if viewModel.upComing {
            upComing.tintColor = .green
        } else {
            upComing.tintColor = .red
        }
        
        upComing.image = image
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case.failure(let error):
                break
            }
        }
    }
}
