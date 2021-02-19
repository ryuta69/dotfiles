const path = require('path');
const { merge } = require('webpack-merge');
const commonConfig = require('./common');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const outputFile = '[name]';
const assetFile = '[name]';
const assetPath = '/';

module.exports = (env) => {
  // specied in package.json
  const envFilePath = env ? `./env/.${env.file}` : './env/.development';

  // create html specified in common
  const createHtmlPlugins = (entry) => {
    const htmpPlugins = [];
    Object.keys(entry).forEach((key) => {
      htmpPlugins.push(
        new HtmlWebpackPlugin({
          template: path.resolve(__dirname, `../src/pages/${key}.html`),
          filename: `${key}.html`,
          inject: 'body',
          chunks: [key],
        })
      );
    });
    return htmpPlugins;
  };

  return merge(
    commonConfig({ outputFile, assetFile, envFilePath, assetPath }),
    {
      mode: 'development',
      devtool: 'inline-source-map',
      plugins: createHtmlPlugins(
        commonConfig({ outputFile, assetFile, envFilePath, assetPath }).entry
      ),
      devServer: {
        contentBase: path.join(__dirname, 'dist'),
        open: "Google Chrome",
        host: 'localhost',
        compress: true,
        // port: 3000,
        watchOptions: {
          // ignore difference
          ignored: /node_modules/,
        },
      },
    }
  );
};
