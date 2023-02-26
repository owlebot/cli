const fs = require("node:fs");
const path  = require("node:path");

const dotenv = require("dotenv");

const CWD = process.cwd();

let CWD_ROOT = CWD;
while (!fs.existsSync(path.join(CWD_ROOT, "package.json") ) ) {
	CWD_ROOT = path.join(CWD_ROOT, "..");
}
console.log("ROOT: ", CWD_ROOT);

// Load globals (endpoints)
console.log("Loading globals...");
const pathToMain = path.join(CWD_ROOT, "../../main/");
dotenv.config( { path: path.join(pathToMain, `env/.env.local`) } );

// Load locals default
console.log("Loading local defaults...");
const defaultEnv = path.join(CWD_ROOT, "./.env.defaults");
fs.existsSync(defaultEnv) && dotenv.config( { path: defaultEnv } );

// Load locals override
console.log("Loading locals...");
const localEnv = path.join(CWD_ROOT, "./.env");
fs.existsSync(localEnv) && dotenv.config( { path: localEnv, override: true } );
