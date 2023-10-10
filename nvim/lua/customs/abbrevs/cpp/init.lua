vim.cmd([[

iabbrev $<cpp_random>
\ template <class T>
\<nl>T __random(T mnm, T mxm) {
\<nl>  static std::mt19937 gen((std::random_device())());
\<nl>  return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
\<nl>}
\<esc><space>=

iabbrev $<cpp_class_template>
\ #ifndef CLASSNAME_H_
\<nl>#define CLASSNAME_H_
\<nl>
\<nl>class ClassName {
\<nl> public:
\<nl>  ClassName();
\<nl>  ClassName(ClassName const &rhs);
\<nl>  virtual ClassName &operator=(ClassName const &rhs);
\<nl>  virtual ~ClassName();
\<nl>
\<nl> protected:
\<nl>
\<nl> private:
\<nl>
\<nl>}; // ClassName
\<nl>
\<nl>#endif // CLASSNAME_H_
\<esc><space>=

]])
