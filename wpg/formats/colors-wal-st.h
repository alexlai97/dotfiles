const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#162119", /* black   */
  [1] = "#72aa80", /* red     */
  [2] = "#5ba4a6", /* green   */
  [3] = "#75aec6", /* yellow  */
  [4] = "#5a9bc5", /* blue    */
  [5] = "#a6bac7", /* magenta */
  [6] = "#4e83ac", /* cyan    */
  [7] = "#c4c7c5", /* white   */

  /* 8 bright colors */
  [8]  = "#505852",  /* black   */
  [9]  = "#72aa80",  /* red     */
  [10] = "#5ba4a6", /* green   */
  [11] = "#75aec6", /* yellow  */
  [12] = "#5a9bc5", /* blue    */
  [13] = "#a6bac7", /* magenta */
  [14] = "#4e83ac", /* cyan    */
  [15] = "#c4c7c5", /* white   */

  /* special colors */
  [256] = "#162119", /* background */
  [257] = "#c4c7c5", /* foreground */
  [258] = "#c4c7c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
