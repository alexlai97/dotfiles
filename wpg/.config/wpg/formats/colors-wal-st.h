const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#231809", /* black   */
  [1] = "#b17b30", /* red     */
  [2] = "#c6aa47", /* green   */
  [3] = "#ab9d53", /* yellow  */
  [4] = "#c5bc6f", /* blue    */
  [5] = "#91ab67", /* magenta */
  [6] = "#67a97d", /* cyan    */
  [7] = "#c8c5c1", /* white   */

  /* 8 bright colors */
  [8]  = "#5a5146",  /* black   */
  [9]  = "#b17b30",  /* red     */
  [10] = "#c6aa47", /* green   */
  [11] = "#ab9d53", /* yellow  */
  [12] = "#c5bc6f", /* blue    */
  [13] = "#91ab67", /* magenta */
  [14] = "#67a97d", /* cyan    */
  [15] = "#c8c5c1", /* white   */

  /* special colors */
  [256] = "#231809", /* background */
  [257] = "#c8c5c1", /* foreground */
  [258] = "#c8c5c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
