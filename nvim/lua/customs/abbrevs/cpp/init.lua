vim.cmd([[

iabbrev $<cpp_random>
\ template <class T>
\<nl>T __rand(T mnm, T mxm) {
\<nl>  static std::mt19937 gen((std::random_device())());
\<nl>  return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
\<nl>}
\<esc><space>=

iabbrev $<cpp_class_template>
\ #pragma once
\<nl>#ifndef CLASSNAME_HPP
\<nl>#define CLASSNAME_HPP
\<nl>
\<nl>class ClassName {
\<nl>
\<nl>public:
\<nl>  ClassName() {}
\<nl>  ClassName(ClassName const &rhs) { *this = rhs; }
\<nl>  virtual ClassName &operator=(ClassName const &rhs) {
\<nl>    if (this == &rhs) { return *this; }
\<nl>    return *this;
\<nl>  }
\<nl>  virtual ~ClassName() {}
\<nl>
\<nl>};
\<nl>
\<nl>#endif
\<esc><space>=

]])
