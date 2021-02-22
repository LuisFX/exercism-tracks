// class Words {
//     count (phrase:string) : Map<string, number> {
//         var out = new Map()
//         let words = phrase.trim().toLowerCase().split(/\s+/).forEach((w) => {
//             let v = out.get(w)
//             v != undefined
//             ? out.set(w, v + 1 ) 
//             : out.set(w, 1)
//         })

//         return out
//     }
// }

// export default Words


export default class Words {
    public count(input: string): Map<string, number> {
        return input
            .trim()
            .toLowerCase()
            .split(/\s+/)
            .reduce((map, word) => map.set(word, map.get(word) + 1 || 1), new Map());
    }
}