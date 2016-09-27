//
//  RestaurantViewController.swift
//  View
//
//  Created by Giáp Trần on 9/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit
import ViewModel
import DGElasticPullToRefresh
import Material

class RestaurantViewController: TableViewController {
    
    // MARK: Property
    
    override var viewModelDelegate: ViewModelDelegate? {
        return viewModel
    }
    
    var viewModel: RestaurantViewModel?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshLoading()
        
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 373
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantCell", forIndexPath: indexPath)

        return cell
    }

    @IBAction func refresh(sender: AnyObject) {
//        viewModel?.showSignInCommand()
    }
    
    // MARK: Private method
    
    private func setupRefreshLoading() {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.whiteColor()
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] _ in
           
            self?.tableView.dg_stopLoading()
            
        
        }, loadingView: loadingView)
        
        tableView.dg_setPullToRefreshFillColor(UIColor.appTintColor)
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
