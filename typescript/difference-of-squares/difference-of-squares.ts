// class Squares {
//     public squareOfSum : number
//     public sumOfSquares : number
//     public difference : number
//     constructor (private readonly num : number) {
//         this.squareOfSum  = Array.from(Array(this.num + 1)
//             .keys())
//             .reduce((a:number, b:number) : number => { return a + b; })
//             ** 2

//         this.sumOfSquares = Array.from(Array(this.num + 1)
//             .keys())
//             .map((a:number) : number => {return a **2 })
//             .reduce((a:number, b:number)=> {return a + b})
        
//         this.difference = this.squareOfSum - this.sumOfSquares
//     }    
// }

// export default Squares


export default class {
    squareOfSum: number;
    sumOfSquares: number;
    difference: number;

    constructor(n: number) {
        let sum = n * (n + 1) / 2;
        this.squareOfSum = sum * sum;
        this.sumOfSquares = n * (n + 1) * (2 * n + 1) / 6;
        this.difference = this.squareOfSum - this.sumOfSquares;
    }
}


// const range = (count: number): number[] => Array(count).fill(1).map((n: number, i: number) => n + i);
// const sum = (numbers: number[]): number => numbers.reduce((acc: number, n: number) => acc + n, 0);

// const power = 2;

// export default class Squares {
//     constructor(private count: number) {
//     }

//     get squareOfSums(): number {
//         return Math.pow(sum(range(this.count)), power);
//     }

//     get sumOfSquares(): number {
//         return sum(range(this.count).map((n: number) => Math.pow(n, power)));
//     }

//     get difference(): number {
//         return this.squareOfSums - this.sumOfSquares;
//     }
// }