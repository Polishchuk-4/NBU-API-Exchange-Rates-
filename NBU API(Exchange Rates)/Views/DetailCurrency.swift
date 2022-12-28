//
//  DetailCurrency.swift
//  NBU API(Exchange Rates)
//
//  Created by Denys Polishchuk on 28.12.2022.
//

import UIKit

class DetailCurrency: UIView {
    var labelName: UILabel!
    var labelRate: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.settingView()
        self.createLabelName()
        self.createLabelRate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingView() {
        self.frame.size.width = UIScreen.main.bounds.width - CGFloat.offset * 2
        self.frame.size.height = UIScreen.main.bounds.height * 0.2
        self.frame.origin.x = CGFloat.offset
        self.frame.origin.y = UIScreen.main.bounds.height / 2 - self.frame.height 
        self.backgroundColor = .gray
    }
    
    private func createLabelName() {
        self.labelName = UILabel()
        self.labelName.frame.size.width = self.frame.width
        self.labelName.frame.size.height = self.frame.height / 2
        self.labelName.font = UIFont.systemFont(ofSize: CellInfoCurrency.height / 2, weight: .light)
        self.labelName.textAlignment = .center
        self.addSubview(self.labelName)
    }

    private func createLabelRate() {
        self.labelRate = UILabel()
        self.labelRate.frame.size.width = self.labelName.frame.width
        self.labelRate.frame.size.height = self.labelName.frame.height
        self.labelRate.frame.origin.y = self.labelName.frame.origin.y + self.labelName.frame.height
        self.labelRate.font = UIFont.systemFont(ofSize: CellInfoCurrency.height / 2, weight: .light)
        self.labelRate.textAlignment = .center
        self.addSubview(self.labelRate)
    }
    
    deinit {
        print("deinit View")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
}
