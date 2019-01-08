From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 279 v3 (CVE-2018-19965) - x86:
 DoS from attempting to use INVPCID with a non-canonical addresses
Date: Tue, 08 Jan 2019 16:44:16 +0000
Message-ID: <E1gguUC-0006ow-VL@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-19965 / XSA-279
                              version 3

 x86: DoS from attempting to use INVPCID with a non-canonical addresses

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

The INVPCID instruction raises #GP[0] if an attempt is made to
invalidate a non-canonical address.  Older flushing mechanisms such as
INVLPG tolerate this without error, and perform no action.

There is one guest accessible path in Xen where a non-canonical
address was passed into the TLB flushing code.  This previously had no
ill effect, but became vulnerable with the introduction of PCID to
reduce the performance hit from the Meltdown mitigations.

IMPACT
======

A buggy or malicious PV guest can crash the host.

VULNERABLE SYSTEMS
==================

Only hardware which supports the INVPCID instruction is vulnerable.  This is
available on Intel Haswell processors and later.  AMD x86 processors are not
known to support this instruction, and ARM processors are entirely unaffected.

Only versions of Xen with PCID support are vulnerable.  Support first appeared
in Xen 4.11 but was backported to the stable trees as part of the Meltdown
(XSA-254 / CVE-2017-5754) fixes.  Xen 4.10.2, 4.9.3, 4.8.4 as well as the
stable-4.7 and 4.6 branches are vulnerable.

The vulnerability is only exposed to 64-bit PV guests.  32-bit PV guests, as
well as HVM/PVH guests cannot exploit the vulnerability.

MITIGATION
==========

Booting Xen with `pcid=0` or `invpcid=0` on the command line will work around
the issue.  Alternatively, running untrusted 64bit PV guests inside xen-shim
will work around the issue.

CREDITS
=======

This issue was discovered by Matthew Daley.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa279.patch             xen-unstable, Xen 4.11.x, Xen 4.10.x
xsa279-4.9.patch         Xen 4.9.x ... 4.7.x

