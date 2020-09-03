const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#190c0d", /* black   */
  [1] = "#DB745B", /* red     */
  [2] = "#FBAC3B", /* green   */
  [3] = "#F08D6B", /* yellow  */
  [4] = "#744989", /* blue    */
  [5] = "#A8658D", /* magenta */
  [6] = "#EDA29D", /* cyan    */
  [7] = "#ecd4d3", /* white   */

  /* 8 bright colors */
  [8]  = "#a59493",  /* black   */
  [9]  = "#DB745B",  /* red     */
  [10] = "#FBAC3B", /* green   */
  [11] = "#F08D6B", /* yellow  */
  [12] = "#744989", /* blue    */
  [13] = "#A8658D", /* magenta */
  [14] = "#EDA29D", /* cyan    */
  [15] = "#ecd4d3", /* white   */

  /* special colors */
  [256] = "#190c0d", /* background */
  [257] = "#ecd4d3", /* foreground */
  [258] = "#ecd4d3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
