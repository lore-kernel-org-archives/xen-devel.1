From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 256 (CVE-2018-7542) - x86 PVH
 guest without LAPIC may DoS the host
Date: Thu, 01 Mar 2018 13:15:20 +0000
Message-ID: <E1erO3M-0007EH-8Z__49694.3426471718$1519910268$gmane$org@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-7542 / XSA-256
                              version 3

             x86 PVH guest without LAPIC may DoS the host

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

So far, x86 PVH guests can be configured with or without Local APICs.
Configurations with Local APICs are identical to x86 HVM guests, and
will use as much hardware acceleration support as possible.
Configurations without Local APICs try to turn off all hardware
acceleration, and disable all software emulation.

Multiple paths in Xen assume the presence of a Local APIC without
sufficient checks, and can fall over a NULL pointer.  On Intel hardware,
the logic to turn off hardware acceleration is incomplete and leaves the
guest with full control of the real Task Priority Register.

IMPACT
======

A malicious or buggy guest may cause a hypervisor crash, resulting in
a Denial of Service (DoS) affecting the entire host.

VULNERABLE SYSTEMS
==================

Xen version 4.8 and onwards are vulnerable.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only x86 PVH guests can exploit the vulnerability.  x86 PV and HVM
guests cannot exploit the vulnerability.

MITIGATION
==========

Running only PV or HVM guests avoids the vulnerability.

Running all PVH guests with "apic=1" in the guest configuration file
(or equivalent thereof) also avoids the vulnerability.

CREDITS
=======

This issue was discovered by Ian Jackson of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa256.patch           xen-unstable, Xen 4.10.x, Xen 4.9.x
xsa256-4.8.patch       Xen 4.8.x

$ sha256sum xsa256*
3e45cc3f2ea516e7470083592041e238c0dfe32324790b2fba0e47c9efe38865  xsa256.patch
c029fcb67ff7c3c9a2adcb8e6f5e245a0d347acc8a9b3530591a639cbf321349  xsa256-4.8.patch
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

