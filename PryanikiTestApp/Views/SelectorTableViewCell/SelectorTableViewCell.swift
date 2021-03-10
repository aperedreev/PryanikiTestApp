//
//  SelectorTableViewCell.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/5/21.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {

    // MARK: - Properties
    var data: Data?
    var delegate: SelectorDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var selectorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var selectorLabel: UILabel!
    
    // MARK: - Methods
    func setup(data: Data) {
        
        if let variants = data.variants {
            for variant in variants {
                selectorSegmentedControl.setTitle("\(variant.id)", forSegmentAt: variant.id - 1)
            }
            
            if let id = data.selectedId {
                selectorSegmentedControl.selectedSegmentIndex = id - 1
                selectorLabel.text = variants[id - 1].text
            }
        }
    
    }
    
    @IBAction func selectSegment(_ sender: Any) {
        delegate?.segmentTapped(from: selectorSegmentedControl, to: selectorLabel)
        
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
