//
//  File.swift
//  SAP
//
//  Created by Alon Mileguir on 2/17/23.
//

import Foundation
func characterToUnicodeValue(_ c: Character)->Int{
    let s = String(c)
    return Int(s.unicodeScalars[s.unicodeScalars.startIndex].value)
}

func unicodeValueToCharacter(_ n: Int)->Character{
    return Character(UnicodeScalar(n)!)
}
