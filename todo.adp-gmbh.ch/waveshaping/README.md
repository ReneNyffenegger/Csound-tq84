# Waveshaping (Csound)

The basic principle of waveshaping is this formula: `sig = f(g(t))`. The output
signal (sig) is the result of a function (f) applied on the result of another
function (`g`). The input for the latter function (`g`) is for example the time (`t`).
`f()` is called the transfer function

The output signal is clearly dependent on `f()`, `g()`, and - importantly - the
**amplitude** of `g()`. Usually, the larger the amplitude of g(), the more the final
signal is distorted. 

The ingredients for waveshaping are `table` (or `tablei`), *gen routine 13* and *gen routine 4*.
