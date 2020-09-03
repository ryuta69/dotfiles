const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#10100c", /* black   */
  [1] = "#61602C", /* red     */
  [2] = "#6C6E32", /* green   */
  [3] = "#716B48", /* yellow  */
  [4] = "#8A7649", /* blue    */
  [5] = "#7A8535", /* magenta */
  [6] = "#9B9945", /* cyan    */
  [7] = "#c5c1a3", /* white   */

  /* 8 bright colors */
  [8]  = "#898772",  /* black   */
  [9]  = "#61602C",  /* red     */
  [10] = "#6C6E32", /* green   */
  [11] = "#716B48", /* yellow  */
  [12] = "#8A7649", /* blue    */
  [13] = "#7A8535", /* magenta */
  [14] = "#9B9945", /* cyan    */
  [15] = "#c5c1a3", /* white   */

  /* special colors */
  [256] = "#10100c", /* background */
  [257] = "#c5c1a3", /* foreground */
  [258] = "#c5c1a3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
