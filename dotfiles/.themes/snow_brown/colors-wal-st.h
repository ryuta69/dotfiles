const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#131514", /* black   */
  [1] = "#758675", /* red     */
  [2] = "#A08E70", /* green   */
  [3] = "#C89F73", /* yellow  */
  [4] = "#798D86", /* blue    */
  [5] = "#A3A698", /* magenta */
  [6] = "#CFBFA8", /* cyan    */
  [7] = "#e3e2e0", /* white   */

  /* 8 bright colors */
  [8]  = "#9e9e9c",  /* black   */
  [9]  = "#758675",  /* red     */
  [10] = "#A08E70", /* green   */
  [11] = "#C89F73", /* yellow  */
  [12] = "#798D86", /* blue    */
  [13] = "#A3A698", /* magenta */
  [14] = "#CFBFA8", /* cyan    */
  [15] = "#e3e2e0", /* white   */

  /* special colors */
  [256] = "#131514", /* background */
  [257] = "#e3e2e0", /* foreground */
  [258] = "#e3e2e0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
