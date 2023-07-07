//
//  SearchView.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func textFieldDidChangeSelection(_ textField: UITextField)
}

final class SearchView: UIView {

    @IBOutlet private var contentView: UIView!
    
    weak var delegate: SearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    private func setupUI() {
        loadNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.layer.cornerRadius = 8
        NSLayoutConstraint(item: contentView as Any, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView as Any, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView as Any, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView as Any, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.textFieldDidChangeSelection(textField)
    }
}
