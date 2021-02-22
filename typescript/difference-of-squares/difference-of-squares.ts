class Squares {
    public squareOfSum : number
    public sumOfSquares : number
    public difference : number
    constructor (private readonly num : number) {
        this.squareOfSum  = Array.from(Array(this.num + 1)
            .keys())
            .reduce((a:number, b:number) : number => { return a + b; })
            ** 2

        this.sumOfSquares = Array.from(Array(this.num + 1)
            .keys())
            .map((a:number) : number => {return a **2 })
            .reduce((a:number, b:number)=> {return a + b})
        
        this.difference = this.squareOfSum - this.sumOfSquares
    }    
}

export default Squares

const squares = new Squares(5)

console.log(squares.squareOfSum)
console.log(squares.squareOfSum === 225)

console.log(squares.sumOfSquares)
console.log(squares.sumOfSquares === 55)

console.log(squares.difference)
console.log(squares.difference === 170)

