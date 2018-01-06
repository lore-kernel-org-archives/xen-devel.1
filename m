From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 251 (CVE-2017-17565) - improper
 bug check in x86 log-dirty handling
Date: Sat, 06 Jan 2018 16:16:01 +0000
Message-ID: <E1eXr8b-0004ji-1y@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2017-17565 / XSA-251
                              version 3

             improper bug check in x86 log-dirty handling

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

Memory sharing, available to x86 HVM guests only, uses a special value
in the global machine to physical address translation table (M2P).  PV
guests have full control over M2P entries corresponding to pages they
own.  A bug check (specifically, an assertion that an M2P entry is not
the special "shared" indicator) was insufficiently qualified, and as a
consequence is triggerable by PV guests in log-dirty mode
(e.g. because of being live migrated).

IMPACT
======

A malicious or buggy PV guest may cause a hypervisor crash, resulting in
a Denial of Service (DoS) affecting the entire host.

VULNERABLE SYSTEMS
==================

Xen versions 4.0 and later are affected.  Xen versions 3.4 and earlier
are not affected.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

x86 HVM guests cannot exploit this vulnerability.

Only x86 PV guests can exploit this vulnerability, and only when being
run in shadow mode.  PV guests are typically run in shadow mode for live
migration, as well as for features like VM snapshot.

Note that save / restore does *not* use shadow mode, and so does not
expose this vulnerability.  Some downstreams also  include a "non-live
migration" feature, which also does not use shadow mode (and thus does
not expose this vulnerability).

MITIGATION
==========

Running only HVM guests avoids the vulnerability.

Avoiding live migration of x86 PV guests also avoids the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa251.patch           xen-unstable, Xen 4.9.x
xsa251-4.8.patch       Xen 4.8.x, Xen 4.7.x, Xen 4.6.x
xsa251-4.5.patch       Xen 4.5.x

$ sha256sum xsa251*
152cf5c88c3e441af01cdf5749877cabb6ab961afee9f29ae3077e725b703aa2  xsa251.meta
0dfbcfe459f051abb571d3fbedbe9760a4c6cd540ab5d525627050e3eeb9234e  xsa251.patch
345a6e004e0d0d89c7fc8db55d48d68f53402a521bd1aa3cb4168043e1ae5673  xsa251-4.5.patch
f8cecf013a3628038e0a4566778852a560b25a1ce2f3872a989087ab2fc9a913  xsa251-4.8.patch
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

