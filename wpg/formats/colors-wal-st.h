const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#221f1e", /* black   */
  [1] = "#bbb9b5", /* red     */
  [2] = "#8ea8b7", /* green   */
  [3] = "#c5a265", /* yellow  */
  [4] = "#6d97b7", /* blue    */
  [5] = "#ac9f99", /* magenta */
  [6] = "#4980ba", /* cyan    */
  [7] = "#c7c7c6", /* white   */

  /* 8 bright colors */
  [8]  = "#373230",  /* black   */
  [9]  = "#fff8d3",  /* red     */
  [10] = "#a3e0ff", /* green   */
  [11] = "#ffd76f", /* yellow  */
  [12] = "#7ac6ff", /* blue    */
  [13] = "#f4c6b1", /* magenta */
  [14] = "#4ea5ff", /* cyan    */
  [15] = "#fffffe", /* white   */

  /* special colors */
  [256] = "#221f1e", /* background */
  [257] = "#fffffe", /* foreground */
  [258] = "#fffffe",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
