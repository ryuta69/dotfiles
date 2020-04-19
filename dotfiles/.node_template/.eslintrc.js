module.exports = {
	"extends": [
		"plugin:prettier/recommended"
	],
	"plugins": ["prettier"],
	rules: {
		"prettier/prettier": "error",
		comma-dangle: [ "error", "consistent" ],
		array-element-newline : ["error", {"multiline": true}]
	},
};
