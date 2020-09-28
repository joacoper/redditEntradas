//
//  TableViewCell.swift
//  redditEntradas
//
//  Created by Joaquin Perez Mano on 26/09/2020.
//  Copyright © 2020 Joaquin Perez Mano. All rights reserved.
//

import UIKit

class TableViewCellX: UITableViewCell {
    
    
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var autorLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
 
    @IBOutlet weak var subreddit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
