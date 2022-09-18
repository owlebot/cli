console.log("== TESTS ==");

console.log(process.env.DEFAULT);
if (process.env.DEFAULT !== "DEFAULT") {
	throw new Error("Incorrect env parsing");
}
console.log(process.env.ENV);
if (process.env.ENV !== "ENV") {
	throw new Error("Incorrect env parsing");
}
console.log(process.env.OVERRIDE);
if (process.env.OVERRIDE !== "OVERRIDE_ENV") {
	throw new Error("Incorrect env parsing");
}
