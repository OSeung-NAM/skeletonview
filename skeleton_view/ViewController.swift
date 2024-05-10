//
//  ViewController.swift
//  skeleton_view
//
//  Created by HanilNW on 5/9/24.
//

import UIKit
import SnapKit
import SkeletonView

class ViewController: UIViewController {

    private lazy var listTV: UITableView = {
        let tableView: UITableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isSkeletonable = true
        let gradient = SkeletonGradient(baseColor: UIColor.clouds)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
        tableView.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        return tableView
    }()
    
    private var datas: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(listTV)
        listTV.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // view.showAnimatedGradientSkeleton()  기존 코드
        
//        let gradient = SkeletonGradient(baseColor: UIColor.carrot)
//        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
//        view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        
        // 개별 적용
//        self.view.showAnimatedGradientSkeleton()
//        listTV.showSkeleton()
//        labelContainer.showSkeleton()
//        skeletonCollectionView.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.view.hideSkeleton()
        }
    }
}

extension ViewController: SkeletonTableViewDataSource {
    
    // 테이블 뷰에 보여질 cell 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        return cell
    }

    // 보여질 스켈레톤 뷰 갯수
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 보여질 테이블 뷰 아이디
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "TestTableViewCell"

    }
}

extension ViewController: SkeletonTableViewDelegate {}
