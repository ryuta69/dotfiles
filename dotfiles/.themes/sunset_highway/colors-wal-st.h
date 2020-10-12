const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#100f0b", /* black   */
  [1] = "#AC9569", /* red     */
  [2] = "#737C81", /* green   */
  [3] = "#789BC3", /* yellow  */
  [4] = "#A2A5A2", /* blue    */
  [5] = "#BBC1BE", /* magenta */
  [6] = "#E3D1AF", /* cyan    */
  [7] = "#bfcfde", /* white   */

  /* 8 bright colors */
  [8]  = "#85909b",  /* black   */
  [9]  = "#AC9569",  /* red     */
  [10] = "#737C81", /* green   */
  [11] = "#789BC3", /* yellow  */
  [12] = "#A2A5A2", /* blue    */
  [13] = "#BBC1BE", /* magenta */
  [14] = "#E3D1AF", /* cyan    */
  [15] = "#bfcfde", /* white   */

  /* special colors */
  [256] = "#100f0b", /* background */
  [257] = "#bfcfde", /* foreground */
  [258] = "#bfcfde",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
