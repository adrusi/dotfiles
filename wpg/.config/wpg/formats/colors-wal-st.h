const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0f0f1a", /* black   */
  [1] = "#476A90", /* red     */
  [2] = "#92385F", /* green   */
  [3] = "#A6648F", /* yellow  */
  [4] = "#97556F", /* blue    */
  [5] = "#C46E9D", /* magenta */
  [6] = "#809277", /* cyan    */
  [7] = "#9dcecc", /* white   */

  /* 8 bright colors */
  [8]  = "#97556f",  /* black   */
  [9]  = "#476A90",  /* red     */
  [10] = "#92385F", /* green   */
  [11] = "#A6648F", /* yellow  */
  [12] = "#97556F", /* blue    */
  [13] = "#C46E9D", /* magenta */
  [14] = "#809277", /* cyan    */
  [15] = "#9dcecc", /* white   */

  /* special colors */
  [256] = "#0f0f1a", /* background */
  [257] = "#9dcecc", /* foreground */
  [258] = "#9dcecc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
