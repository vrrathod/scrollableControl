//
//  ViewController.swift
//  slidingSegments
//
//  Created by vr on 10/26/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

protocol CollectionViewScroller {
    func clickedOnButton( path:NSIndexPath ) -> Void;
}

class ViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewScroller{
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: variables
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    var items:[String] = ["item a","item b","item c","item d","item e","item f","item g","item h","item i","item j","item k","item l","item m","item n","item o","item p","item q","item r","item s","item t","item u","item v","item w","item x","item y","item z"]
    
    var nextVisibleItem:NSIndexPath = NSIndexPath();
    var lastHiddenItem:NSIndexPath = NSIndexPath();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// collection view ds
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: LeagueCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("LeagueCell", forIndexPath: indexPath) as LeagueCollectionViewCell
        cell.btn.setTitle(items[indexPath.row], forState: UIControlState.Normal)
        cell.path = indexPath
        cell.deleagate = self
        
        return cell;
    }
    
    func clickedOnButton(path: NSIndexPath) {
        self.collectionView.scrollToItemAtIndexPath(path, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    
    // content insets
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 100.0, bottom: 0.0, right: 100.0);
//        return UIEdgeInsetsZero;
    }
}

