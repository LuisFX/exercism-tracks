// const sum = (numbers: number[]): number => numbers.reduce((acc: number, n: number) => acc + n, 0)

const getDigits = (num:number): number [] => {
    if (num < 10)
        return [ num ]
    else
        var a = getDigits(Math.trunc(num / 10))
        a.unshift(num % 10)
        return a
}

export default class Numbers {
    static isArmstrongNumber = (num:number) : boolean => {
        const digits = getDigits(num)
        const calc = digits.map((d:number) => {
            return Math.pow(d, digits.length) 
        }).reduce((acc: number, n: number) => acc + n, 0)
        return calc === num
    }
}

//Top Starred
export class ArmstrongNumbers {
    static isArmstrongNumber(number: number) {
        return number === number
            .toString()
            .split('')
            .reduce(
                (acc, item, _, arr) => acc + Math.pow(Number(item), arr.length)
                , 0
            )
    }
}