iQEcBAEBCAAGBQJaUPXgAAoJEIP+FMlX6CvZd1wIALEfYx5UtaqCZrUpgc+TwN8u
Fg+huu3hE/YDVMY5IHueUsVU4WMk7/XJL/hXxf0+Dr01M5nVUbs1cJIB7Gqch37n
Vo6JMHM0XHUEQB/Ctxn/nRi1PfAjvz/nSrCcRacIeTZNHm6Wzc7qtlOyjDWgbVwJ
JvboCmK0ueGTVd3RIGvxM0jDzWqRuObf4KLaCWka3rqZvYzZJJOGAO9C8HdZn9Bc
pMIV79QuYySvJm9rdNUSno2s19DJNNCOki2/HpU1CHv/b8May82fE+qZH5XexsnZ
x2d1G8cvsK0L+auqQO/U3Rln9B2MWp9hn2cVGP2DbLq/AO2yir5b7d/CPzqhIag=
=O0vJ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa251.meta"
Content-Disposition: attachment; filename="xsa251.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyNTEsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiLAog
ICAgIjQuNyIsCiAgICAiNC42IiwKICAgICI0LjUiCiAgXSwKICAiVHJlZXMi
OiBbCiAgICAieGVuIgogIF0sCiAgIlJlY2lwZXMiOiB7CiAgICAiNC4xMCI6
IHsKICAgICAgIlhlblZlcnNpb24iOiAiNC4xMCIsCiAgICAgICJSZWNpcGVz
IjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjog
IjM0NWJiOWNkNjM0NDIxZjUwYjczMmQ0ZjljODlhNjQ5YTdhMWQwZGIiLAog
ICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI0OCwKICAgICAg
ICAgICAgMjQ5LAogICAgICAgICAgICAyNTAKICAgICAgICAgIF0sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI1MS5wYXRjaCIK
ICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC41
IjogewogICAgICAiWGVuVmVyc2lvbiI6ICI0LjUiLAogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICI0MWY2ZGQwNWQxMGZkMWI0MjgxYzE3MjJlMmQ4ZjI5ZTM3OGFiZTlhIiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyNDgsCiAgICAg
ICAgICAgIDI0OSwKICAgICAgICAgICAgMjUwCiAgICAgICAgICBdLAogICAg
ICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EyNTEtNC41LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAg
ICI0LjYiOiB7CiAgICAgICJYZW5WZXJzaW9uIjogIjQuNiIsCiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjliMGMyYTIyMzEzMmEwN2YwNmYwYmU4ZTg1ZGEzOTBkZWZlOTk4
ZjUiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI0OCwK
ICAgICAgICAgICAgMjQ5LAogICAgICAgICAgICAyNTAKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI1MS00
LjgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIjQuNyI6IHsKICAgICAgIlhlblZlcnNpb24iOiAiNC43IiwKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiYmNjOWUyNDVhYWZiZGFlNDRjNzYxMDUzYzg5OGJlZGIz
NTgyY2M0ZCIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAg
MjQ4LAogICAgICAgICAgICAyNDksCiAgICAgICAgICAgIDI1MAogICAgICAg
ICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MjUxLTQuOC5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAiNC44IjogewogICAgICAiWGVuVmVyc2lvbiI6ICI0Ljgi
LAogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAg
ICAgIlN0YWJsZVJlZiI6ICI5YmE2NzgzZTQ3ZGI3MTM3OWM1MTIwMDM5Yjg3
OGY2MDViZGYzMWYzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAg
ICAgICAyNDgsCiAgICAgICAgICAgIDI0OSwKICAgICAgICAgICAgMjUwCiAg
ICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EyNTEtNC44LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICI0LjkiOiB7CiAgICAgICJYZW5WZXJzaW9uIjog
IjQuOSIsCiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAg
ICAgICAgICAiU3RhYmxlUmVmIjogImFlMzRhYjhjNWQyZTk3N2Y2ZDgwODFj
MmNlNDQ5NDg3NTIzMmY1NjMiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAg
ICAgICAgICAgIDI0OCwKICAgICAgICAgICAgMjQ5LAogICAgICAgICAgICAy
NTAKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAg
ICAgICAgInhzYTI1MS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAg
ICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjogewogICAgICAiWGVuVmVyc2lv
biI6ICI0LjEwIiwKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMzQ1YmI5Y2Q2MzQ0MjFmNTBi
NzMyZDRmOWM4OWE2NDlhN2ExZDBkYiIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMjQ4LAogICAgICAgICAgICAyNDksCiAgICAgICAg
ICAgIDI1MAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwog
ICAgICAgICAgICAieHNhMjUxLnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa251.patch"
Content-Disposition: attachment; filename="xsa251.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvcGFnaW5nOiBkb24ndCB1bmNvbmRpdGlvbmFsbHkgQlVHKCkgb24g
ZmluZGluZyBTSEFSRURfTTJQX0VOVFJZCgpQViBndWVzdHMgY2FuIGZ1bGx5
IGNvbnRyb2wgdGhlIHZhbHVlcyB3cml0dGVuIGludG8gdGhlIFAyTS4KClRo
aXMgaXMgWFNBLTI1MS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94
ODYvbW0vcGFnaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5j
CkBAIC0yNzQsNyArMjc0LDcgQEAgdm9pZCBwYWdpbmdfbWFya19wZm5fZGly
dHkoc3RydWN0IGRvbWFpbgogICAgICAgICByZXR1cm47CiAKICAgICAvKiBT
aGFyZWQgTUZOcyBzaG91bGQgTkVWRVIgYmUgbWFya2VkIGRpcnR5ICovCi0g
ICAgQlVHX09OKFNIQVJFRF9NMlAocGZuX3gocGZuKSkpOworICAgIEJVR19P
TihwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgJiYgU0hBUkVEX00yUChwZm5f
eChwZm4pKSk7CiAKICAgICAvKgogICAgICAqIFZhbHVlcyB3aXRoIHRoZSBN
U0Igc2V0IGRlbm90ZSBNRk5zIHRoYXQgYXJlbid0IHJlYWxseSBwYXJ0IG9m
IHRoZQo=

