//
//  AutoCellSize.swift
//  MyName
//
//  Created by Danielle Smith on 10/13/23.
//

import Foundation
import UIKit

class AutoSizeCell: UITableViewCell {
    var customLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        customLabel = UILabel()
        customLabel.numberOfLines = 0
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customLabel)
    }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
                customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])

            customLabel.setContentHuggingPriority(.required, for: .vertical)
            customLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        }
    func configure(withText text: String) {
        customLabel.text = text
    }
}
