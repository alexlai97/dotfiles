const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#221e1c", /* black   */
  [1] = "#ab9890", /* red     */
  [2] = "#aa7e6a", /* green   */
  [3] = "#aa6237", /* yellow  */
  [4] = "#aa7250", /* blue    */
  [5] = "#b08c47", /* magenta */
  [6] = "#6c7ea2", /* cyan    */
  [7] = "#c7c6c6", /* white   */

  /* 8 bright colors */
  [8]  = "#595654",  /* black   */
  [9]  = "#ab9890",  /* red     */
  [10] = "#aa7e6a", /* green   */
  [11] = "#aa6237", /* yellow  */
  [12] = "#aa7250", /* blue    */
  [13] = "#b08c47", /* magenta */
  [14] = "#6c7ea2", /* cyan    */
  [15] = "#c7c6c6", /* white   */

  /* special colors */
  [256] = "#221e1c", /* background */
  [257] = "#c7c6c6", /* foreground */
  [258] = "#c7c6c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
