function processInput(input: string): string;
function processInput(input: number): string;
function processInput(input: boolean): string;
function processInput(input: any): string {
    if (typeof input === "string") {
        return `You entered a string: ${input}`;
    } else if (typeof input === "number") {
        return `You entered a number: ${input}`;
    } else if (typeof input === "boolean") {
        return `You entered a boolean: ${input}`;
    }
    return `Invalid type`;
}

// Usage
console.log(processInput("World")); // You entered a string: World
console.log(processInput(100));     // You entered a number: 100
console.log(processInput(false));   // You entered a boolean: false
