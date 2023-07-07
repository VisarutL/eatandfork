//
//  GridItemCollectionViewCell.swift
//  EatAndFork
//
//  Created by Visarut on 6/7/2566 BE.
//

import UIKit

final class GridItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var menuImageView: UIImageView!
    @IBOutlet private weak var menuLabel: UILabel!
    @IBOutlet private weak var numberOfItemView: UIView!
    @IBOutlet private weak var numberOfItemLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    static let reuseIdentifier = "GridItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        numberOfItemView.layer.cornerRadius = 8
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        numberOfItemView.isHidden = true
    }
    
    func setupData(viewModel: ItemViewModel) {
        menuImageView.downloaded(from: viewModel.imageUrl, contentMode: .scaleAspectFill)
        menuLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        if let numberOfItem = viewModel.numberOfItem, numberOfItem.isEmpty == false {
            numberOfItemView.isHidden = false
            numberOfItemLabel.text = numberOfItem
        } else {
            numberOfItemView.isHidden = true
        }
    }

}
