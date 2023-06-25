//
//  InfoPageViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/19/23.
//

import UIKit

class InfoPageViewController: UIViewController {

    
    let infoScreen = InfoPageView()
    
    var infoPages = [InfoPage]()
    
    var infoDirectory = [JournalingPageViewController(), MeditationViewController(), WordsOfAffirmationViewController()]
    
    override func loadView() {
           view = infoScreen
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let journalingImage = UIImageView()
        journalingImage.image = UIImage(named: "journaling")
        
        let meditationImage = UIImageView()
        meditationImage.image = UIImage(named: "meditation-2")
        
        
        let wordsOfAffirmationImage = UIImageView()
        wordsOfAffirmationImage.image = UIImage(named: "words-of-affirmation")
        
        title = "Information Page"
        
        infoPages.append(InfoPage(title: "Journaling", image: journalingImage))
        infoPages.append(InfoPage(title: "Meditation", image: meditationImage))
        infoPages.append(InfoPage(title: "Words of Affirmation", image: wordsOfAffirmationImage))
        
        infoScreen.tableViewInfoPage.delegate = self
        infoScreen.tableViewInfoPage.dataSource = self
               
       
        
        // Do any additional setup after loading the view.
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

extension InfoPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoPages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infopage", for: indexPath) as! InfoPageTableViewCell
        cell.labelText.text = infoPages[indexPath.row].title
        cell.imageCell.image = infoPages[indexPath.row].image!.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempScreen = infoDirectory[indexPath.row]
        navigationController?.pushViewController(tempScreen, animated: true)
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
    
    
}
