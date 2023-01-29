const fs = require("node:fs");
const path  = require("node:path");

const dotenv = require("dotenv");

const CWD = process.argv[2];

// ["local", "docker]
const ENV = process.argv[3];

console.log("ENV: ", ENV);

let CWD_ROOT = CWD;
while (!fs.existsSync(path.join(CWD_ROOT, "package.json") ) ) {
	CWD_ROOT = path.join(CWD_ROOT, "..");
}
console.log("ROOT: ", CWD_ROOT);

if (ENV === "local") {
	console.log("Loading globals...");
	// Load globals (endpoints)
	const pathToMain = path.join(CWD_ROOT, "../../main/");
	dotenv.config( { path: path.join(pathToMain, "env/.env") } );
}

// Load locals default
console.log("Loading local defaults...");
const defaultEnv = path.join(CWD_ROOT, "./.env.defaults");
fs.existsSync(defaultEnv) && dotenv.config( { path: defaultEnv } );


// Load locals override
console.log("Loading locals...");
const localEnv = path.join(CWD_ROOT, "./.env");
fs.existsSync(localEnv) && dotenv.config( { path: localEnv, override: true } );
