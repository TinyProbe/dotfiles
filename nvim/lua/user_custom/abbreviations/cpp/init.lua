vim.cmd([[
inoreabbrev $<cpp_random>
\ template <class T>
\<NL>T __rand(T mnm, T mxm) {
\<NL>static std::mt19937 gen((std::random_device())());
\<NL>return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
\<NL>}
]])
