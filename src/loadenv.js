const fs = require("node:fs");
const path  = require("node:path");

const dotenv = require("dotenv");

const CWD = process.argv[2];
// eslint-disable-next-line no-unused-vars
const DIR_ROOT = process.argv[3];

// "local", "docker
const ENV = process.argv[4];

let CWD_ROOT = CWD;
while (!fs.existsSync(path.join(CWD, "package.json") ) ) {
	CWD_ROOT = path.join(CWD_ROOT, "..");
}

if (ENV === "local") {
	// Load globals (endpoints)
	const pathToMain = path.join(CWD_ROOT, "../../main/");
	dotenv.config( { path: path.join(pathToMain, "env/.env") } );
}

// Load locals default
const defaultEnv = path.join(CWD_ROOT, "./.env.defaults");
fs.existsSync(defaultEnv) && dotenv.config( { path: defaultEnv, override: true } );


// Load locals override
const localEnv = path.join(CWD_ROOT, "./.env");
fs.existsSync(localEnv) && dotenv.config( { path: localEnv, override: true } );
