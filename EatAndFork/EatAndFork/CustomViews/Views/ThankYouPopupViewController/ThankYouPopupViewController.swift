//
//  ThankYouPopupViewController.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import UIKit

final class ThankYouPopupViewController: UIViewController {

    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        backButton.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
    }

    @IBAction private func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}
