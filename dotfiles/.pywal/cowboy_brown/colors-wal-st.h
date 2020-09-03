const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0C0A07", /* black   */
  [1] = "#976131", /* red     */
  [2] = "#936D38", /* green   */
  [3] = "#A27A42", /* yellow  */
  [4] = "#BB863E", /* blue    */
  [5] = "#B28A4B", /* magenta */
  [6] = "#A99061", /* cyan    */
  [7] = "#e0c8a7", /* white   */

  /* 8 bright colors */
  [8]  = "#9c8c74",  /* black   */
  [9]  = "#976131",  /* red     */
  [10] = "#936D38", /* green   */
  [11] = "#A27A42", /* yellow  */
  [12] = "#BB863E", /* blue    */
  [13] = "#B28A4B", /* magenta */
  [14] = "#A99061", /* cyan    */
  [15] = "#e0c8a7", /* white   */

  /* special colors */
  [256] = "#0C0A07", /* background */
  [257] = "#e0c8a7", /* foreground */
  [258] = "#e0c8a7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
