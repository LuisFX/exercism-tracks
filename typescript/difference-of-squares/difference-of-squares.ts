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

