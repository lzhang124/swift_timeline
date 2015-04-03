//
//  Person.swift
//  Timeline
//
//  Created by Larry Zhang on 4/3/15.
//  Copyright (c) 2015 Larry Zhang. All rights reserved.
//

import UIKit

class Person: UITableViewCell {

    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var name: UILabel!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
}
