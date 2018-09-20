//
//  TableViewCell.swift
//  RedditObjC
//
//  Created by Xavier on 9/20/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var upsLabel: UILabel!
    
    
    //landing Pad
    var post: XMWPost?{
        didSet{
            
        }
    }

    func updateView(){
        guard let posts = post else { return }
        titleLabel.text = posts.title
        upsLabel.text = "\(posts.ups)"
        commentCountLabel.text = "\(posts.commentCount)"
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
