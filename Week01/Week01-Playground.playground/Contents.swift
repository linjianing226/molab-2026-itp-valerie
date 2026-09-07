//: Cat Walk Text Art

import Foundation

// Issue: Swift cannot use integer index directly like str[0].
// Fix: Use charAt helper to get character safely.

let floor = "▫️"
let items = "🧶🐟"

func charAt(_ str: String, _ offset: Int) -> String {
    let index = str.index(str.startIndex, offsetBy: offset)
    let char = str[index]
    return String(char)
}

func generateLine(_ width: Int, _ catPos: Int, _ symbol: String, _ itemCol: Int, _ item: String) {
    var line = ""
    for i in 0..<width {
        if i == catPos {
            line += symbol
        } else if i == itemCol {
            line += item
        } else {
            line += floor
        }
    }
    print(line)
}

func generateWalk(_ width: Int, _ steps: Int) {
    var pos = width / 2
    
    // 分别随机挑一行放置毛线球和小鱼干（全程各仅出现一次）
    let yarnStep = Int.random(in: 1...2)
    let fishStep = Int.random(in: 4...5)

    for step in 0..<steps {
        let symbol = (step == steps - 1) ? "🐱" : "🐾"
        var itemCol = -1
        var item = ""
        
        // 当走到对应步数时，在猫咪旁边的空地上放上物品
        if step == yarnStep {
            item = charAt(items, 0)
            itemCol = (pos + 2) % width
        } else if step == fishStep {
            item = charAt(items, 1)
            itemCol = (pos + width - 2) % width
        }
        
        generateLine(width, pos, symbol, itemCol, item)
        
        pos += Int.random(in: -1...1)
        if pos < 0 { pos = 0 }
        if pos >= width { pos = width - 1 }
    }
}

generateWalk(9, 8)
