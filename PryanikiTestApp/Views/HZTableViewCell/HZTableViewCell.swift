//
//  HZTableViewCell.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/5/21.
//

import UIKit

class HZTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var hzLabel: UILabel!
    
    // MARK: - Methods
    func setup(data: Data) {
        hzLabel.text = data.text
        
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
