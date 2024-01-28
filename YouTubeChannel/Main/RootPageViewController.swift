//
//  RootPageViewController.swift
//  YouTubeChannel
//
//  Created by Yader Campbell on 14/7/23.
//

import UIKit

class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewControllers()
    }
    
    private func setupViewControllers(){
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelsViewController(),
            AboutViewController(),
        ]
        
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex(index : Int, direction : NavigationDirection, animated : Bool = true){
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
}

extension RootPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: <#T##UIViewController#>) ?? 0
        
        if index <= 0 {
            return nil
        }
        
        return subViewControllers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: <#T##UIViewController#>) ?? 0
        
        if index >= (subViewControllers.count-1) {
            return nil
        }
        
        return subViewControllers[index-1]
    }
}
