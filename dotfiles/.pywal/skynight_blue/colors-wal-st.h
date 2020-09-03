const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#030616", /* black   */
  [1] = "#0E378A", /* red     */
  [2] = "#0C3DA2", /* green   */
  [3] = "#15488F", /* yellow  */
  [4] = "#1F5DA9", /* blue    */
  [5] = "#2E73BF", /* magenta */
  [6] = "#4689C1", /* cyan    */
  [7] = "#a5c5df", /* white   */

  /* 8 bright colors */
  [8]  = "#73899c",  /* black   */
  [9]  = "#0E378A",  /* red     */
  [10] = "#0C3DA2", /* green   */
  [11] = "#15488F", /* yellow  */
  [12] = "#1F5DA9", /* blue    */
  [13] = "#2E73BF", /* magenta */
  [14] = "#4689C1", /* cyan    */
  [15] = "#a5c5df", /* white   */

  /* special colors */
  [256] = "#030616", /* background */
  [257] = "#a5c5df", /* foreground */
  [258] = "#a5c5df",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
