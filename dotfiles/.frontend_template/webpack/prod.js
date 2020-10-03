const path = require('path');
const { merge } = require('webpack-merge');
const commonConfig = require('./common');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const TerserWebpackPlugin = require('terser-webpack-plugin');
const OptimizeCssPlugin = require('optimize-css-assets-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

const outputFile = '[name].[chunkhash]';
const assetFile = '[name].[contenthash]';
// Change where static file
const assetPath = '/';

module.exports = (env) => {
  const envFilePath = env ? `./env/.${env.file}` : './env/.production';
  const createHtmlPlugins = (entry) => {
    const htmpPlugins = [new CleanWebpackPlugin()];
    Object.keys(entry).forEach((key) => {
      htmpPlugins.push(
        new HtmlWebpackPlugin({
          template: path.resolve(__dirname, `../src/pages/${key}.html`),
          filename: `./pages/${key}.html`,
          inject: 'body',
          minify: {
            collapseWhitespace: true,
            removeComments: true,
            removeRedundantAttributes: true,
            removeScriptTypeAttributes: true,
            removeStyleLinkTypeAttributes: true,
            useShortDoctype: true,
          },
          chunks: [key],
        })
      );
    });
    return htmpPlugins;
  };
  return merge(
    commonConfig({ outputFile, assetFile, envFilePath, assetPath }),
    {
      mode: 'production',
      plugins: createHtmlPlugins(
        commonConfig({ outputFile, assetFile, envFilePath, assetPath }).entry
      ),
      optimization: {
        minimizer: [
          new TerserWebpackPlugin({
            terserOptions: {
              compress: { drop_console: true },
            },
          }),
          new OptimizeCssPlugin(),
        ],
      },
    }
  );
};