iQEcBAEBCAAGBQJal/zVAAoJEIP+FMlX6CvZkSgIAJG8fezZnjklV1FlQpzIfy5Y
qMg0PaUUg69vSmc1uxuM51pi/KATCE541VdJesZ7CviFvrNm46fj2OF4L5wGNbq7
wqi1Ywn3J8iVOkzVyhQbb0ZXzBQK0Z48Q7qcZNlnJ8Ci1MP8wjWK5Aq0BO7qUEpM
oHawLRAmEY0JKxIWwlpvR35dwoGp3cOSy0yHSWrpuj+Q59rhOuY/hyn0NlMBjDqp
CbJqLC1T0lfC9fpe7LRxDBusleZm/QGiWDHjFMS560koDt4gq6i8zTpVIJrpHdFF
eGhKY4JhVJpNljOB0CD87qk9WpN8+jxb1hVigMfZcyMMNygPLH5Bnh5QfhZwd00=
=JPu9
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa256.patch"
Content-Disposition: attachment; filename="xsa256.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2h2bTogRGlzYWxsb3cgdGhlIGNyZWF0aW9uIG9m
IEhWTSBkb21haW5zIHdpdGhvdXQgTG9jYWwgQVBJQyBlbXVsYXRpb24KClRo
ZXJlIGFyZSBtdWx0aXBsZSBwcm9ibGVtcywgbm90IG5lY2Vzc2VyaWx5IGxp
bWl0ZWQgdG86CgogKiBHdWVzdHMgd2hpY2ggY29uZmlndXJlIGV2ZW50IGNo
YW5uZWxzIHZpYSBodm1vcF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IoKSwK
ICAgb3Igd2hpY2ggaGl0ICVjcjggZW11bGF0aW9uIHdpbGwgY2F1c2UgWGVu
IHRvIGZhbGwgb3ZlciBhIE5VTEwgdmxhcGljLT5yZWdzCiAgIHBvaW50ZXIu
CgogKiBPbiBJbnRlbCBoYXJkd2FyZSwgZGlzYWJsaW5nIHRoZSBUUFJfU0hB
RE9XIGV4ZWN1dGlvbiBjb250cm9sIHdpdGhvdXQKICAgcmVlbmFibGluZyBD
Ujhfe0xPQUQsU1RPUkV9IGludGVyY2VwdGlvbiBtZWFucyB0aGF0IHRoZSBn
dWVzdHMgJWNyOAogICBhY2Nlc3NlcyBpbnRlcmFjdCB3aXRoIHRoZSByZWFs
IFRQUi4gIEFtb25nc3Qgb3RoZXIgdGhpbmdzLCBzZXR0aW5nIHRoZQogICBy
ZWFsIFRQUiB0byAweGYgYmxvY2tzIGV2ZW4gSVBJcyBmcm9tIGludGVycnVw
dGluZyB0aGlzIENQVS4KCiAqIE9uIGhhcmR3YXJlIHdoaWNoIHNldHMgdXAg
dGhlIHVzZSBvZiBJbnRlcnJ1cHQgUG9zdGluZywgaW5jbHVkaW5nCiAgIElP
TU1VLVBvc3RpbmcsIGd1ZXN0cyBydW4gd2l0aG91dCB0aGUgYXBwcm9wcmlh
dGUgbm9uLXJvb3QgY29uZmlndXJhdGlvbiwKICAgd2hpY2ggYXQgYSBtaW5p
bXVtIHdpbGwgcmVzdWx0IGluIGRyb3BwZWQgaW50ZXJydXB0cy4KCldoZXRo
ZXIgbm8tTEFQSUMgbW9kZSBpcyBvZiBhbnkgdXNlIGF0IGFsbCByZW1haW5z
IHRvIGJlIHNlZW4uCgpUaGlzIGlzIFhTQS0yNTYuCgpSZXBvcnRlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5kZXggZjkzMzI3Yi4u
ZjY1ZmMxMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtNDEzLDcgKzQxMyw3IEBA
IHN0YXRpYyBib29sIGVtdWxhdGlvbl9mbGFnc19vayhjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkLCB1aW50MzJfdCBlbWZsYWdzKQogICAgICAgICBpZiAoIGlz
X2hhcmR3YXJlX2RvbWFpbihkKSAmJgogICAgICAgICAgICAgIGVtZmxhZ3Mg
IT0gKFhFTl9YODZfRU1VX0xBUElDfFhFTl9YODZfRU1VX0lPQVBJQykgKQog
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwotICAgICAgICBpZiAoICFpc19o
YXJkd2FyZV9kb21haW4oZCkgJiYgZW1mbGFncyAmJgorICAgICAgICBpZiAo
ICFpc19oYXJkd2FyZV9kb21haW4oZCkgJiYKICAgICAgICAgICAgICBlbWZs
YWdzICE9IFhFTl9YODZfRU1VX0FMTCAmJiBlbWZsYWdzICE9IFhFTl9YODZf
RU1VX0xBUElDICkKICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICB9
Cg==

