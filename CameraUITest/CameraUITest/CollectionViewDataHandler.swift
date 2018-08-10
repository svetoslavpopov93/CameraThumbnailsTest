//
//  CollectionViewDataHandler.swift
//  Socourt
//
//  Created by Svetoslav Popov on 30.05.18.
//  Copyright © 2018 Socourt. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDataHandler : DataHandler {
    var collectionView: UICollectionView!
}

extension CollectionViewDataHandler : UICollectionViewSetupable {
    @objc func setupCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func setup(with presenter: UIViewController, collectionView: UICollectionView) {
        self.presenter = presenter
        self.collectionView = collectionView
        
        setupCollectionView()
    }
}

// MARK: - UICollectionViewDelegate
extension CollectionViewDataHandler : UICollectionViewDelegate {}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewDataHandler : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Should be implemented by the subclasses
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Should be implemented bu the subclasses
        return 0
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewDataHandler : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Should be implemented from the child view controllers
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Should be implemented from the childs")
    }
}


protocol UICollectionViewSetupable {
    func setupCollectionView()
    func setup(with presenter: UIViewController, collectionView: UICollectionView)
}
