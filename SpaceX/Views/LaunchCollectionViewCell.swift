//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import UIKit

final class LaunchCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "LaunchCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: LaunchCollectionViewCellViewModel) {
        
    }
}
