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
    @IBOutlet private weak var containerView: UIView!
    
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
        addSubview(contentView)
        containerView.layer.cornerRadius = 8
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.textFieldDidChangeSelection(textField)
    }
}
