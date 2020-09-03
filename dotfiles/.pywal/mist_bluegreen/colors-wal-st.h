const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#191e22", /* black   */
  [1] = "#3B5D85", /* red     */
  [2] = "#637291", /* green   */
  [3] = "#3F8180", /* yellow  */
  [4] = "#708D94", /* blue    */
  [5] = "#9DA4A6", /* magenta */
  [6] = "#BDBEBD", /* cyan    */
  [7] = "#e3e0dc", /* white   */

  /* 8 bright colors */
  [8]  = "#9e9c9a",  /* black   */
  [9]  = "#3B5D85",  /* red     */
  [10] = "#637291", /* green   */
  [11] = "#3F8180", /* yellow  */
  [12] = "#708D94", /* blue    */
  [13] = "#9DA4A6", /* magenta */
  [14] = "#BDBEBD", /* cyan    */
  [15] = "#e3e0dc", /* white   */

  /* special colors */
  [256] = "#191e22", /* background */
  [257] = "#e3e0dc", /* foreground */
  [258] = "#e3e0dc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
