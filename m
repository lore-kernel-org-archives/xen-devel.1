From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 274 v2 (CVE-2018-14678) - Linux:
 Uninitialized state in x86 PV failsafe callback path
Date: Tue, 31 Jul 2018 10:14:04 +0000
Message-ID: <E1fkRfI-0004FB-Ek@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-14678 / XSA-274
                              version 2

      Linux: Uninitialized state in x86 PV failsafe callback path

UPDATES IN VERSION 2
====================

CVE assigned.  Fix the title to refer to the failsafe callback path.

ISSUE DESCRIPTION
=================

Linux has a `failsafe` callback, invoked by Xen under certain
conditions.  Normally in this failsafe callback, error_entry is paired
with error_exit; and error_entry uses %ebx to communicate to
error_exit whether to use the user or kernel return path.

Unfortunately, on 64-bit PV Xen on x86, error_exit is called without
error_entry being called first, leaving %ebx with an invalid value.

IMPACT
======

A rogue user-space program could crash a guest kernel.  Privilege
escalation cannot be ruled out.

VULNERABLE SYSTEMS
==================

Only 64-bit x86 PV Linux systems are vulnerable.

All versions of Linux are vulnerable.

MITIGATION
==========

Switching to HVM or PVH guests will mitigate this issue.

CREDITS
=======

This issue was discovered by M. Vefa Bicakci, and recognized as a
security issue by Andy Lutorminski.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

NB this patch has not been accepted into Linux upstream yet.  An
updated advisory will be sent if the fix upstreamed looks
significantly different.

xsa274-linux-4.17.patch           Linux 4.17

$ sha256sum xsa274*
0c30cb13d1d573f446c8cb8d4824ffad8ef9149a7589a19ef9bcc83c07bddcf5  xsa274-linux-4.17.patch
$

NOTE ON THE LACK OF EMBARGO
===========================

