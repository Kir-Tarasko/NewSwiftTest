//
//  AuthorsTableViewController.swift
//  NewSwiftTest
//
//  Created by Arslan Abdullaev on 08.01.2022.
//

import UIKit

class AuthorsTableViewController: UITableViewController {

    let authors = Author.getInfo()
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       authors.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        authors[section].fullname
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       2
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let author = authors[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0: content.text = "Посмотреть фото"
               
        default: content.text = "GitHub Логин: \(author.nickname)"
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = authors[indexPath.section].fullname
        let author = section[indexPath.row]
        let row = indexPath.row
        let sec = indexPath.section
        print(sec)
        print(row)
       
        showVC(from: indexPath)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        //guard let indexPath = tableView.indexPathForSelectedRow else { return }
       // let author = authors[indexPath.row]
        imageVC.authors = sender as? Author
    }
}

extension AuthorsTableViewController {
    private func showVC(from indexPath: IndexPath) {
        switch indexPath.section {
            case [0, 0]:
                performSegue(withIdentifier: "showPhoto", sender: nil)
            case [0, 1]:
                performSegue(withIdentifier: "", sender: nil)
            case [1, 0]:
                performSegue(withIdentifier: "showPhoto", sender: nil)
            case [1, 1]:
                performSegue(withIdentifier: "", sender: nil)
            default:
                break
            }
    }
}
