const path = require('path');
const ForkTsCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const Dotenv = require('dotenv-webpack');

module.exports = ({ outputFile, assetFile, envFilePath, assetPath }) => {
  return {
    entry: {
      // pages/htmlfile: html's tsfile
      index: path.resolve(__dirname, '../src/pages/index.ts'),
      'sample/index': path.resolve(__dirname, '../src/pages/sample/index.ts'),
    },
    output: {
      filename: `./js/${outputFile}.js`,
      path: path.resolve(__dirname, '../dist'),
    },
    plugins: [
      // Type Checker
      new ForkTsCheckerWebpackPlugin(),
      // Extract CSS not bundled with js
      new MiniCssExtractPlugin({
        filename: `./css/${outputFile}.css`,
      }),
      // .env
      new Dotenv({ path: envFilePath }),
    ],
    module: {
      rules: [
        {
          enforce: 'pre',
          test: /\.(ts|js)$/,
          use: 'eslint-loader',
          exclude: /node_modules/,
        },
        {
          test: /\.(ts|js)$/,
          // use babel-load to transpile ts to js
          // use ForkTsCheckerWebpackPlugin to check type
          use: 'babel-loader',
          exclude: /node_modules/,
        },
        {
          test: /\.s[ac]ss$/i,
          use: [
            // from bottom to upper
            // Extract CSS not bundled with js
            MiniCssExtractPlugin.loader,
            // Translates CSS into CommonJS
            'css-loader',
            // auto-prefix
            'postcss-loader',
            // Compiles Sass to CSS
            'sass-loader',
          ],
        },
        {
          test: /\.css$/i,
          use: [
            // from bottom to upper
            // Extract CSS not bundled with js
            MiniCssExtractPlugin.loader,
            // Translates CSS into CommonJS
            'css-loader',
            // auto-prefix
            'postcss-loader',
          ],
        },
        {
          // Static file
          test: /\.(png|svg|jpe?g|gif)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: `${assetFile}.[ext]`,
                outputPath: 'assets/images/',
                publicPath: `${assetPath}assets/images/`,
              },
            },
          ],
        },
        {
          test: /\.(ttf|woff2?)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: `${assetFile}.[ext]`,
                outputPath: 'assets/fonts/',
                publicPath: `${assetPath}assets/fonts/`,
              },
            },
          ],
        },
        {
          test: /\.html$/,
          use: ['html-loader'],
        },
      ],
    },
    resolve: {
      // You can import by absolute path
      alias: {
        '@ts': path.resolve(__dirname, '../src/ts'),
        '@scss': path.resolve(__dirname, '../src/scss'),
        '@assets': path.resolve(__dirname, '../src/assets'),
      },
      extensions: ['.ts', '.js'],
    },
  };
};
