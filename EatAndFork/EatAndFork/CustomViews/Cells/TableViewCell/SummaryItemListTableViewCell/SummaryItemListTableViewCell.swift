//
//  SummaryItemListTableViewCell.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import UIKit

struct SummaryItemListViewModel: Hashable {
    let imageUrl: String
    let numberOfItem: String
    let title: String
    let price: String
}

final class SummaryItemListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SummaryItemListTableViewCell"
    
    @IBOutlet private weak var menuImageView: UIImageView!
    @IBOutlet private weak var numberOfItemLabel: UILabel!
    @IBOutlet private weak var menuLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        menuImageView.layer.cornerRadius = 10
    }
    
    func setupData(viewModel: SummaryItemListViewModel) {
        menuImageView.downloaded(from: viewModel.imageUrl, contentMode: .scaleAspectFill)
        numberOfItemLabel.text = viewModel.numberOfItem
        menuLabel.text = viewModel.title
        priceLabel.text = viewModel.price
    }
    
}
