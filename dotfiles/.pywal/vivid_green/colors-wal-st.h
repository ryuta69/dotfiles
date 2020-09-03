const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#081612", /* black   */
  [1] = "#1C8D27", /* red     */
  [2] = "#509738", /* green   */
  [3] = "#6A955A", /* yellow  */
  [4] = "#8E9B6D", /* blue    */
  [5] = "#A4A8A0", /* magenta */
  [6] = "#BEC0BD", /* cyan    */
  [7] = "#dfdfe0", /* white   */

  /* 8 bright colors */
  [8]  = "#9c9c9c",  /* black   */
  [9]  = "#1C8D27",  /* red     */
  [10] = "#509738", /* green   */
  [11] = "#6A955A", /* yellow  */
  [12] = "#8E9B6D", /* blue    */
  [13] = "#A4A8A0", /* magenta */
  [14] = "#BEC0BD", /* cyan    */
  [15] = "#dfdfe0", /* white   */

  /* special colors */
  [256] = "#081612", /* background */
  [257] = "#dfdfe0", /* foreground */
  [258] = "#dfdfe0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
