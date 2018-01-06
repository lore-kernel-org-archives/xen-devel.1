From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 253 (CVE-2018-5244) - x86: memory
 leak with MSR emulation
Date: Sat, 06 Jan 2018 15:25:05 +0000
Message-ID: <E1eXqLJ-0008JW-6M@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-5244 / XSA-253
                              version 3

                  x86: memory leak with MSR emulation

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

In Xen 4.10, new infrastructure was introduced as part of an overhaul to
how MSR emulation happens for guests.  Unfortunately, one tracking
structure isn't freed when a vcpu is destroyed.

IMPACT
======

A memory allocation of 8 bytes is leaked each time a vcpu is destroyed.

A malicious guest may, by frequently rebooting over extended periods of
time, run the system out of memory, resulting in a Denial of Service
(DoS).

VULNERABLE SYSTEMS
==================

Xen versions 4.10 and later are affected.  Xen 4.9 and earlier are not
affected.

Only x86 systems are affected.  ARM systems are not.

All guest kinds can exploit this vulnerability.

MITIGATION
==========

Limiting the frequency with which a guest is able to reboot, will
limit the memory leak.

Rebooting each host (after migrating its guests) periodically will
reclaim the leaked space.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa253.patch           Xen 4.10, xen-unstable

$ sha256sum xsa253*
bba1abb5e4368421de29385e37f8477bf3534d3ba3ff7e2aae9c9d3da53f1393  xsa253.patch
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

iQEcBAEBCAAGBQJaUOoXAAoJEIP+FMlX6CvZchUIAKlvxu5o9IcIyULARW0s2YEA
6ueK3tyaH2vlWH1IG9KORletdAGALJrfEODt8SBJb+0rKDZKGHSKNB7a911QRebK
njXdSpdb1WCdHmStI82csLKvdMGbrFq/6wWFJRt1eFtzr7Qt3rwKXtHv/OI4Kr1T
sZ+K6M2KCavkJ+yPSF/f9GTBuD6iiu2E7RI5HzbjdV+k9E7tJkURH2/BPAfhhhyo
zsColbPQAxm96RCHIEPaOI5qZXVcfL+5VNbUh5+6vOtUiZdpnOMHmSwDF0AZc1hO
0YQ93/8blRm7N914rn8gu0zY+nQHcgC2klWzHOcCFirzTI0aHXfQQJsX9Oe6g3w=
=CX95
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa253.patch"
Content-Disposition: attachment; filename="xsa253.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L21zcjogRnJlZSBtc3JfdmNwdV9wb2xpY3kgZHVy
aW5nIHZjcHUgZGVzdHJ1Y3Rpb24KCmMvcyA0MTg3Zjc5ZGM3ICJ4ODYvbXNy
OiBpbnRyb2R1Y2Ugc3RydWN0IG1zcl92Y3B1X3BvbGljeSIgaW50cm9kdWNl
ZCBhCnBlci12Y3B1IG1lbW9yeSBhbGxvY2F0aW9uLCBidXQgZmFpbGVkIHRv
IGZyZWUgaXQgaW4gdGhlIGNsZWFuIHZjcHUKZGVzdHJ1Y3Rpb24gY2FzZS4K
ClRoaXMgaXMgWFNBLTI1MwoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
aW5kZXggYjE3NDY4Yy4uMGFlNzE1ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAt
MzgyLDYgKzM4Miw5IEBAIHZvaWQgdmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1
ICp2KQogCiAgICAgdmNwdV9kZXN0cm95X2ZwdSh2KTsKIAorICAgIHhmcmVl
KHYtPmFyY2gubXNyKTsKKyAgICB2LT5hcmNoLm1zciA9IE5VTEw7CisKICAg
ICBpZiAoICFpc19pZGxlX2RvbWFpbih2LT5kb21haW4pICkKICAgICAgICAg
dnBtdV9kZXN0cm95KHYpOwogCg==

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
