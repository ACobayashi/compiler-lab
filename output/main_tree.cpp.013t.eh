
;; Function factorial (_Z9factoriali, funcdef_no=1731, decl_uid=44208, cgraph_uid=465, symbol_order=497)

long long int factorial (int n)
{
  int i;
  long long int result;
  long long int D.49124;

  result = 1;
  i = 2;
  goto <D.44215>;
  <D.44214>:
  _1 = (long long int) i;
  result = result * _1;
  i = i + 1;
  <D.44215>:
  if (i <= n) goto <D.44214>; else goto <D.44212>;
  <D.44212>:
  times.0_2 = times;
  _3 = times.0_2 + 1;
  times = _3;
  D.49124 = result;
  goto <D.49125>;
  <D.49125>:
  return D.49124;
}



;; Function main (main, funcdef_no=1732, decl_uid=44216, cgraph_uid=466, symbol_order=498)

int main ()
{
  struct basic_ostream & D.49132;
  struct __ostream_type & D.49131;
  int n;
  int D.49129;

  std::basic_istream<char>::operator>> (&cin, &n);
  n.1_1 = n;
  if (n.1_1 < 0) goto <D.49126>; else goto <D.49128>;
  <D.49128>:
  n.2_2 = n;
  if (n.2_2 > 20) goto <D.49126>; else goto <D.49127>;
  <D.49126>:
  D.49129 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.49134>;
  <D.49127>:
  n.3_3 = n;
  _4 = factorial (n.3_3);
  D.49131 = std::basic_ostream<char>::operator<< (&cout, _4);
  _5 = D.49131;
  std::basic_ostream<char>::operator<< (_5, endl);
  times.4_6 = times;
  D.49132 = std::basic_ostream<char>::operator<< (&cout, times.4_6);
  _7 = D.49132;
  std::basic_ostream<char>::operator<< (_7, endl);
  D.49129 = 0;
  goto <D.49134>;
  <D.49134>:
  n = {CLOBBER};
  goto <D.49130>;
  D.49129 = 0;
  goto <D.49130>;
  <D.49130>:
  return D.49129;
  <D.49133>:
  n = {CLOBBER};
  resx 1
}



;; Function __static_initialization_and_destruction_0 (_Z41__static_initialization_and_destruction_0ii, funcdef_no=2233, decl_uid=49116, cgraph_uid=967, symbol_order=1026)

void __static_initialization_and_destruction_0 (int __initialize_p, int __priority)
{
  if (__initialize_p == 1) goto <D.49136>; else goto <D.49137>;
  <D.49136>:
  if (__priority == 65535) goto <D.49138>; else goto <D.49139>;
  <D.49138>:
  std::ios_base::Init::Init (&__ioinit);
  __cxxabiv1::__cxa_atexit (__dt_comp , &__ioinit, &__dso_handle);
  goto <D.49140>;
  <D.49139>:
  <D.49140>:
  goto <D.49141>;
  <D.49137>:
  <D.49141>:
  return;
}



;; Function _GLOBAL__sub_I_times (_GLOBAL__sub_I_times, funcdef_no=2234, decl_uid=49122, cgraph_uid=968, symbol_order=1145)

void _GLOBAL__sub_I_times ()
{
  __static_initialization_and_destruction_0 (1, 65535);
  return;
}


