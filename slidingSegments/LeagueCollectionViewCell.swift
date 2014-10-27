//
//  LeagueCollectionViewCell.swift
//  slidingSegments
//
//  Created by vr on 10/26/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btn: UIButton!
    
    var path:NSIndexPath = NSIndexPath()
    
    var deleagate:CollectionViewScroller?

    @IBAction func buttonClicked(sender: UIButton) {
        self.deleagate?.clickedOnButton(path)
    }
    
}
