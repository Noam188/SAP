//
//  VM.swift
//  SAP
//
//  Created by Alon Mileguir on 2/16/23.
//

import Foundation
struct SAP{
  // var memory:[Int]()
  var memory = doubles
  var rPC:Int
  var rCP:Int
  var rST:Int
  var registers = Array(repeating:0,count:10)
  // var vmStack = IntStack(size: 1000)

init(){
  rCP = 0
  rPC = 0
  rST = 0
}
  
  mutating func getNextByte()->Int{
  let byte = memory[rPC]
  rPC+=1
  return byte
}

 mutating func run(program:[Int],initialrPC:Int){
  rPC = initialrPC
  memory = program

 
  while program[rPC] != 0{
    doInStruction(program[rPC])
  }

}
  mutating func doInStruction(_ code:Int){
  switch code{
    case 1:getNextByte(); clrr(getNextByte())
    case 5:getNextByte(); movir(getNextByte(),getNextByte())
    case 6:getNextByte(); movrr(getNextByte(),getNextByte())
    case 8:getNextByte();movmr(getNextByte(),getNextByte())
   case 12:getNextByte(); addir(getNextByte(),getNextByte())
    case 13:getNextByte(); addrr(getNextByte(),getNextByte())
    case 34:getNextByte(); cmprr(getNextByte(),getNextByte())
    case 45:getNextByte(); outcr(getNextByte())
    case 49:getNextByte(); printi(getNextByte())
    case 55:getNextByte(); outs(getNextByte())
    case 57:getNextByte(); jmpne(getNextByte())
    default: ()
  }
  
}





//movir 5
  mutating func movir(_ num: Int, _ r1: Int) {
    registers[r1] = num
  }
//movrr 6
  mutating func movrr(_ r1: Int, _ r2: Int){
    registers[r2] = registers[r1]
  }
  //movmr 8
mutating func movmr(_ label:Int, _ r1:Int){
  registers[r1] = memory[label]
}
  //clrr 1
  mutating func clrr(_ r1:Int) {
    registers[r1] = 0
  }
//outcr 45
func outcr(_ r1:Int){
print(unicodeValueToCharacter(r1))
}

  //printi 49
  func printi(_ r1: Int){
      print(registers[r1], terminator: "")
  }
  //addrr 13
  mutating func addrr(_  r1:Int, _ r2:Int) {
    registers[r2] += registers[r1]
  }
  
  //outs 55
  func outs(_ label:Int){
    let characterCount = memory[label]
    var output = ""
    for i in label+1...characterCount+label{
      output+="\(unicodeValueToCharacter(memory[i]))"
    }
      print(output, terminator: "")
  }
  //addir 12
  mutating func addir(_ num: Int, _ r1: Int) {
    registers[r1] += num
  }
  
  //cmprr 34
  mutating func cmprr(_ r1:Int, _ r2:Int){
    rCP = registers[r1]-registers[r2]
  }
  //jmpne 57
 mutating func jmpne(_ label: Int) {
     if rCP != 0 {rPC = label}
   }
  //halt 0
    


  



}
