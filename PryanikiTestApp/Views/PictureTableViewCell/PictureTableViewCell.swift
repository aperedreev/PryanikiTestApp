//
//  PictureTableViewCell.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/5/21.
//

import UIKit
import Kingfisher

class PictureTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureLabel: UILabel!
    
    // MARK: - Methods
    func setup(data: Data) {
        
        if let url = data.url {
            let imageUrl = URL(string: url)
            pictureImageView.kf.setImage(with: imageUrl)
        }
        
        pictureLabel.text = data.text
    }
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
