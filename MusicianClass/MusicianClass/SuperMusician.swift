//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Agah Berkin Güler on 18.02.2023.
//

import Foundation

class SuperMusician : Musicians {
    func sing2(){
        print("Enter Night")
    }
    override func sing() {
        super.sing()
        print("Exit Light")
    }
}
