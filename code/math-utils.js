class MathUtils {
    // Mathematical Functions
    static add(x, y) {
        return x + y;
    }

    static subtract(x, y) {
        return x - y;
    }

    static multiply(x, y) {
        return x * y;
    }

    static divide(x, y) {
        if (y !== 0) return x / y;
        throw new Error("Cannot divide by zero");
    }

    static pow(base, exponent) {
        return Math.pow(base, exponent);
    }

    // Array Functions
    static sum(array) {
        return array.reduce((acc, val) => acc + val, 0);
    }

    static max(array) {
        return Math.max(...array);
    }

    static min(array) {
        return Math.min(...array);
    }

    static unique(array) {
        return [...new Set(array)];
    }

    static flatten(array) {
        return array.reduce((acc, val) => acc.concat(Array.isArray(val) ? this.flatten(val) : val), []);
    }

    // Set Functions
    static union(setA, setB) {
        return new Set([...setA, ...setB]);
    }

    static intersection(setA, setB) {
        return new Set([...setA].filter(x => setB.has(x)));
    }

    static difference(setA, setB) {
        return new Set([...setA].filter(x => !setB.has(x)));
    }
}

module.exports = MathUtils;

