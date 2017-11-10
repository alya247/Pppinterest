//
//  ContentTableViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ContentTableViewController: BaseTableViewController, NVActivityIndicatorViewable {
    
    //MARK: - Properties
    
    fileprivate let contentPresenter = ContentPresenter()
    fileprivate var boards = [Board]()
    fileprivate var pins = [Pin]()
    fileprivate var contentType: ContentType = .boards
    
    enum ContentType: Int {
        case boards = 0
        case pins
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        contentPresenter.attachView(self)
        getContent()
    }
    
    // MARK: - Actions
    
    @IBAction func switchContentType(_ sender: UISegmentedControl) {
        contentType = ContentType(rawValue: sender.selectedSegmentIndex) ?? .boards
        getContent()
    }
    
    // MARK: - Private Methods
    
    fileprivate func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        registerCells()
    }
    
    fileprivate func registerCells() {
        tableView.register(R.nib.boardCell)
        tableView.register(R.nib.pinCell)
    }
    
    fileprivate func getContent() {
        
        switch contentType {
        case .boards:
            contentPresenter.getBoards()
        case .pins:
            contentPresenter.getPins()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch contentType {
        case .boards: return boards.count
        case .pins: return pins.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch contentType {
        case .boards:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.boardCell.identifier, for: indexPath) as! BoardTableViewCell
            cell.fill(withBoard: boards[indexPath.row])
            return cell
        case .pins:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pinCell.identifier, for: indexPath) as! PinTableViewCell
            cell.fill(withPin: pins[indexPath.row])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch contentType {
        case .boards:
            
            let pinsVC = R.storyboard.content.pinsVC()!
            pinsVC.boardName = boards[indexPath.row].name ?? ""
            
            navigationController?.pushViewController(pinsVC, animated: true)
        case .pins: return
        }
    }
}

//MARK: - ContentView

extension ContentTableViewController: ContentView {
    
    func startLoading() {
        startAnimating()
    }
    
    func finishLoading() {
        stopAnimating()
    }
    
    func setEmptyData() {
        print("Empty content data")
    }
    
    func setPins(_ pins: [Pin]) {
        
        self.pins = pins
        tableView.reloadData()
    }
    
    func setBoards(_ boards: [Board]) {
        
        self.boards = boards
        tableView.reloadData()
    }
}











