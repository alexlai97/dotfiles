const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#2b131f", /* black   */
  [1] = "#a36960", /* red     */
  [2] = "#ca8961", /* green   */
  [3] = "#f6d05d", /* yellow  */
  [4] = "#6b74a9", /* blue    */
  [5] = "#be8e83", /* magenta */
  [6] = "#e49a5f", /* cyan    */
  [7] = "#f9c9ab", /* white   */

  /* 8 bright colors */
  [8]  = "#7f3e61",  /* black   */
  [9]  = "#e67a6d",  /* red     */
  [10] = "#feaf67", /* green   */
  [11] = "#fefe63", /* yellow  */
  [12] = "#7887ec", /* blue    */
  [13] = "#feaa93", /* magenta */
  [14] = "#fec967", /* cyan    */
  [15] = "#fed0d0", /* white   */

  /* special colors */
  [256] = "#2b131f", /* background */
  [257] = "#fed0d0", /* foreground */
  [258] = "#fed0d0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