$ sha256sum xsa279*
40319fcf33348176eb14d7fc7c68c255cc7291013242ea444de6d00602024a11  xsa279.meta
0c1d50effe6645051a15dd83af57088dd4a055e26a23b1fa9e6c3722a7973f5d  xsa279.patch
fd34f29bc7e53359585135408cbbd12e12a003f59b135e81cc44186c5cddd40d  xsa279-4.9.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAlw00zAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZn0EH/0hSD6EUH7AyxFOCgPtaeOiRG0NPmGcnsVcHogU2
ows3sG+6+VenzyMdf0FcEqSEnCfFbQgqGuMaKE4U4ngSWWg+hdUhJ/5T/rMQv7o1
QJ84xhKRRHrAju1WZWdACZJpq7vAOiJmkS9HvkxjFw8J2ck+8KakyInLA1AlHC+K
8cApZtqxEyCNvH9w1Ho3PNtcNGhI6ZNxYlSSSUIfLz+dI7EXGQer2FiPzwE/KdAi
vp0+61HotZ3mz03AZOelzJK7tmP5a8/u+zZfwfEw9s6zEO1RadUCHM3FIiZrSJLk
v4si1s8x+FdbYwaHBKQGQTl6IQD/URqiK2IdWYdbeTkVCKY=
=COoK
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa279.meta"
Content-Disposition: attachment; filename="xsa279.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyNzksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiLAogICAgIjQuNyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4
ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICJlOTA3NDYwZmQ2MWMzNTA0ODdmZmVlNWQ4YWEzNzViZWY1NmJj
ODFjIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyNzUK
ICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAg
ICAgInhzYTI3OS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAg
IH0KICAgIH0sCiAgICAiNC4xMSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAg
ICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZGVhOWZj
MGUwMmQ5MmY1ZTZkNDY2ODBhYTBhNTJmYTc1OGVjYTljNCIsCiAgICAgICAg
ICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMjc1LAogICAgICAgICAgICAy
NzYsCiAgICAgICAgICAgIDI3NwogICAgICAgICAgXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjc5LnBhdGNoIgogICAgICAg
ICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjciOiB7CiAg
ICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAi
U3RhYmxlUmVmIjogIjljODI3NTk0NDgyOWM1NWFmM2RjNzA4NzEyY2E1YzEy
MGIxYmIzMjgiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAg
IDI3NQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAg
ICAgICAgICAieHNhMjc5LTQuOS5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC44IjogewogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICJkNjc5OGNlMzU3MDdhNDg1ZDljMTMyMzE5ZDcwZGQ2NTQ2MjBlNWU1IiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyNzUKICAgICAg
ICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTI3OS00LjkucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZjEzOTgzZGIx
MjBmNWU1NmRmZWZiZWU1ZDU2Njc4ZDJkNDNlMjkxNCIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFsKICAgICAgICAgICAgMjc1CiAgICAgICAgICBdLAogICAg
ICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EyNzktNC45LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAg
ICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjFkZTM0NTllMDk2MWZmMzIz
MzM5MmNmMjFhNjljYWZlOTAwNmRlNTkiLAogICAgICAgICAgIlByZXJlcXMi
OiBbCiAgICAgICAgICAgIDI3NSwKICAgICAgICAgICAgMjc2LAogICAgICAg
ICAgICAyNzcKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTI3OS5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa279.patch"
Content-Disposition: attachment; filename="xsa279.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L21tOiBEb24ndCBwZXJmb3JtIGZsdXNoIGFmdGVy
IGZhaWxpbmcgdG8gdXBkYXRlIGEgZ3Vlc3RzIEwxZQoKSWYgdGhlIEwxZSB1
cGRhdGUgaGFzbid0IG9jY3VyZWQsIHRoZSBmbHVzaCBjYW5ub3QgZG8gYW55
dGhpbmcgdXNlZnVsLiAgVGhpcwpza2lwcyB0aGUgcG90ZW50aWFsbHkgZXhw
ZW5zaXZlIHZjcHVtYXNrX3RvX3BjcHVtYXNrKCkgY29udmVyc2lvbiwgYW5k
CmJyb2FkY2FzdCBUTEIgc2hvb3Rkb3duLgoKTW9yZSBpbXBvcnRhbnRseSBo
b3dldmVyLCB3ZSBtaWdodCBiZSBpbiB0aGUgZXJyb3IgcGF0aCBkdWUgdG8g
YSBiYWQgdmEKcGFyYW1ldGVyIGZyb20gdGhlIGd1ZXN0LCBhbmQgdGhpcyBz
aG91bGQgbm90IHByb3BhZ2F0ZSBpbnRvIHRoZSBUTEIgZmx1c2hpbmcKbG9n
aWMuICBUaGUgSU5WUENJRCBpbnN0cnVjdGlvbiBmb3IgZXhhbXBsZSByYWlz
ZXMgI0dQIGZvciBhIG5vbi1jYW5vbmljYWwKYWRkcmVzcy4KClRoaXMgaXMg
WFNBLTI3OS4KClJlcG9ydGVkLWJ5OiBNYXR0aGV3IERhbGV5IDxtYXR0ZEBi
dWdmdXp6LmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDcwM2YzMzAu
Ljc1NjYzYzYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00MTU1LDYgKzQxNTUsMTQgQEAgc3Rh
dGljIGludCBfX2RvX3VwZGF0ZV92YV9tYXBwaW5nKAogICAgIGlmICggcGwx
ZSApCiAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHBsMWUpOwogCisgICAg
LyoKKyAgICAgKiBBbnkgZXJyb3IgYXQgdGhpcyBwb2ludCBtZWFucyB0aGF0
IHdlIGhhdmVuJ3QgY2hhbmdlIHRoZSBMMWUuICBTa2lwIHRoZQorICAgICAq
IGZsdXNoLCBhcyBpdCB3b24ndCBkbyBhbnl0aGluZyB1c2VmdWwuICBGdXJ0
aGVybW9yZSwgdmEgaXMgZ3Vlc3QKKyAgICAgKiBjb250cm9sbGVkIGFuZCBu
b3QgbmVjZXNzZXJpbHkgYXVkaXRlZCBieSB0aGlzIHBvaW50LgorICAgICAq
LworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CisKICAgICBz
d2l0Y2ggKCBmbGFncyAmIFVWTUZfRkxVU0hUWVBFX01BU0sgKQogICAgIHsK
ICAgICBjYXNlIFVWTUZfVExCX0ZMVVNIOgo=

