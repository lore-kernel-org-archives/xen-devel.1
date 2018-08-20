From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 270 v3 (CVE-2018-15471) - Linux
 netback driver OOB access in hash handling
Date: Mon, 20 Aug 2018 09:47:46 +0000
Message-ID: <E1frgmo-0003i7-Bf@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-15471 / XSA-270
                              version 3

           Linux netback driver OOB access in hash handling

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

Linux's netback driver allows frontends to control mapping of requests
to request queues.  When processing a request to set or change this
mapping, some input validation was missing or flawed.

IMPACT
======

A malicious or buggy frontend may cause the (usually privileged)
backend to make out of bounds memory accesses, potentially resulting
in one or more of privilege escalation, Denial of Service (DoS), or
information leaks.

VULNERABLE SYSTEMS
==================

Linux kernel versions from 4.7 onwards are affected.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Felix Wilhelm of Google Project Zero.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa270.patch           Linux 4.7 ... 4.17

$ sha256sum xsa270*
392868c37c1fe0d16c36086208fd0fc045c1baf8ab9b207995bce72681cb8c54  xsa270.patch
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

iQEcBAEBCAAGBQJbeo4MAAoJEIP+FMlX6CvZOpsH/34RpIZaTTVsZWCVyNotieFf
yLfCqu+9bbRVNEqYDq6NViFrj9I6WwvLpp8s7HZheJvdXlyIO1cYCen4QX8VSPqI
VaRD7Jcu99drK1hy/t80AbicS+t9qvew97SzjG+MIIJZK7dnxG/Q0nbHLCg0zdCg
5G+pOTl17DK+4eM7Z1duo2BK1sxCms6I/YJVFfkGjC99vXKYAj2GAWGxVbiEwDWT
4jvf3R3w5athJNR4Lf6FxDz6MzvHaYNFQKikc0AMaTcO5HubumGXQQn5JQelAAno
O6ujB25kF1j29A2PwYvBSxBDTD4uWQeWiv9kWML1YmzsQv1cy6Un0vwXtNhhb6s=
=SC+y
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa270.patch"
Content-Disposition: attachment; filename="xsa270.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tbmV0YmFjazogZml4IGlucHV0IHZhbGlkYXRpb24gaW4geGVudmlm
X3NldF9oYXNoX21hcHBpbmcoKQoKQm90aCBsZW4gYW5kIG9mZiBhcmUgZnJv
bnRlbmQgc3BlY2lmaWVkIHZhbHVlcywgc28gd2UgbmVlZCB0byBtYWtlCnN1
cmUgdGhlcmUncyBubyBvdmVyZmxvdyB3aGVuIGFkZGluZyB0aGUgdHdvIGZv
ciB0aGUgYm91bmRzIGNoZWNrLiBXZQphbHNvIHdhbnQgdG8gYXZvaWQgdW5k
ZWZpbmVkIGJlaGF2aW9yIGFuZCBoZW5jZSB1c2Ugb2ZmIHRvIGluZGV4IGlu
dG8KLT5oYXNoLm1hcHBpbmdbXSBvbmx5IGFmdGVyIGJvdW5kcyBjaGVja2lu
Zy4gVGhpcyBhdCB0aGUgc2FtZSB0aW1lCmFsbG93cyB0byB0YWtlIGNhcmUg
b2Ygbm90IGFwcGx5aW5nIG9mZiB0d2ljZSBmb3IgdGhlIGJvdW5kcyBjaGVj
a2luZwphZ2FpbnN0IHZpZi0+bnVtX3F1ZXVlcy4KCkl0IGlzIGFsc28gaW5z
dWZmaWNpZW50IHRvIGJvdW5kcyBjaGVjayBjb3B5X29wLmxlbiwgYXMgdGhp
cyBpcyBsZW4KdHJ1bmNhdGVkIHRvIDE2IGJpdHMuCgpUaGlzIGlzIFhTQS0y
NzAuCgpSZXBvcnRlZC1ieTogRmVsaXggV2lsaGVsbSA8ZndpbGhlbG1AZ29v
Z2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KVGVzdGVkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KVGhlIGJvdW5kcyBjaGVja2lu
ZyBhZ2FpbnN0IHZpZi0+bnVtX3F1ZXVlcyBhbHNvIG9jY3VycyB0b28gZWFy
bHkgYWZhaWN0CihpdCBzaG91bGQgYmUgZG9uZSBhZnRlciB0aGUgZ3JhbnQg
Y29weSkuIEkgaGF2ZSBwYXRjaGVzIHJlYWR5IGFzIHB1YmxpYwpmb2xsb3ct
dXBzIGZvciBib3RoIHRoaXMgYW5kIHRoZSAoYXQgbGVhc3QgbGF0ZW50KSBp
c3N1ZSBvZiB0aGUgbWFwcGluZwphcnJheSBjcm9zc2luZyBhIHBhZ2UgYm91
bmRhcnkuCgotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMK
KysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jCkBAIC0zMzIs
MjAgKzMzMiwyMiBAQCB1MzIgeGVudmlmX3NldF9oYXNoX21hcHBpbmdfc2l6
ZShzdHJ1Y3QKIHUzMiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZyhzdHJ1Y3Qg
eGVudmlmICp2aWYsIHUzMiBncmVmLCB1MzIgbGVuLAogCQkJICAgIHUzMiBv
ZmYpCiB7Ci0JdTMyICptYXBwaW5nID0gJnZpZi0+aGFzaC5tYXBwaW5nW29m
Zl07CisJdTMyICptYXBwaW5nID0gdmlmLT5oYXNoLm1hcHBpbmc7CiAJc3Ry
dWN0IGdudHRhYl9jb3B5IGNvcHlfb3AgPSB7CiAJCS5zb3VyY2UudS5yZWYg
PSBncmVmLAogCQkuc291cmNlLmRvbWlkID0gdmlmLT5kb21pZCwKLQkJLmRl
c3QudS5nbWZuID0gdmlydF90b19nZm4obWFwcGluZyksCiAJCS5kZXN0LmRv
bWlkID0gRE9NSURfU0VMRiwKLQkJLmRlc3Qub2Zmc2V0ID0geGVuX29mZnNl
dF9pbl9wYWdlKG1hcHBpbmcpLAotCQkubGVuID0gbGVuICogc2l6ZW9mKHUz
MiksCisJCS5sZW4gPSBsZW4gKiBzaXplb2YoKm1hcHBpbmcpLAogCQkuZmxh
Z3MgPSBHTlRDT1BZX3NvdXJjZV9ncmVmCiAJfTsKIAotCWlmICgob2ZmICsg
bGVuID4gdmlmLT5oYXNoLnNpemUpIHx8IGNvcHlfb3AubGVuID4gWEVOX1BB
R0VfU0laRSkKKwlpZiAoKG9mZiArIGxlbiA8IG9mZikgfHwgKG9mZiArIGxl
biA+IHZpZi0+aGFzaC5zaXplKSB8fAorCSAgICBsZW4gPiBYRU5fUEFHRV9T
SVpFIC8gc2l6ZW9mKCptYXBwaW5nKSkKIAkJcmV0dXJuIFhFTl9ORVRJRl9D
VFJMX1NUQVRVU19JTlZBTElEX1BBUkFNRVRFUjsKIAorCWNvcHlfb3AuZGVz
dC51LmdtZm4gPSB2aXJ0X3RvX2dmbihtYXBwaW5nICsgb2ZmKTsKKwljb3B5
X29wLmRlc3Qub2Zmc2V0ID0geGVuX29mZnNldF9pbl9wYWdlKG1hcHBpbmcg
KyBvZmYpOworCiAJd2hpbGUgKGxlbi0tICE9IDApCiAJCWlmIChtYXBwaW5n
W29mZisrXSA+PSB2aWYtPm51bV9xdWV1ZXMpCiAJCQlyZXR1cm4gWEVOX05F
VElGX0NUUkxfU1RBVFVTX0lOVkFMSURfUEFSQU1FVEVSOwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
