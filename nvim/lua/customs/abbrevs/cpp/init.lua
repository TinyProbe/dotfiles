vim.cmd([[

iabbrev $<cpp_random>
\ template <class T>
\<NL>T __rand(T mnm, T mxm) {
\<NL>static std::mt19937 gen((std::random_device())());
\<NL>return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
\<NL>}

iabbrev $<cpp_class_template>
\ #pragma once
\<NL>#ifndef CLASSNAME_HPP
\<NL>#define CLASSNAME_HPP
\<NL>
\<NL>class ClassName {
\<NL>
\<NL>public:
\<NL>ClassName() {}
\<NL>ClassName(ClassName const &rhs) { *this = rhs; }
\<NL>virtual ClassName &operator=(ClassName const &rhs) {
\<NL>if (this == &rhs) { return *this; }
\<NL>return *this;
\<NL>}
\<NL>virtual ~ClassName() {}
\<NL>
\<NL>};
\<NL>
\<NL>#endif

]])
