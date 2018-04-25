From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 259 - x86: PV guest may crash Xen
 with XPTI
Date: Wed, 25 Apr 2018 12:03:36 +0000
Message-ID: <E1fBJ96-00044j-0I@xenbits.xenproject.org>
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

                    Xen Security Advisory XSA-259
                              version 2

                 x86: PV guest may crash Xen with XPTI

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The workaround for the Meltdown vulnerability (XSA-254) failed to deal
with an error code path connecting the INT 80 handling with general
exception handling.  This results in an unconditional write attempt of
the value zero to an address near 2^64, in cases where a PV guest has no
handler installed for INT 80 on one of its vCPU-s.

IMPACT
======

A malicious or buggy guest may cause a hypervisor crash, resulting in
a Denial of Service (DoS) affecting the entire host.

VULNERABLE SYSTEMS
==================

All Xen versions which the XSA-254 fixes were applied to are vulnerable.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only x86 PV guests can exploit the vulnerability.  x86 PVH and HVM
guests cannot exploit the vulnerability.

MITIGATION
==========

Running only PVH or HVM guests avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa259.patch          xen-unstable, Xen 4.10.x ... xen 4.7.x
xsa259-4.6.patch      Xen 4.6.x

$ sha256sum xsa259*
5c14a90af066c952974324b361e2a428c280f876b854f0c85a78e8579054a4d1  xsa259.meta
ff2efb5eb2502ded988d0aa15351030a15494a9e2223eafbb88377a8e4d39dcb  xsa259.patch
c40bc8802077cf73f8393fb50574b7c7efbc4d127e202b0ebd757d34aa07aac3  xsa259-4.6.patch
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

iQEcBAEBCAAGBQJa4G58AAoJEIP+FMlX6CvZrqIH+QFfC5NOoFhVZAChTU0WQ7U6
UwP7yEyLeY15VrGb4YvwzKhvTNwsRRiYTbTNB/QjAkrUkMRhBiUIz7mQqBl0Vc/N
4zblt+YNdDMjhCllTjvtYU6OJzbsqvEBByB4mFrz6fxfZiuXIbOnMUOxLHRRdXLR
6JR8+4RrheKNl9DF6lmLj50d3G/fKrNLY9id8VcDG1TGIB6E1CbJ6gibw7FiYDSq
PETa5O1szo2FO2yY+xcMzzGLHv+oVeKZnmuq9KYtP7Q+G823Twz1RE6rTBEjwhs9
sDGUlgZ48QVfSzer10syzyeX0p9hLHyKhlJnCrmCiywvKq68/uVexZFNcOKRPtE=
=n+01
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa259.meta"
Content-Disposition: attachment; filename="xsa259.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyNTksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiLAog
ICAgIjQuNyIsCiAgICAiNC42IgogIF0sCiAgIlRyZWVzIjogWwogICAgInhl
biIKICBdLAogICJSZWNpcGVzIjogewogICAgIjQuMTAiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjJlMzQzNDNmYjJjOGI2MmU4ZTk4YjIxYTU2OWJlZWE1MDhmNTAx
ZjYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI1OAog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMjU5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjYiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAg
ICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjBiMzg5MzA0
NTJhZGNlNzIyNDRlMjM0MThhNzIxMjZhMmY4ODE0YTgiLAogICAgICAgICAg
IlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI1OAogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjU5LTQuNi5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC43IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjog
ewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJkY2E4MGFiYzIwNzVhNTRmZWM1
ODM0NDc1MTM1NzAyMWIzYjViMzllIiwKICAgICAgICAgICJQcmVyZXFzIjog
WwogICAgICAgICAgICAyNTgKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0
Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI1OS5wYXRjaCIKICAgICAgICAg
IF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC44IjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI4NjZkZWRhYmIzZTUxYTU2YzFiOWFkNDIwNmVlMGZmYWYw
YjVjNGIzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAy
NTgKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAg
ICAgICAgInhzYTI1OS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAg
ICAgIH0KICAgIH0sCiAgICAiNC45IjogewogICAgICAiUmVjaXBlcyI6IHsK
ICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJhZDRm
ZWZkZDA4OGU0N2RjYzAxN2VmZWZjNDg1N2UxNjEwYzgzMmFmIiwKICAgICAg
ICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyNTgKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI1OS5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAibWFzdGVyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVu
IjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJjMGQ5OGIzNTcxNGZiNzA3
MjE3YzkwNjJiNjUxOGUxNThjZDcyZWVhIiwKICAgICAgICAgICJQcmVyZXFz
IjogWwogICAgICAgICAgICAyNTgKICAgICAgICAgIF0sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI1OS5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa259.patch"
Content-Disposition: attachment; filename="xsa259.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODY6IGZpeCBzbG93IGludDgwIHBhdGggYWZ0ZXIgWFBUSSBhZGRpdGlv
bnMKCkZvciB0aGUgaW50ODAgc2xvdyBwYXRoIHRvIGp1bXAgdG8gaGFuZGxl
X2V4Y2VwdGlvbl9zYXZlZCwgJXIxNCBuZWVkcyB0bwpiZSBzZXQgdXAgc3Vp
dGFibHkgZm9yIFhQVEkgcHVycG9zZXMuIFRoaXMgaXMgYmVjYXVzZSBvZiB0
aGUgZGlmZmVyZW5jZQppbiBuYXR1cmUgYmV0d2VlbiB0aGUgaW50ODAgcGF0
aCAod2hpY2ggaXMgc3luY2hyb25vdXMgV1JUIGd1ZXN0CmFjdGlvbnMpIGFu
ZCB0aGUgZXhjZXB0aW9uIHBhdGggd2hpY2ggaXMgcG90ZW50aWFsbHkgYXN5
bmNocm9ub3VzLgoKVGhpcyBpcyBYU0EtMjU5LgoKUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKKysr
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCkBAIC0zOTYsNiArMzk2
LDEyIEBAIGludDgwX3Nsb3dfcGF0aDoKICAgICAgICAgbW92bCAgJFRSQVBf
Z3BfZmF1bHQsVVJFR1NfZW50cnlfdmVjdG9yKCVyc3ApCiAgICAgICAgIC8q
IEEgR1BGIHdvdWxkbid0IGhhdmUgaW5jcmVtZW50ZWQgdGhlIGluc3RydWN0
aW9uIHBvaW50ZXIuICovCiAgICAgICAgIHN1YnEgICQyLFVSRUdTX3JpcCgl
cnNwKQorICAgICAgICAvKgorICAgICAgICAgKiBXaGlsZSB3ZSd2ZSBjbGVh
cmVkIHhlbl9jcjMgYWJvdmUgYWxyZWFkeSwgbm9ybWFsIGV4Y2VwdGlvbiBo
YW5kbGluZworICAgICAgICAgKiBjb2RlIGhhcyBsb2dpYyB0byByZXN0b3Jl
IHRoZSBvcmlnaW5hbCB2YWx1ZSBmcm9tICVyMTUuIFRoZXJlZm9yZSB3ZQor
ICAgICAgICAgKiBuZWVkIHRvIHNldCB1cCAlcjE0IGhlcmUsIHdoaWxlICVy
MTUgaXMgcmVxdWlyZWQgdG8gc3RpbGwgYmUgemVyby4KKyAgICAgICAgICov
CisgICAgICAgIEdFVF9TVEFDS19FTkQoMTQpCiAgICAgICAgIGptcCAgIGhh
bmRsZV9leGNlcHRpb25fc2F2ZWQKIAogICAgICAgICAvKiBjcmVhdGVfYm91
bmNlX2ZyYW1lICYgaGVscGVycyBkb24ndCBuZWVkIHRvIGJlIGluIC50ZXh0
LmVudHJ5ICovCg==

