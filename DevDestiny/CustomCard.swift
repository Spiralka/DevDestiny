//
//  CustomCard.swift
//  DevDestiny
//
//  Created by Евгений Фомин on 24.06.2024.
//

import Foundation
import UIKit

class CustomCard: SwipeCard {

    private let imageView: UIImageView

    init(image: UIImage) {
        self.imageView = UIImageView(image: image)
        super.init(frame: .zero)
        setupCard()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCard() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
}

