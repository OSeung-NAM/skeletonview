//
//  BaseTableViewCell.swift
//  skeleton_view
//
//  Created by HanilNW on 5/9/24.
//

import UIKit
class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupViews()
        setupEvents()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupSubviews() {}
    func setupViews() {
        selectionStyle = .none
        backgroundColor = .white
    }
    func setupEvents() {}
}