--=separator
Content-Type: application/octet-stream; name="xsa256-4.8.patch"
Content-Disposition: attachment; filename="xsa256-4.8.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2h2bTogRGlzYWxsb3cgdGhlIGNyZWF0aW9uIG9m
IEhWTSBkb21haW5zIHdpdGhvdXQgTG9jYWwgQVBJQyBlbXVsYXRpb24KClRo
ZXJlIGFyZSBtdWx0aXBsZSBwcm9ibGVtcywgbm90IG5lY2Vzc2VyaWx5IGxp
bWl0ZWQgdG86CgogKiBHdWVzdHMgd2hpY2ggY29uZmlndXJlIGV2ZW50IGNo
YW5uZWxzIHZpYSBodm1vcF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IoKSwK
ICAgb3Igd2hpY2ggaGl0ICVjcjggZW11bGF0aW9uIHdpbGwgY2F1c2UgWGVu
IHRvIGZhbGwgb3ZlciBhIE5VTEwgdmxhcGljLT5yZWdzCiAgIHBvaW50ZXIu
CgogKiBPbiBJbnRlbCBoYXJkd2FyZSwgZGlzYWJsaW5nIHRoZSBUUFJfU0hB
RE9XIGV4ZWN1dGlvbiBjb250cm9sIHdpdGhvdXQKICAgcmVlbmFibGluZyBD
Ujhfe0xPQUQsU1RPUkV9IGludGVyY2VwdGlvbiBtZWFucyB0aGF0IHRoZSBn
dWVzdHMgJWNyOAogICBhY2Nlc3NlcyBpbnRlcmFjdCB3aXRoIHRoZSByZWFs
IFRQUi4gIEFtb25nc3Qgb3RoZXIgdGhpbmdzLCBzZXR0aW5nIHRoZQogICBy
ZWFsIFRQUiB0byAweGYgYmxvY2tzIGV2ZW4gSVBJcyBmcm9tIGludGVycnVw
dGluZyB0aGlzIENQVS4KCiAqIE9uIGhhcmR3YXJlIHdoaWNoIHNldHMgdXAg
dGhlIHVzZSBvZiBJbnRlcnJ1cHQgUG9zdGluZywgaW5jbHVkaW5nCiAgIElP
TU1VLVBvc3RpbmcsIGd1ZXN0cyBydW4gd2l0aG91dCB0aGUgYXBwcm9wcmlh
dGUgbm9uLXJvb3QgY29uZmlndXJhdGlvbiwKICAgd2hpY2ggYXQgYSBtaW5p
bXVtIHdpbGwgcmVzdWx0IGluIGRyb3BwZWQgaW50ZXJydXB0cy4KCldoZXRo
ZXIgbm8tTEFQSUMgbW9kZSBpcyBvZiBhbnkgdXNlIGF0IGFsbCByZW1haW5z
IHRvIGJlIHNlZW4uCgpUaGlzIGlzIFhTQS0yNTYuCgpSZXBvcnRlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5kZXggODgxNzI2My4u
OTFiOWFiNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtNTU3LDExICs1NTcsOSBA
QCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGludCBkb21jcl9mbGFncywKICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwogICAgICAgICB9CiAKLSAgICAgICAgLyogUFZIdjIgZ3Vlc3Rz
IGNhbiByZXF1ZXN0IGVtdWxhdGVkIEFQSUMuICovCi0gICAgICAgIGlmICgg
ZW1mbGFncyAmJgotICAgICAgICAgICAgKGlzX2h2bV9kb21haW4oZCkgPyAo
KGVtZmxhZ3MgIT0gWEVOX1g4Nl9FTVVfQUxMKSAmJgotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKGVtZmxhZ3MgIT0gWEVOX1g4Nl9FTVVf
TEFQSUMpKSA6Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChl
bWZsYWdzICE9IFhFTl9YODZfRU1VX1BJVCkpICkKKyAgICAgICAgaWYgKCBp
c19odm1fZG9tYWluKGQpID8gKChlbWZsYWdzICE9IFhFTl9YODZfRU1VX0FM
TCkgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChlbWZs
YWdzICE9IFhFTl9YODZfRU1VX0xBUElDKSkKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDogKGVtZmxhZ3MgJiYgZW1mbGFncyAhPSBYRU5fWDg2
X0VNVV9QSVQpICkKICAgICAgICAgewogICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19HX0VSUiAiZCVkOiBYZW4gZG9lcyBub3QgYWxsb3cgJXMgZG9tYWlu
IGNyZWF0aW9uICIKICAgICAgICAgICAgICAgICAgICAid2l0aCB0aGUgY3Vy
cmVudCBzZWxlY3Rpb24gb2YgZW11bGF0b3JzOiAlI3hcbiIsCg==

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
