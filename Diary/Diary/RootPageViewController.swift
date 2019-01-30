//
//  RootPageViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/29/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "Page1")
        let vc2 = sb.instantiateViewController(withIdentifier: "Page2")
        
        return [vc1,vc2]
        
    }()
    
    
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of : viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard  viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of : viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllerList.count !=  nextIndex else {return nil}
        guard   viewControllerList.count >  nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 100,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width - 200 ,height: 50))
        self.pageControl.numberOfPages = viewControllerList.count
        self.pageControl.currentPage = 0
        self.pageControl.backgroundColor=UIColor.white
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        
        self.view.addSubview(pageControl)
    }
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewControllerList.index(of: pageContentViewController)!
    }
}