--=separator
Content-Type: application/octet-stream; name="xsa279-4.9.patch"
Content-Disposition: attachment; filename="xsa279-4.9.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L21tOiBEb24ndCBwZXJmb3JtIGZsdXNoIGFmdGVy
IGZhaWxpbmcgdG8gdXBkYXRlIGEgZ3Vlc3RzIEwxZQoKSWYgdGhlIEwxZSB1
cGRhdGUgaGFzbid0IG9jY3VyZWQsIHRoZSBmbHVzaCBjYW5ub3QgZG8gYW55
dGhpbmcgdXNlZnVsLiAgVGhpcwpza2lwcyB0aGUgcG90ZW50aWFsbHkgZXhw
ZW5zaXZlIHZjcHVtYXNrX3RvX3BjcHVtYXNrKCkgY29udmVyc2lvbiwgYW5k
CmJyb2FkY2FzdCBUTEIgc2hvb3Rkb3duLgoKTW9yZSBpbXBvcnRhbnRseSBo
b3dldmVyLCB3ZSBtaWdodCBiZSBpbiB0aGUgZXJyb3IgcGF0aCBkdWUgdG8g
YSBiYWQgdmEKcGFyYW1ldGVyIGZyb20gdGhlIGd1ZXN0LCBhbmQgdGhpcyBz
aG91bGQgbm90IHByb3BhZ2F0ZSBpbnRvIHRoZSBUTEIgZmx1c2hpbmcKbG9n
aWMuICBUaGUgSU5WUENJRCBpbnN0cnVjdGlvbiBmb3IgZXhhbXBsZSByYWlz
ZXMgI0dQIGZvciBhIG5vbi1jYW5vbmljYWwKYWRkcmVzcy4KClRoaXMgaXMg
WFNBLTI3OS4KClJlcG9ydGVkLWJ5OiBNYXR0aGV3IERhbGV5IDxtYXR0ZEBi
dWdmdXp6LmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00ODk0LDYgKzQ4OTQs
MTQgQEAgc3RhdGljIGludCBfX2RvX3VwZGF0ZV92YV9tYXBwaW5nKAogICAg
IGlmICggcGwxZSApCiAgICAgICAgIGd1ZXN0X3VubWFwX2wxZShwbDFlKTsK
IAorICAgIC8qCisgICAgICogQW55IGVycm9yIGF0IHRoaXMgcG9pbnQgbWVh
bnMgdGhhdCB3ZSBoYXZlbid0IGNoYW5nZSB0aGUgbDFlLiAgU2tpcCB0aGUK
KyAgICAgKiBmbHVzaCwgYXMgaXQgd29uJ3QgZG8gYW55dGhpbmcgdXNlZnVs
LiAgRnVydGhlcm1vcmUsIHZhIGlzIGd1ZXN0CisgICAgICogY29udHJvbGxl
ZCBhbmQgbm90IG5lY2Vzc2VyaWx5IGF1ZGl0ZWQgYnkgdGhpcyBwb2ludC4K
KyAgICAgKi8KKyAgICBpZiAoIHJjICkKKyAgICAgICAgcmV0dXJuIHJjOwor
CiAgICAgc3dpdGNoICggZmxhZ3MgJiBVVk1GX0ZMVVNIVFlQRV9NQVNLICkK
ICAgICB7CiAgICAgY2FzZSBVVk1GX1RMQl9GTFVTSDoK

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
