const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#111a1f", /* black   */
  [1] = "#8D7856", /* red     */
  [2] = "#798362", /* green   */
  [3] = "#9B9257", /* yellow  */
  [4] = "#63768A", /* blue    */
  [5] = "#738C9C", /* magenta */
  [6] = "#6998B3", /* cyan    */
  [7] = "#c0c7ca", /* white   */

  /* 8 bright colors */
  [8]  = "#868b8d",  /* black   */
  [9]  = "#8D7856",  /* red     */
  [10] = "#798362", /* green   */
  [11] = "#9B9257", /* yellow  */
  [12] = "#63768A", /* blue    */
  [13] = "#738C9C", /* magenta */
  [14] = "#6998B3", /* cyan    */
  [15] = "#c0c7ca", /* white   */

  /* special colors */
  [256] = "#111a1f", /* background */
  [257] = "#c0c7ca", /* foreground */
  [258] = "#c0c7ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
