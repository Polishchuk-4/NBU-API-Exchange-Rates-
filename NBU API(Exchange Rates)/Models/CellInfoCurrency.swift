//
//  CellMainController.swift
//  NBU Api
//
//  Created by Denis Polishchuk on 10.10.2022.
//

import UIKit

class CellInfoCurrency: UITableViewCell {
    static let height: CGFloat = UIScreen.main.bounds.height * 0.05
    var labelName: UILabel!
    var labelNumber: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createLabel()
        self.createLabelNumber()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabel() {
        self.labelName = UILabel()
        self.labelName.frame.size.width = UIScreen.main.bounds.width * 0.8 - CGFloat.offset * 2
        self.labelName.frame.size.height = CellInfoCurrency.height - CGFloat.offset * 2
        self.labelName.frame.origin = CGPoint(x: CGFloat.offset, y: CGFloat.offset)
        self.labelName.font = UIFont.systemFont(ofSize: CellInfoCurrency.height / 2, weight: .light)
        self.labelName.textColor = .black
//        self.labelName.backgroundColor = .blue
        self.contentView.addSubview(self.labelName)
    }
    
    private func createLabelNumber() {
        self.labelNumber = UILabel()
        self.labelNumber.frame.size.width = UIScreen.main.bounds.width * 0.2 - CGFloat.offset * 2
        self.labelNumber.frame.size.height = self.labelName.frame.height
        self.labelNumber.frame.origin.x = self.labelName.frame.origin.x + self.labelName.frame.width + CGFloat.offset
        self.labelNumber.frame.origin.y = self.labelName.frame.origin.y
        self.labelNumber.font = self.labelName.font
        self.labelNumber.textAlignment = .left
//        self.labelNumber.backgroundColor = .red
        self.contentView.addSubview(self.labelNumber)
    }
}
