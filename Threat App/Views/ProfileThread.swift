//
//  ProfileThread.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-27.
//

import Foundation

enum ProfileThread:Int,CaseIterable,Identifiable{
    case threads 
    case replies
    var title: String{
        switch self{
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    var id: Int{return self.rawValue}
}
