//
//  TableViewCell.swift
//  test-tableview-dropdown-menu
//
//  Created by Vitaliy Ribachenko on 2/14/17.
//  Copyright © 2017 Vitaliy Ribachenko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var editViewHeightConstraint: NSLayoutConstraint!
    
    var selectedViewHeight:CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectedViewHeight = editViewHeightConstraint.constant
        editViewHeightConstraint.constant = 0
    }
    
    override func prepareForReuse() {
        editViewHeightConstraint.constant = 0
        super.prepareForReuse()
    }
    
    func toggleSelected(_ selected: Bool) {
        let constant = selected ? self.selectedViewHeight : 0
        self.editViewHeightConstraint.constant = constant
        self.layoutIfNeeded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.toggleSelected(selected)
        })
        
        super.setSelected(selected, animated: animated)
    }

}