--=separator
Content-Type: application/octet-stream; name="xsa259-4.6.patch"
Content-Disposition: attachment; filename="xsa259-4.6.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODY6IGZpeCBzbG93IGludDgwIHBhdGggYWZ0ZXIgWFBUSSBhZGRpdGlv
bnMKCkZvciB0aGUgaW50ODAgc2xvdyBwYXRoIHRvIGp1bXAgdG8gaGFuZGxl
X2V4Y2VwdGlvbl9zYXZlZCwgJXIxNCBuZWVkcyB0bwpiZSBzZXQgdXAgc3Vp
dGFibHkgZm9yIFhQVEkgcHVycG9zZXMuIFRoaXMgaXMgYmVjYXVzZSBvZiB0
aGUgZGlmZmVyZW5jZQppbiBuYXR1cmUgYmV0d2VlbiB0aGUgaW50ODAgcGF0
aCAod2hpY2ggaXMgc3luY2hyb25vdXMgV1JUIGd1ZXN0CmFjdGlvbnMpIGFu
ZCB0aGUgZXhjZXB0aW9uIHBhdGggd2hpY2ggaXMgcG90ZW50aWFsbHkgYXN5
bmNocm9ub3VzLgoKVGhpcyBpcyBYU0EtMjU5LgoKUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJlcG9y
dGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9l
bnRyeS5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwpAQCAt
NDQyLDYgKzQ0MiwxMiBAQCBpbnQ4MF9zbG93X3BhdGg6CiAgICAgICAgIG1v
dmwgICRUUkFQX2dwX2ZhdWx0LFVSRUdTX2VudHJ5X3ZlY3RvciglcnNwKQog
ICAgICAgICAvKiBBIEdQRiB3b3VsZG4ndCBoYXZlIGluY3JlbWVudGVkIHRo
ZSBpbnN0cnVjdGlvbiBwb2ludGVyLiAqLwogICAgICAgICBzdWJxICAkMixV
UkVHU19yaXAoJXJzcCkKKyAgICAgICAgLyoKKyAgICAgICAgICogV2hpbGUg
d2UndmUgY2xlYXJlZCB4ZW5fY3IzIGFib3ZlIGFscmVhZHksIG5vcm1hbCBl
eGNlcHRpb24gaGFuZGxpbmcKKyAgICAgICAgICogY29kZSBoYXMgbG9naWMg
dG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgdmFsdWUgZnJvbSAlcjE1LiBUaGVy
ZWZvcmUgd2UKKyAgICAgICAgICogbmVlZCB0byBzZXQgdXAgJXIxNCBoZXJl
LCB3aGlsZSAlcjE1IGlzIHJlcXVpcmVkIHRvIHN0aWxsIGJlIHplcm8uCisg
ICAgICAgICAqLworICAgICAgICBHRVRfU1RBQ0tfQkFTRSglcjE0KQogICAg
ICAgICBqbXAgICBoYW5kbGVfZXhjZXB0aW9uX3NhdmVkCiAKIC8qIENSRUFU
RSBBIEJBU0lDIEVYQ0VQVElPTiBGUkFNRSBPTiBHVUVTVCBPUyBTVEFDSzog
ICAgICAgICAgICAgICAgICAgICAqLwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
