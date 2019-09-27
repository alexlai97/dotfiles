const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#272524", /* black   */
  [1] = "#c6bcb9", /* red     */
  [2] = "#ad8f83", /* green   */
  [3] = "#ad7258", /* yellow  */
  [4] = "#c5b29d", /* blue    */
  [5] = "#7977ab", /* magenta */
  [6] = "#a598a5", /* cyan    */
  [7] = "#c9c8c8", /* white   */

  /* 8 bright colors */
  [8]  = "#5d5b5a",  /* black   */
  [9]  = "#c6bcb9",  /* red     */
  [10] = "#ad8f83", /* green   */
  [11] = "#ad7258", /* yellow  */
  [12] = "#c5b29d", /* blue    */
  [13] = "#7977ab", /* magenta */
  [14] = "#a598a5", /* cyan    */
  [15] = "#c9c8c8", /* white   */

  /* special colors */
  [256] = "#272524", /* background */
  [257] = "#c9c8c8", /* foreground */
  [258] = "#c9c8c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
