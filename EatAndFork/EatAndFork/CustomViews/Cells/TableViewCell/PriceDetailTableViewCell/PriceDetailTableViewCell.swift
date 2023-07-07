//
//  PriceDetailTableViewCell.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import UIKit

enum DetailStyle {
    case normal, bold
}

struct PriceDetailViewModel: Hashable {
    let title: String
    let price: String
    let style: DetailStyle
}

final class PriceDetailTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PriceDetailTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(viewModel: PriceDetailViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        switch viewModel.style {
        case .normal:
            titleLabel.font = UIFont(name: "Mitr-Light", size: 14.0)
        case .bold:
            titleLabel.font = UIFont(name: "Mitr-Medium", size: 14.0)
        }
    }
    
}
