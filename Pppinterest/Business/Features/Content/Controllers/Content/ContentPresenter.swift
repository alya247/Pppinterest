//
//  ContentPresenter.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

protocol ContentView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setBoards(_ boards: [Board])
    func setPins(_ pins: [Pin])
    func setEmptyData()
}

class ContentPresenter {
    
    fileprivate let contentService: ContentService
    weak fileprivate var contentView: ContentView?
    
    init(contentService: ContentService = ContentService()) {
        self.contentService = contentService
    }
    
    func attachView(_ view: ContentView) {
        contentView = view
    }
    
    func getBoards() {
        contentView?.startLoading()
        contentService.getBoards() { [weak self] boards in
            self?.contentView?.finishLoading()
            if !boards.isEmpty {
                self?.contentView?.setBoards(boards)
            } else {
                self?.contentView?.setEmptyData()
            }
        }
    }
    
    func getPins() {
        contentView?.startLoading()
        contentService.getPins() { [weak self] pins in
            self?.contentView?.finishLoading()
            if !pins.isEmpty {
                self?.contentView?.setPins(pins)
            } else {
                self?.contentView?.setEmptyData()
            }
        }
    }
}
