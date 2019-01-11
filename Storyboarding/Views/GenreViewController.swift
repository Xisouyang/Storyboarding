//
//  newViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let genreArray = [
        "Adventure",
        "Horror",
        "Romance",
        "Sci-Fi",
        "Mystery"
    ]
    
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var genreTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem?.tintColor = .white
        view.backgroundColor = .white

        // Initialize frame components of the tableview
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        // create and add tableview to the view
        genreTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        genreTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        genreTableView.separatorColor = .black
        genreTableView.delegate = self
        genreTableView.dataSource = self
        self.view.addSubview(genreTableView)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHeight2 = self.tableView(tableView, heightForRowAt: NSIndexPath(row: indexPath.row, section: indexPath.section) as IndexPath)
        let cell = CustomTableViewCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: cellHeight2), title: "test")
        cell.textLabel?.text = genreArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 70
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "Genres"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     let headerHeight: CGFloat = 70
        return headerHeight
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
