const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101811", /* black   */
  [1] = "#718964", /* red     */
  [2] = "#037C83", /* green   */
  [3] = "#4F7C83", /* yellow  */
  [4] = "#038E91", /* blue    */
  [5] = "#25A09F", /* magenta */
  [6] = "#5EA9A5", /* cyan    */
  [7] = "#b3d7d4", /* white   */

  /* 8 bright colors */
  [8]  = "#7d9694",  /* black   */
  [9]  = "#718964",  /* red     */
  [10] = "#037C83", /* green   */
  [11] = "#4F7C83", /* yellow  */
  [12] = "#038E91", /* blue    */
  [13] = "#25A09F", /* magenta */
  [14] = "#5EA9A5", /* cyan    */
  [15] = "#b3d7d4", /* white   */

  /* special colors */
  [256] = "#101811", /* background */
  [257] = "#b3d7d4", /* foreground */
  [258] = "#b3d7d4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
