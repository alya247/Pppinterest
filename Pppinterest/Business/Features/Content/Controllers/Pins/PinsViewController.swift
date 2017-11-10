//
//  PinsViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class PinsViewController: BaseViewController, NVActivityIndicatorViewable {
    
    // MARK: - IBOutlets
    
    @IBOutlet var pinsTableView: UITableView!
    
    // MARK: - Properties
    
    fileprivate let pinsPresenter = PinsPresenter()
    fileprivate var pins = [Pin]()
    var boardName = ""

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = boardName
        configureTableView()
        pinsPresenter.attachView(self)
        pinsPresenter.getPins(withBoardName: boardName)
    }
}

// MARK: - Private Methods

extension PinsViewController {
    
    fileprivate func configureTableView() {
        pinsTableView.rowHeight = UITableViewAutomaticDimension
        pinsTableView.estimatedRowHeight = 50
        registerCells()
    }
    
    fileprivate func registerCells() {
        pinsTableView.register(R.nib.pinCell)
    }
}

// MARK: - UITableViewDataSource

extension PinsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pinCell.identifier, for: indexPath) as! PinTableViewCell
        cell.fill(withPin: pins[indexPath.row])
        
        return cell
    }
}

//MARK: - PinsView

extension PinsViewController: PinsView {
    
    func startLoading() {
        startAnimating()
    }
    
    func finishLoading() {
        stopAnimating()
    }
    
    func setEmptyData() {
        print("Empty pins data")
    }
    
    func setPins(_ pins: [Pin]) {
        
        self.pins = pins
        pinsTableView.reloadData()
    }
}
