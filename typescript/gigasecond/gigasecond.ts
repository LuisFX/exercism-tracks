class Gigasecond {
  readonly dateInput : Date
  constructor(dateInput: Date) {
    console.log("Constructor called: " + dateInput)
    this.dateInput = dateInput
  }

  date() {
    return new Date(this.dateInput.getTime() + 1000000000000)
  }
}

export default Gigasecond