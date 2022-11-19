//
//  CellMainController.swift
//  NBU Api
//
//  Created by Denis Polishchuk on 10.10.2022.
//

import UIKit

class CellInfoCurrency: UITableViewCell {
    static let height: CGFloat = UIScreen.main.bounds.height * 0.05
    var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabel() {
        self.label = UILabel()
        self.label.frame.size.width = UIScreen.main.bounds.width - CGFloat.offset * 2
        self.label.frame.size.height = CellInfoCurrency.height - CGFloat.offset * 2
        self.label.frame.origin = CGPoint(x: CGFloat.offset, y: CGFloat.offset)
        self.label.font = UIFont.systemFont(ofSize: CellInfoCurrency.height / 2, weight: .light)
        self.label.textColor = .black
        self.label.clipsToBounds = true
        self.contentView.addSubview(self.label)
    }
}
