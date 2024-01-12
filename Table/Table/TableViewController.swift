//
//  TableViewController.swift
//  Table
//
//  Created by 엄승주 on 1/12/24.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기" ]
var itemImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // set edit button for table list
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // set text of delete UI
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)-> String?{
        return "삭제"
    }
    
    // reload table when open page
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // number of table section
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // num of rows of table
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // select cell 
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            //delete data of text and image
            items.remove(at: (indexPath as NSIndexPath).row)
            itemImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            //delete UI compo
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // store selected row
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemImageFile[(fromIndexPath as NSIndexPath).row]
        
        //delete data of text and image origin data
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // use segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // from
            let cell = sender as! UITableViewCell
            // set index of click data
            let indexPath = self.tvListView.indexPath(for: cell)
            
            // make let for destination (=DetailViewController)
            let detailView = segue.destination as! DetailViewController
            
            //call getData (-> set index text) of DetailViewController
            detailView.getData(items[((indexPath! as NSIndexPath).row)])
        }
    }
    

}
