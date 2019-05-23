//
//  detailViewController.swift
//  Notes For LMY
//
//  Created by 彭世辰 on 2019/5/23.
//  Copyright © 2019 Peng Shichen. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    var note: NotesDB!
    @IBOutlet var noteTextView: UITextView!
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButon(sender: AnyObject){
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            if note == nil{
                note = NotesDB(context: appDelegate.persistentContainer.viewContext)
            }
            note.date = Date()
            note.title = "lmy"
            note.content = noteTextView.text
            
            appDelegate.saveContext()
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        if note != nil {
            noteTextView.text = note.content
        }
        super.viewDidLoad()
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
