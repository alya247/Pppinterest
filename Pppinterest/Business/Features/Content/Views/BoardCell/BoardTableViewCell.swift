//
//  BoardTableViewCell.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nameLabel: UILabel!

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Public Methods

extension BoardTableViewCell {
    
    func fill(withBoard board: Board) {
        
        nameLabel.text = board.name
    }
}
