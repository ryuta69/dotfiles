module.exports = {
	"env": {
		"es6": true,
		"node": true
	},
	"extends": [
		"eslint:recommended",
		"standard",
		"plugin:prettier/recommended"
	],
	"plugins": ["prettier"],
	rules: {
		"prettier/prettier": [
			"error", {
				"arrowParens": "always",
				"bracketSpacing": true,
				"printWidth": 100,
				"semi": false,
				"singleQuote": true
			}
		],
		comma-dangle: [ "error", "consistent" ],
		array-element-newline : ["error", {"multiline": true}]
	},
};
