//
//  ItemListTableViewCell.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import UIKit

struct ItemViewModel: Hashable {
    let imageUrl: String
    let name: String
    let price: String
    let numberOfItem: String?
}

final class ItemListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var menuImageView: UIImageView!
    @IBOutlet private weak var menuLabel: UILabel!
    @IBOutlet private weak var numberOfItemView: UIView!
    @IBOutlet private weak var numberOfItemLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    static let reuseIdentifier = "ItemListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        numberOfItemView.layer.cornerRadius = 8
        menuImageView.layer.cornerRadius = 8
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
