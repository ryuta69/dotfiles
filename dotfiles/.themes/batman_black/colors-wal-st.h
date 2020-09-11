const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#074E65", /* red     */
  [2] = "#054A74", /* green   */
  [3] = "#033886", /* yellow  */
  [4] = "#05538A", /* blue    */
  [5] = "#096A94", /* magenta */
  [6] = "#0A74A6", /* cyan    */
  [7] = "#7ebdcf", /* white   */

  /* 8 bright colors */
  [8]  = "#588490",  /* black   */
  [9]  = "#074E65",  /* red     */
  [10] = "#054A74", /* green   */
  [11] = "#033886", /* yellow  */
  [12] = "#05538A", /* blue    */
  [13] = "#096A94", /* magenta */
  [14] = "#0A74A6", /* cyan    */
  [15] = "#7ebdcf", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#7ebdcf", /* foreground */
  [258] = "#7ebdcf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
