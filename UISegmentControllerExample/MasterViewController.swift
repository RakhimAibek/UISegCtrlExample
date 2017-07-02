//
//  MasterViewController.swift
//  UISegmentControllerExample
//
//  Created by Aibek Rakhim on 7/2/17.
//  Copyright © 2017 ibek inc. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var segmentController: UISegmentedControl!
    
    //MARK: EngLanViewController setuping
    lazy var EngLanViewController: EngLanVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "EngLanVC") as! EngLanVC
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    
    //MARK: KazLanViewController setuping
    lazy var KazLangViewController: KazLangVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "KazLangVC") as! KazLangVC
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        setupSegmentControl()
        updateView()
    }
    
    private func updateView() {
        EngLanViewController.view.isHidden = !(segmentController.selectedSegmentIndex == 0)
        KazLangViewController.view.isHidden = !(segmentController.selectedSegmentIndex == 1)
    }
    
    private func setupSegmentControl() {
        segmentController.removeAllSegments()
        segmentController.insertSegment(withTitle: "English", at: 0, animated: false)
        segmentController.insertSegment(withTitle: "Kazakh", at: 1, animated: false)
        segmentController.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        segmentController.selectedSegmentIndex = 0
    }
    
    //MARK: - Actions
    func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
        addChildViewController(childViewController)
        
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: self)
    }
    
    
}

