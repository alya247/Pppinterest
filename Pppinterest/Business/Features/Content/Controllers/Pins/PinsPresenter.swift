//
//  PinsPresenter.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

protocol PinsView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setPins(_ pins: [Pin])
    func setEmptyData()
}

class PinsPresenter {
    
    fileprivate let pinsService: PinsService
    weak fileprivate var pinsView: PinsView?
    
    init(pinsService: PinsService = PinsService()) {
        self.pinsService = pinsService
    }
    
    func attachView(_ view: PinsView) {
        pinsView = view
    }
    
    func getPins(withBoardName boardName: String) {
        pinsView?.startLoading()
        pinsService.getPins(withBoardName: boardName) { [weak self] pins in
            self?.pinsView?.finishLoading()
            if !pins.isEmpty {
                self?.pinsView?.setPins(pins)
            } else {
                self?.pinsView?.setEmptyData()
            }
        }
    }
}
