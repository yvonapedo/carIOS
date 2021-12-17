//
//  UsersTableViewController.swift
//  CarHttp
//
//  Created by mac09 on 2021/12/17.
//

import UIKit
import Alamofire

class UsersTableViewController: UITableViewController {

    let rootURL = rootAddress.ipAddUrl
    var userArray = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()

        getHttpServerUsersData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! UsersTableViewCell

        cell.lb_name.text = userArray[indexPath.row].username
        cell.lb_mobile.text = userArray[indexPath.row].mobile
        cell.setHttpImage(name: userArray[indexPath.row].photourl)
        print( userArray[indexPath.row].photourl)
//        cell.img_foto.image = getHttpImage(name: studentsArray[indexPath.row].photo)

        return cell
    }

    //pass data
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectUser = self.userArray[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: selectUser)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let detailvc = segue.destination as! UserTableViewController
            
            detailvc.user = sender as? User
              
        }
    }
    //
    func getHttpServerUsersData()   {
        let userURL = rootURL + "GetAllUsersServlet"
        let url = URL(string: userURL)
        let request = AF.request(url!, method: .get)
        request.responseDecodable(of: [User].self ) { (response) in
            if request.error == nil {
                if let array = response.value {
                
                    self.userArray = array
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
