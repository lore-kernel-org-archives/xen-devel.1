From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 272 v3 (CVE-2018-15470) -
 oxenstored does not apply quota-maxentity
Date: Mon, 20 Aug 2018 09:47:42 +0000
Message-ID: <E1frgmk-0003h1-Hq@xenbits.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org, xen-users@lists.xen.org, oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
List-Id: xen-devel@lists.xenproject.org

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2018-15470 / XSA-272
                              version 3

               oxenstored does not apply quota-maxentity

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

The logic in oxenstored for handling writes depended on the order of
evaluation of expressions making up a tuple.

As indicated in section 7.7.3 "Operations on data structures" of the
OCaml manual:

  http://caml.inria.fr/pub/docs/manual-ocaml/expr.html

the order of evaluation of subexpressions is not specified.  In
practice, different implementations behave differently.

IMPACT
======

oxenstored may not enforce the configured quota-maxentity.

This allows a malicious or buggy guest to write as many xenstore entries
as it wishes, causing unbounded memory usage in oxenstored.  This can
lead to a system-wide DoS.

VULNERABLE SYSTEMS
==================

Xen 4.1 and later are potentially vulnerable.

Only systems using the OCaml xenstored implementation are potentially
vulnerable.  Systems using the C xenstored implementation are not
vulnerable.

Whether the compiled oxenstored binary is vulnerable depends on which
compiler was used.  OCaml can be compiled either as bytecode (with
ocamlc) or as a native binary (with ocamlopt).

The following OCaml program demonstrates the issue, and identifies
whether the resulting oxenstored binary will skip the quota enforcement.

  $ cat order.ml
  let check () =
    let flag = ref false in
    let update _ = flag := true; () in
    List.iter update [1;2;3], !flag

  let main () =
    let _, flag = check () in
    if flag then
    print_endline "This code is not vulnerable!"
    else
    print_endline "This code is vulnerable!"

  let () = main ()

  $ ocamlc order.ml -o order.bytecode
  $ ./order.bytecode
  This code is vulnerable!
  $ ocamlopt order.ml -o order.native
  $ ./order.native
  This code is not vulnerable!

To confirm whether an OCaml binary is bytecode or native, use file.

  $ file order.bytecode
  order.bytecode: a /usr/bin/ocamlrun script executable (binary data)
  $ file order.native
  order.native: ELF 64-bit LSB executable, ...

NOTE: These results are applicable to OCaml 4.01.0-5 as distributed in
Debian Jessie.  These results are not representative of other versions
of OCaml, or of other OS distributions.

MITIGATION
==========

There are no mitigations available.

CREDITS
=======

This issue was discovered by Christian Lindig of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa272.patch           All versions of Xen

$ sha256sum xsa272*
0da953ca48d0cf0688ecff6a074304a9d2217871809a76ef26b9addeb66ecb3e  xsa272.meta
6e0359d89bf65794f16d39198cc90f5c3137bce4eb850e54625ab00e2c568c2c  xsa272.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJbeo4OAAoJEIP+FMlX6CvZCO8H/Rj7Z+rFSuQAVEUKXvvV3lvJ
rytocZDTAIduyiBundcbdkcxfCuun6Tqw8ScPJXtml82P8YE+R/ix1hMLcQdYblt
tj3qftb6KtjFibctoc0sSLsfjhl2oJC2VjQR3HdixfMlSxEzLkCC3I21fteYs9fp
ahO7dByNHFTufbb9GpB+DANmIJ5hwMXxCinvts/L2MP/CCRfb4w5+aTARCQ3UHpX
3/r2wJxLnf4sNpBhHNsArROy8wS+ad0i4XC2fef/Bdye+NRbeICJNqof9fcGjWwE
fZRyeNVSk33DuuRz2HI4aoEKAQ/v3b3KLXnfVZY5F5z6Z8j9rie42RI8VDO8Mzc=
=Y10L
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa272.meta"
Content-Disposition: attachment; filename="xsa272.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyNzIsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiLAogICAgIjQuNyIsCiAgICAiNC42IgogIF0sCiAgIlRyZWVz
IjogWwogICAgInhlbiIKICBdLAogICJSZWNpcGVzIjogewogICAgIjQuMTAi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogIjg3YzgzYWYzMzNlMDI0OGFkYTJlNjU2MDk2
NWFjYTYwOTZlYzdmMmIiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDI2OCwKICAgICAgICAgICAgMjY5CiAgICAgICAgICBdLAogICAg
ICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EyNzIucGF0Y2gi
CiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQu
MTEiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAg
ICAgICAgICAiU3RhYmxlUmVmIjogIjMzY2VkNzI1ZTExYWY0ZWFiZDMzMzRk
MTJmNTNlZDgwN2U5ZTI1ODYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAg
ICAgICAgICAgIDI2OCwKICAgICAgICAgICAgMjY5CiAgICAgICAgICBdLAog
ICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EyNzIucGF0
Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAg
IjQuNiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiOThkNzk0OGI1MGI0ZTkxZWM0ZWZh
ODYwZGEzMmQ5YWM0ZmU2OTMwMCIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsK
ICAgICAgICAgICAgMjY4LAogICAgICAgICAgICAyNjkKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI3Mi5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC43IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjog
ewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI5MWNhODRjODYyYjE1ZmU3NGFi
OWI1ODcwZTY2OTAzYWVjNGY4NmRkIiwKICAgICAgICAgICJQcmVyZXFzIjog
WwogICAgICAgICAgICAyNjgsCiAgICAgICAgICAgIDI2OQogICAgICAgICAg
XSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjcy
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwK
ICAgICI0LjgiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImFhNDUwMTUzZjJkOTYwYzIx
NzE0OWIzMWI2OGE4YjU3YzVhOGU1OTUiLAogICAgICAgICAgIlByZXJlcXMi
OiBbCiAgICAgICAgICAgIDI2OCwKICAgICAgICAgICAgMjY5CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ey
NzIucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhl
biI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYTFiMjIzYjc1NmYzNTQ4
OTU1MjUwNjBiZDNmOWYxZjA3ODk5YTA4MiIsCiAgICAgICAgICAiUHJlcmVx
cyI6IFsKICAgICAgICAgICAgMjY4LAogICAgICAgICAgICAyNjkKICAgICAg
ICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTI3Mi5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAg
IH0sCiAgICAibWFzdGVyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJhY2QwMGEzMDMz
NzhjZTQ4YmQ2YmJkOGE1NzlmMWZlMmYxYjIxYTdkIiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICAyNjgsCiAgICAgICAgICAgIDI2OQog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMjcyLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa272.patch"
Content-Disposition: attachment; filename="xsa272.patch"
Content-Transfer-Encoding: base64

RnJvbTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tPgpTdWJqZWN0OiB0b29scy9veGVuc3RvcmVkOiBNYWtlIGV2YWx1
YXRpb24gb3JkZXIgZXhwbGljaXQKCkluIFN0b3JlLnBhdGhfd3JpdGUoKSwg
UGF0aC5hcHBseV9tb2RpZnkoKSB1cGRhdGVzIHRoZSBub2RlX2NyZWF0ZWQK
cmVmZXJlbmNlIGFuZCBib3RoIHRoZSB2YWx1ZSBvZiBhcHBseV9tb2RpZnko
KSBhbmQgbm9kZV9jcmVhdGVkIGFyZQpyZXR1cm5lZCBieSBwYXRoX3dyaXRl
KCkuCgpBdCBsZWFzdCB3aXRoIE9DYW1sIDQuMDYuMSB0aGlzIGxlYWRzIHRv
IHRoZSB2YWx1ZSBvZiBub2RlX2NyZWF0ZWQgYmVpbmcKcmV0dXJuZWQgKmJl
Zm9yZSogaXQgaXMgdXBkYXRlZCBieSBhcHBseV9tb2RpZnkoKS4gIFRoaXMg
aW4gdHVybiBsZWFkcwp0byB0aGUgcXVvdGEgZm9yIGEgZG9tYWluIG5vdCBi
ZWluZyB1cGRhdGVkIGluIFN0b3JlLndyaXRlKCkuICBIZW5jZSwgYQpndWVz
dCBjYW4gY3JlYXRlIGFuIHVubGltaXRlZCBudW1iZXIgb2YgZW50cmllcyBp
biB4ZW5zdG9yZS4KClRoZSBmaXggaXMgdG8gbWFrZSBldmFsdWF0aW9uIG9y
ZGVyIGV4cGxpY2l0LgoKVGhpcyBpcyBYU0EtMjcyLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPgpSZXZpZXdlZC1ieTogUm9iIEhvZXMgPHJvYi5ob2VzQGNpdHJpeC5j
b20+CgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3Jl
Lm1sIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sCmluZGV4IDlm
NjE5YjhmZDUuLjhiMDcyN2Y4YTggMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1s
L3hlbnN0b3JlZC9zdG9yZS5tbAorKysgYi90b29scy9vY2FtbC94ZW5zdG9y
ZWQvc3RvcmUubWwKQEAgLTI1Nyw3ICsyNTcsOCBAQCBsZXQgcGF0aF93cml0
ZSBzdG9yZSBwZXJtIHBhdGggdmFsdWUgPQogCQlOb2RlLmNoZWNrX3Blcm0g
c3RvcmUucm9vdCBwZXJtIFBlcm1zLldSSVRFOwogCQlOb2RlLnNldF92YWx1
ZSBzdG9yZS5yb290IHZhbHVlLCBmYWxzZQogCSkgZWxzZQotCQlQYXRoLmFw
cGx5X21vZGlmeSBzdG9yZS5yb290IHBhdGggZG9fd3JpdGUsICFub2RlX2Ny
ZWF0ZWQKKwkJbGV0IHJvb3QgPSBQYXRoLmFwcGx5X21vZGlmeSBzdG9yZS5y
b290IHBhdGggZG9fd3JpdGUgaW4KKwkJcm9vdCwgIW5vZGVfY3JlYXRlZAog
CiBsZXQgcGF0aF9ybSBzdG9yZSBwZXJtIHBhdGggPQogCWxldCBkb19ybSBu
b2RlIG5hbWUgPQo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
