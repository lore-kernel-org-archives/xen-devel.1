From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 284 v2 - grant table transfer
 issues on large hosts
Date: Tue, 05 Mar 2019 12:21:27 +0000
Message-ID: <E1h194Z-0001Ds-Qt__39043.1184599706$1551788774$gmane$org@xenbits.xenproject.org>
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

                    Xen Security Advisory XSA-284
                              version 2

              grant table transfer issues on large hosts

UPDATES IN VERSION 2
====================

Metadata updated to remove dependency on XSA-283.

Public release.

ISSUE DESCRIPTION
=================

When the code processing grant table transfer requests finds a page with
an address too large to be represented in the interface with the guest,
it allocates a replacement page and copies page contents.  However, the
code doing so fails to set the newly allocated page's accounting
properties correctly, resulting in the page becoming not only unusable
by the target domain, but also unfreeable upon domain cleanup.  The page
as well as certain other remnants of an affected guest will be leaked.

Furthermore internal state of the processing code was also not updated
correctly, resulting in the insertion of an IOMMU mapping to the page
being replaced (and subsequently freed), allowing the domain access to
memory it does not own.

IMPACT
======

The primary impact is a memory leak.  Malicious or buggy guests with
passed through PCI devices may also be able to escalate their
privileges, crash the host, or access data belonging to other guests.

VULNERABLE SYSTEMS
==================

All Xen versions from at least 3.2 onwards are vulnerable.

64-bit x86 PV guests can leverage the vulnerability on hosts with
physical memory extending past the 16 TiB boundary.  This is only
possible for hypervisors built with CONFIG_BIGMEM enabled.

32-bit x86 PV guests can leverage the vulnerability on hosts with
physical memory extending past the 168 GiB boundary.

x86 HVM and PVH guests cannot leverage the vulnerability on libxl
based systems.  On xend based systems x86 HVM guests can leverage
the vulnerability if their guest config file has a
'machine_address_size' setting.

ARM systems are not vulnerable.

MITIGATION
==========

Running only x86 HVM/PVH guests will avoid this vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa284.patch           xen-unstable, Xen 4.11.x ... 4.7.x