--=separator
Content-Type: application/octet-stream; name="xsa251-4.5.patch"
Content-Disposition: attachment; filename="xsa251-4.5.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvcGFnaW5nOiBkb24ndCB1bmNvbmRpdGlvbmFsbHkgQlVHKCkgb24g
ZmluZGluZyBTSEFSRURfTTJQX0VOVFJZCgpQViBndWVzdHMgY2FuIGZ1bGx5
IGNvbnRyb2wgdGhlIHZhbHVlcyB3cml0dGVuIGludG8gdGhlIFAyTS4KClRo
aXMgaXMgWFNBLTI1MS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94
ODYvbW0vcGFnaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5j
CkBAIC0yODUsNyArMjg1LDcgQEAgdm9pZCBwYWdpbmdfbWFya19kaXJ0eShz
dHJ1Y3QgZG9tYWluICpkLAogICAgIC8qIFdlIC9yZWFsbHkvIG1lYW4gUEZO
IGhlcmUsIGV2ZW4gZm9yIG5vbi10cmFuc2xhdGVkIGd1ZXN0cy4gKi8KICAg
ICBwZm4gPSBnZXRfZ3Bmbl9mcm9tX21mbihtZm5feChnbWZuKSk7CiAgICAg
LyogU2hhcmVkIE1GTnMgc2hvdWxkIE5FVkVSIGJlIG1hcmtlZCBkaXJ0eSAq
LwotICAgIEJVR19PTihTSEFSRURfTTJQKHBmbikpOworICAgIEJVR19PTihw
YWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgJiYgU0hBUkVEX00yUChwZm4pKTsK
IAogICAgIC8qCiAgICAgICogVmFsdWVzIHdpdGggdGhlIE1TQiBzZXQgZGVu
b3RlIE1GTnMgdGhhdCBhcmVuJ3QgcmVhbGx5IHBhcnQgb2YgdGhlCg==

--=separator
Content-Type: application/octet-stream; name="xsa251-4.8.patch"
Content-Disposition: attachment; filename="xsa251-4.8.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvcGFnaW5nOiBkb24ndCB1bmNvbmRpdGlvbmFsbHkgQlVHKCkgb24g
ZmluZGluZyBTSEFSRURfTTJQX0VOVFJZCgpQViBndWVzdHMgY2FuIGZ1bGx5
IGNvbnRyb2wgdGhlIHZhbHVlcyB3cml0dGVuIGludG8gdGhlIFAyTS4KClRo
aXMgaXMgWFNBLTI1MS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94
ODYvbW0vcGFnaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5j
CkBAIC0yNzYsNyArMjc2LDcgQEAgdm9pZCBwYWdpbmdfbWFya19wZm5fZGly
dHkoc3RydWN0IGRvbWFpbgogICAgICAgICByZXR1cm47CiAKICAgICAvKiBT
aGFyZWQgTUZOcyBzaG91bGQgTkVWRVIgYmUgbWFya2VkIGRpcnR5ICovCi0g
ICAgQlVHX09OKFNIQVJFRF9NMlAocGZuKSk7CisgICAgQlVHX09OKHBhZ2lu
Z19tb2RlX3RyYW5zbGF0ZShkKSAmJiBTSEFSRURfTTJQKHBmbikpOwogCiAg
ICAgLyoKICAgICAgKiBWYWx1ZXMgd2l0aCB0aGUgTVNCIHNldCBkZW5vdGUg
TUZOcyB0aGF0IGFyZW4ndCByZWFsbHkgcGFydCBvZiB0aGUK

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
