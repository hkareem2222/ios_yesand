//
//  ConversationViewController.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 7/24/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.layer.borderColor = UIColor.lightGrayColor().CGColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 4.0
        textView.clipsToBounds = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue else {
            return
        }
        UIView.animateWithDuration(self.animationDurationFromKeyboardNotification(notification),
                                   delay: 0, options: self.animationCurveFromKeyboardNotification(notification),
                                   animations: { [weak self] in
                                    self?.bottomConstraint.constant = keyboardFrame.height
        }, completion: nil)
    }

    func keyboardWillHide(notification: NSNotification) {
        UIView.animateWithDuration(self.animationDurationFromKeyboardNotification(notification),
                                   delay: 0, options: self.animationCurveFromKeyboardNotification(notification),
                              animations: { [weak self] in
            self?.bottomConstraint.constant = 0.0
        }, completion: nil)
    }

    private func animationDurationFromKeyboardNotification(notification: NSNotification) -> Double {
        return notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
    }

    private func animationCurveFromKeyboardNotification(notification: NSNotification) -> UIViewAnimationOptions {
        let curveValue = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        return UIViewAnimationOptions(rawValue: curveValue << 16)
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    @IBAction func closeVC(sender: AnyObject) {
        textView.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func sendPressed(sender: AnyObject) {

    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}