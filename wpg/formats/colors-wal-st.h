const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#202123", /* black   */
  [1] = "#a96974", /* red     */
  [2] = "#acb5c7", /* green   */
  [3] = "#a498a7", /* yellow  */
  [4] = "#8b94ac", /* blue    */
  [5] = "#a98394", /* magenta */
  [6] = "#7189aa", /* cyan    */
  [7] = "#c7c7c8", /* white   */

  /* 8 bright colors */
  [8]  = "#6d6f76",  /* black   */
  [9]  = "#ed768b",  /* red     */
  [10] = "#c7e3ff", /* green   */
  [11] = "#e1b0ed", /* yellow  */
  [12] = "#a0b7f3", /* blue    */
  [13] = "#ef96be", /* magenta */
  [14] = "#80afef", /* cyan    */
  [15] = "#fefeff", /* white   */

  /* special colors */
  [256] = "#202123", /* background */
  [257] = "#fefeff", /* foreground */
  [258] = "#fefeff",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
