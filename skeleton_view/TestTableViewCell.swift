//
//  TestTableViewCell.swift
//  skeleton_view
//
//  Created by HanilNW on 5/9/24.
//

import UIKit
import SnapKit
import SkeletonView

class TestTableViewCell: BaseTableViewCell {
    
    private lazy var imageWrap: UIView = {
        let view: UIView = UIView()
        view.isSkeletonable = true
        view.skeletonCornerRadius = 10
        return view
    }()
    
    private lazy var titleLB: UILabel = {
        let label: UILabel = UILabel()
        label.text = "테스트"
        label.textColor = .black
        label.isSkeletonable = true
        label.linesCornerRadius = 5
        label.lastLineFillPercent = 100
        return label
    }()
    
    override func setupSubviews() {
        self.contentView.addSubview(imageWrap)
        self.contentView.addSubview(titleLB)
    }
    
    override func setupViews() {
        super.setupViews()
        self.isSkeletonable = true
        self.contentView.isSkeletonable = true
        
        imageWrap.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(50)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        titleLB.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(imageWrap.snp.trailing).offset(20)
            make.centerY.equalTo(imageWrap)
        }
    }
}