$ sha256sum xsa284*
5359796890fc59dd2bbf8d23398c229153c8b9b716c01842dfb9f95d063a3ad4  xsa284.meta
3a95ae9faef3886fd3a4ed5b22d944939bb2f819bb5a2a8061b2311cf3c05776  xsa284.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAlx+aa0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZwsYH/1yPmIG8vO86sWbX4bvwOsiRQMyy+U/HGKnh3kRi
lkDap3srzCRNveh/pqIJQF0okH/gD5VfHZrr3D73cHK7JKmlhoI0bPhpb6oE7/10
SmnaL/cW6/75FuDGdWzmKqx56Y/Ho/wxqGBj69rBbleOnGv+RHUQuGGTZ9g4rmzb
Nn4DbVRLz2cqvQhHmwjQBl/unid1BAnHVATHnNdjlF/SgucR7oRweioYjTeoFbZv
AdAWXX1GJRoXokGd1uE0eo/Mice/zmlHp//5JADCzo/oPevBFixMw/KWCaCMmUJt
FyDNwlu8xtm/bopBWN9dGc2tSKj/0UnTA7FF61OG39BdJHo=
=EzAi
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa284.meta"
Content-Disposition: attachment; filename="xsa284.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyODQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiLAogICAgIjQuNyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4
ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICJhMDE2YjhmMjA3YzdhM2ZlOGJkZDJiNmY3YzA4MDAyMGUzZTFj
ODIzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjg0LnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjExIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICI4N2Y1MWJmMzY2Y2E3OWI5OGUxZTIw
MWJmOWJkN2E5YzE2NDYzMWUyIiwKICAgICAgICAgICJQcmVyZXFzIjogWwog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMjg0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjciOiB7CiAgICAgICJSZWNpcGVzIjogewogICAg
ICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjcxMGNjMDk2
OTcxMDE5YmMyZTVhOWFhYmI5YWYxYWNjYTBiNWI5ZTciLAogICAgICAgICAg
IlByZXJlcXMiOiBbCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EyODQucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuOCI6IHsKICAgICAgIlJl
Y2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVS
ZWYiOiAiOTA4ZTc2OGZhZTQ5YThkYjAwODllNjgxODg2NTIwNzllM2JmYWE2
NiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgIF0sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI4NC5wYXRjaCIK
ICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC45
IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAg
ICAgICAgIlN0YWJsZVJlZiI6ICJmNWFjZjk3ZjY2OWM2YmM5NjkxZTAzNzcx
YWQwNjcwM2RhNzdlMGQ1IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAg
ICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAi
eHNhMjg0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAg
ICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjI0ZDUyODI1
MjdmNDY0NzkwN2IzNTcyODIwYjUzMzVjMTVjZDAzNTYiLAogICAgICAgICAg
IlByZXJlcXMiOiBbCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EyODQucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa284.patch"
Content-Disposition: attachment; filename="xsa284.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IHNldCBwYWdlIHJlZmNvdW50IGZvciBjb3B5LW9uLWdyYW50
LXRyYW5zZmVyCgpDb21taXQgNWNjNzdmOTA5OCAoIjMyLW9uLTY0OiBGaXgg
ZG9tYWluIGFkZHJlc3Mtc2l6ZSBjbGFtcGluZywKaW1wbGVtZW50IiksIHdo
aWNoIGludHJvZHVjZWQgdGhpcyBmdW5jdGlvbmFsaXR5LCB0b29rIGNhcmUg
b2YgY2xlYXJpbmcKdGhlIG9sZCBwYWdlJ3MgUEdDX2FsbG9jYXRlZCwgYnV0
IGZhaWxlZCB0byBzZXQgdGhlIGJpdCAoYW5kIGluc3RhbGwgdGhlCmFzc29j
aWF0ZWQgcmVmZXJlbmNlKSBvbiB0aGUgbmV3bHkgYWxsb2NhdGVkIG9uZS4g
RnVydGhlcm1vcmUgdGhlICJtZm4iCmxvY2FsIHZhcmlhYmxlIHdhcyBuZXZl
ciB1cGRhdGVkLCBhbmQgaGVuY2UgdGhlIHdyb25nIE1GTiB3YXMgcGFzc2Vk
IHRvCmd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSAoYW5kIGJhY2sgdG8gdGhl
IGRlc3RpbmF0aW9uIGRvbWFpbikgaW4gdGhpcwpjYXNlLCBsZWFkaW5nIHRv
IGFuIElPTU1VIG1hcHBpbmcgaW50byBhbiB1bm93bmVkIHBhZ2UuCgpJZGVh
bGx5IHRoZSBjb2RlIHdvdWxkIHVzZSBhc3NpZ25fcGFnZXMoKSwgYnV0IHRo
ZSBjYWxsIHRvCmdudHRhYl9wcmVwYXJlX2Zvcl90cmFuc2ZlcigpIHNpdHMg
aW4gdGhlIG1pZGRsZSBvZiB0aGUgYWN0aW9ucwptaXJyb3JpbmcgdGhhdCBm
dW5jdGlvbi4KClRoaXMgaXMgWFNBLTI4NC4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCi0tLSBhL3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKQEAgLTIxODMsNiArMjE4Myw4IEBAIGdudHRhYl90cmFuc2Zl
cigKICAgICAgICAgICAgIHBhZ2UtPmNvdW50X2luZm8gJj0gfihQR0NfY291
bnRfbWFza3xQR0NfYWxsb2NhdGVkKTsKICAgICAgICAgICAgIGZyZWVfZG9t
aGVhcF9wYWdlKHBhZ2UpOwogICAgICAgICAgICAgcGFnZSA9IG5ld19wYWdl
OworICAgICAgICAgICAgcGFnZS0+Y291bnRfaW5mbyA9IFBHQ19hbGxvY2F0
ZWQgfCAxOworICAgICAgICAgICAgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7
CiAgICAgICAgIH0KIAogICAgICAgICBzcGluX2xvY2soJmUtPnBhZ2VfYWxs
b2NfbG9jayk7Cg==

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
