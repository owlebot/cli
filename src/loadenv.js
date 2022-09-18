const fs = require("node:fs");
const path  = require("node:path");

const dotenv = require("dotenv");

const CWD = process.cwd();

const _dirname_ = __dirname;
const root = path.join(_dirname_, "../");

// Load globals (endpoints)
const pathToMain = path.join(root, "../main/");
dotenv.config( { path: path.join(pathToMain, "env/.env") } );


let cwdRoot = CWD;
while (!fs.existsSync(path.join(CWD, "package.json") ) ) {
	cwdRoot = path.join(cwdRoot, "..");
}

// Load locals default
const defaultEnv = path.join(cwdRoot, "./.env.defaults");
fs.existsSync(defaultEnv) && dotenv.config( { path: defaultEnv, override: true } );


// Load locals override
const localEnv = path.join(cwdRoot, "./.env");
fs.existsSync(localEnv) && dotenv.config( { path: localEnv, override: true } );
