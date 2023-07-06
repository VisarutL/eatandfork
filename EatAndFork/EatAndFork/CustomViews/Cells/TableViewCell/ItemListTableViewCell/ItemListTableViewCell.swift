//
//  ItemListTableViewCell.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import UIKit

final class ItemListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var menuImageView: UIImageView!
    @IBOutlet private weak var menuLabel: UILabel!
    @IBOutlet private weak var numberOfItemView: UIView!
    @IBOutlet private weak var numberOfItemLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    static let reustIdentifier = "ItemListTableViewCell"
    
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
    
    func setupData(menu: MenuItem) {
        menuImageView.downloaded(from: menu.imageUrl, contentMode: .scaleAspectFill)
        menuLabel.text = menu.name
        priceLabel.text = "฿ \(menu.price)"
    }
    
}
