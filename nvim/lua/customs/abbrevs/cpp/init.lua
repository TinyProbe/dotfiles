vim.cmd([[

iabbrev $<cpp_random>
\ template <class T>
\<nl>T random__(T mnm, T mxm) {
\<nl>  static std::mt19937 gen((std::random_device())());
\<nl>  return (std::uniform_int_distribution<T>(mnm, mxm))(gen);
\<nl>}
\<esc><space>=

iabbrev $<cpp_class_template>
\ #ifndef CLASSNAME_HPP_
\<nl>#define CLASSNAME_HPP_
\<nl>
\<nl>class ClassName {
\<nl> public:
\<nl>  explicit ClassName();
\<nl>  explicit ClassName(ClassName const &rhs) noexcept;
\<nl>  virtual ClassName &operator=(ClassName const &rhs) noexcept;
\<nl>  virtual ~ClassName() noexcept;
\<nl>
\<nl>  virtual ClassName clone() const;
\<nl>
\<nl> protected:
\<nl>  struct Inner {
\<nl>
\<nl>    explicit Inner();
\<nl>    explicit Inner(Inner const &rhs);
\<nl>    virtual Inner &operator=(Inner const &rhs);
\<nl>  } *ownership;
\<nl>
\<nl> private:
\<nl>  explicit ClassName(ClassName *const &ownership) noexcept;
\<nl>  virtual void ownershipCheck() const;
\<nl>};
\<nl>
\<nl>#endif
\<esc><space>=

]])