The patch for this issue was published on linux-kernel without being
first reported to the XenProject Security Team.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJbYDYRAAoJEIP+FMlX6CvZo1gH/3+9TpyHsjwGIqIrK8wndAQ6
bth9m0e/Zq4alZflWRsQlJ64toE23dlZmFF9juHLPNEV/4jPm4CA1oRVLQQkJ3am
6kh4SQMNU5kDa/3S7sCnpYnM+IRg3JO9oDjKfz9PiDImKApzbE/NnGbQLP766BUD
dCNKLdJlX+i3mRnKeqehFZKSPY43zOMU19hgfuKGEXwRCqlbLraL1+X5xGN11J51
iXHOJxK9fRBhi2d8jiCKAISqw0OMcROfrCgOFdabxYpw2/H49bjyADd0s9QV5piG
In1b7S4AFEZfEzEQ0wlXs4wvhqmBZGdMyXxAL7BP4hTGXAJovLrfsL/nX/DXprQ=
=H+Zn
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa274-linux-4.17.patch"
Content-Disposition: attachment; filename="xsa274-linux-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbSA4ZGY2MzUwMDdlMDczNzg4NzUyMmVlYmVlODg2MTU1NjAyYjg4MDli
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmR5IEx1dG9taXJz
a2kgPGx1dG9Aa2VybmVsLm9yZz4KRGF0ZTogU3VuLCAyMiBKdWwgMjAxOCAx
MTowNTowOSAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIHg4Ni9lbnRyeS82NDog
UmVtb3ZlICVlYnggaGFuZGxpbmcgZnJvbSBlcnJvcl9lbnRyeS9leGl0Cgpl
cnJvcl9lbnRyeSBhbmQgZXJyb3JfZXhpdCBjb21tdW5pY2F0ZSB0aGUgdXNl
ciB2cyBrZXJuZWwgc3RhdHVzIG9mCnRoZSBmcmFtZSB1c2luZyAlZWJ4LiAg
VGhpcyBpcyB1bm5lY2Vzc2FyeSAtLSB0aGUgaW5mb3JtYXRpb24gaXMgaW4K
cmVncy0+Y3MuICBKdXN0IHVzZSByZWdzLT5jcy4KClRoaXMgbWFrZXMgZXJy
b3JfZW50cnkgc2ltcGxlciBhbmQgbWFrZXMgZXJyb3JfZXhpdCBtb3JlIHJv
YnVzdC4KCkl0IGFsc28gZml4ZXMgYSBuYXN0eSBidWcuICBCZWZvcmUgYWxs
IHRoZSBTcGVjdHJlIG5vbnNlbnNlLCBUaGUKeGVuX2ZhaWxzYWZlX2NhbGxi
YWNrIGVudHJ5IHBvaW50IHJldHVybmVkIGxpa2UgdGhpczoKCiAgICAgICAg
QUxMT0NfUFRfR1BSRUdTX09OX1NUQUNLCiAgICAgICAgU0FWRV9DX1JFR1MK
ICAgICAgICBTQVZFX0VYVFJBX1JFR1MKICAgICAgICBFTkNPREVfRlJBTUVf
UE9JTlRFUgogICAgICAgIGptcCAgICAgZXJyb3JfZXhpdAoKQW5kIGl0IGRp
ZCBub3QgZ28gdGhyb3VnaCBlcnJvcl9lbnRyeS4gIFRoaXMgd2FzIGJvZ3Vz
OiBSQlgKY29udGFpbmVkIGdhcmJhZ2UsIGFuZCBlcnJvcl9leGl0IGV4cGVj
dGVkIGEgZmxhZyBpbiBSQlguCkZvcnR1bmF0ZWx5LCBpdCBnZW5lcmFsbHkg
Y29udGFpbmVkICpub256ZXJvKiBnYXJiYWdlLCBzbyB0aGUKY29ycmVjdCBj
b2RlIHBhdGggd2FzIHVzZWQuICBBcyBwYXJ0IG9mIHRoZSBTcGVjdHJlIGZp
eGVzLCBjb2RlIHdhcwphZGRlZCB0byBjbGVhciBSQlggdG8gbWl0aWdhdGUg
Y2VydGFpbiBzcGVjdWxhdGlvbiBhdHRhY2tzLiAgTm93LApkZXBlbmRpbmcg
b24ga2VybmVsIGNvbmZpZ3VyYXRpb24sIFJCWCBnb3QgemVyb2VkIGFuZCwg
d2hlbiBydW5uaW5nCnNvbWUgV2luZSB3b3JrbG9hZHMsIHRoZSBrZXJuZWwg
Y3Jhc2hlcy4gIFRoaXMgd2FzIGludHJvZHVjZWQgYnk6CgogICAgY29tbWl0
IDNhYzZkOGM3ODdiOCAoIng4Ni9lbnRyeS82NDogQ2xlYXIgcmVnaXN0ZXJz
IGZvcgogICAgZXhjZXB0aW9ucy9pbnRlcnJ1cHRzLCB0byByZWR1Y2Ugc3Bl
Y3VsYXRpb24gYXR0YWNrIHN1cmZhY2UiKQoKV2l0aCB0aGlzIHBhdGNoIGFw
cGxpZWQsIFJCWCBpcyBubyBsb25nZXIgbmVlZGVkIGFzIGEgZmxhZywgYW5k
IHRoZQpwcm9ibGVtIGdvZXMgYXdheS4KCkkgc3VzcGVjdCB0aGF0IG1hbGlj
aW91cyB1c2Vyc3BhY2UgY291bGQgdXNlIHRoaXMgYnVnIHRvIGNyYXNoIHRo
ZQprZXJuZWwgZXZlbiB3aXRob3V0IHRoZSBvZmZlbmRpbmcgcGF0Y2ggYXBw
bGllZCwgdGhvdWdoLgoKW0hpc3RvcmljYWwgbm90ZTogSSB3cm90ZSB0aGlz
IHBhdGNoIGFzIGEgY2xlYW51cCBiZWZvcmUgSSB3YXMgYXdhcmUKIG9mIHRo
ZSBidWcgaXQgZml4ZWQuXQoKW05vdGUgdG8gc3RhYmxlIG1haW50YWluZXJz
OiB0aGlzIHNob3VsZCBwcm9iYWJseSBnZXQgYXBwbGllZCB0byBhbGwKIGtl
cm5lbHMuICBJZiB5b3UncmUgbmVydm91cyBhYm91dCB0aGF0LCBhIG1vcmUg
Y29uc2VydmF0aXZlIGZpeCB0bwogYWRkIHhvcmwgJWVieCwlZWJ4OyBpbmNs
ICVlYnggYmVmb3JlIHRoZSBqdW1wIHRvIGVycm9yX2V4aXQgc2hvdWxkCiBh
bHNvIGZpeCB0aGUgcHJvYmxlbS5dCgpDYzogQnJpYW4gR2Vyc3QgPGJyZ2Vy
c3RAZ21haWwuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjgu
ZGU+CkNjOiBEb21pbmlrIEJyb2Rvd3NraSA8bGludXhAZG9taW5pa2Jyb2Rv
d3NraS5uZXQ+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4K
Q2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCkZpeGVzOiAzYWM2ZDhjNzg3YjggKCJ4ODYv
ZW50cnkvNjQ6IENsZWFyIHJlZ2lzdGVycyBmb3IgZXhjZXB0aW9ucy9pbnRl
cnJ1cHRzLCB0byByZWR1Y2Ugc3BlY3VsYXRpb24gYXR0YWNrIHN1cmZhY2Ui
KQpSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiAiTS4gVmVmYSBCaWNha2NpIiA8
bS52LmJAcnVuYm94LmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBMdXRvbWly
c2tpIDxsdXRvQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC94ODYvZW50cnkvZW50
cnlfNjQuUyB8IDE4ICsrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUyBiL2FyY2gveDg2L2Vu
dHJ5L2VudHJ5XzY0LlMKaW5kZXggNzNhNTIyZDUzYjUzLi44YWU3ZmZkYThm
OTggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMKKysr
IGIvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUwpAQCAtOTgxLDcgKzk4MSw3
IEBAIEVOVFJZKFxzeW0pCiAKIAljYWxsCVxkb19zeW0KIAotCWptcAllcnJv
cl9leGl0CQkJLyogJWVieDogbm8gc3dhcGdzIGZsYWcgKi8KKwlqbXAJZXJy
b3JfZXhpdAogCS5lbmRpZgogRU5EKFxzeW0pCiAuZW5kbQpAQCAtMTIyMiw3
ICsxMjIyLDYgQEAgRU5EKHBhcmFub2lkX2V4aXQpCiAKIC8qCiAgKiBTYXZl
IGFsbCByZWdpc3RlcnMgaW4gcHRfcmVncywgYW5kIHN3aXRjaCBHUyBpZiBu
ZWVkZWQuCi0gKiBSZXR1cm46IEVCWD0wOiBjYW1lIGZyb20gdXNlciBtb2Rl
OyBFQlg9MTogb3RoZXJ3aXNlCiAgKi8KIEVOVFJZKGVycm9yX2VudHJ5KQog
CVVOV0lORF9ISU5UX0ZVTkMKQEAgLTEyNjksNyArMTI2OCw2IEBAIEVOVFJZ
KGVycm9yX2VudHJ5KQogCSAqIGZvciB0aGVzZSBoZXJlIHRvby4KIAkgKi8K
IC5MZXJyb3Jfa2VybmVsc3BhY2U6Ci0JaW5jbAklZWJ4CiAJbGVhcQluYXRp
dmVfaXJxX3JldHVybl9pcmV0KCVyaXApLCAlcmN4CiAJY21wcQklcmN4LCBS
SVArOCglcnNwKQogCWplCS5MZXJyb3JfYmFkX2lyZXQKQEAgLTEzMDMsMjgg
KzEzMDEsMjAgQEAgRU5UUlkoZXJyb3JfZW50cnkpCiAKIAkvKgogCSAqIFBy
ZXRlbmQgdGhhdCB0aGUgZXhjZXB0aW9uIGNhbWUgZnJvbSB1c2VyIG1vZGU6
IHNldCB1cCBwdF9yZWdzCi0JICogYXMgaWYgd2UgZmF1bHRlZCBpbW1lZGlh
dGVseSBhZnRlciBJUkVUIGFuZCBjbGVhciBFQlggc28gdGhhdAotCSAqIGVy
cm9yX2V4aXQga25vd3MgdGhhdCB3ZSB3aWxsIGJlIHJldHVybmluZyB0byB1
c2VyIG1vZGUuCisJICogYXMgaWYgd2UgZmF1bHRlZCBpbW1lZGlhdGVseSBh
ZnRlciBJUkVULgogCSAqLwogCW1vdgklcnNwLCAlcmRpCiAJY2FsbAlmaXh1
cF9iYWRfaXJldAogCW1vdgklcmF4LCAlcnNwCi0JZGVjbAklZWJ4CiAJam1w
CS5MZXJyb3JfZW50cnlfZnJvbV91c2VybW9kZV9hZnRlcl9zd2FwZ3MKIEVO
RChlcnJvcl9lbnRyeSkKIAotCi0vKgotICogT24gZW50cnksIEVCWCBpcyBh
ICJyZXR1cm4gdG8ga2VybmVsIG1vZGUiIGZsYWc6Ci0gKiAgIDE6IGFscmVh
ZHkgaW4ga2VybmVsIG1vZGUsIGRvbid0IG5lZWQgU1dBUEdTCi0gKiAgIDA6
IHVzZXIgZ3NiYXNlIGlzIGxvYWRlZCwgd2UgbmVlZCBTV0FQR1MgYW5kIHN0
YW5kYXJkIHByZXBhcmF0aW9uIGZvciByZXR1cm4gdG8gdXNlcm1vZGUKLSAq
LwogRU5UUlkoZXJyb3JfZXhpdCkKIAlVTldJTkRfSElOVF9SRUdTCiAJRElT
QUJMRV9JTlRFUlJVUFRTKENMQlJfQU5ZKQogCVRSQUNFX0lSUVNfT0ZGCi0J
dGVzdGwJJWVieCwgJWVieAotCWpueglyZXRpbnRfa2VybmVsCisJdGVzdGIJ
JDMsIENTKCVyc3ApCisJanoJcmV0aW50X2tlcm5lbAogCWptcAlyZXRpbnRf
dXNlcgogRU5EKGVycm9yX2V4aXQpCiAKLS0gCjIuMTguMAoK

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
