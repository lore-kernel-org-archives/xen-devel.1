From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 264 (CVE-2018-12891) - preemption
 checks bypassed in x86 PV MM handling
Date: Wed, 27 Jun 2018 21:03:54 +0000
Message-ID: <E1fYHbW-0005EC-T0@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2018-12891 / XSA-264
                               version 3

           preemption checks bypassed in x86 PV MM handling

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Certain PV MMU operations may take a long time to process.  For that
reason Xen explicitly checks for the need to preempt the current vCPU at
certain points.  A few rarely taken code paths did bypass such checks.
By suitably enforcing the conditions through its own page table
contents, a malicious guest may cause such bypasses to be used for an
unbounded number of iterations.

IMPACT
======

A malicious or buggy PV guest may cause a Denial of Service (DoS)
affecting the entire host.  Specifically, it may prevent use of a
physical CPU for an indeterminate period of time.

VULNERABLE SYSTEMS
==================

All Xen versions from 3.4 onwards are vulnerable.  Xen versions 3.3 and
earlier are vulnerable to an even wider class of attacks, due to them
lacking preemption checks altogether in the affected code paths.

Only x86 systems are affected.  ARM systems are not affected.

Only multi-vCPU x86 PV guests can leverage the vulnerability.  x86 HVM
or PVH guests as well as x86 single-vCPU PV ones cannot leverage the
vulnerability.

MITIGATION
==========

Running only HVM, PVH, or single-vCPU PV guests will avoid this
vulnerability.

For PV guests, the vulnerability can be avoided if the guest kernel is
controlled by the host rather than guest administrator, provided that
further steps are taken to prevent the guest administrator from loading
code into the kernel (e.g. by disabling loadable modules etc) or from
using other mechanisms which allow them to run code at kernel privilege.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa264.patch           xen-unstable
xsa264-4.10.patch      Xen 4.10.x ... 4.6.x

$ sha256sum xsa264*
a7d2edf219af3375ac0d49bff9e64628c70e704fcf131ea21684694517aa9210  xsa264.patch
66aca234b168abc01f28fe131b7e07645a73fd5d0f1d141d68343f31914d96cc  xsa264-4.10.patch
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

iQEcBAEBCAAGBQJbM+5GAAoJEIP+FMlX6CvZy7cIALkEoEQnHw5O8vYC5KpDA24X
P320Gh0OppT2qtQfKtAF7MaCc7VF9Tnhf3CrtNtolXMryM4vrh7KyOn8wk7jbRBy
tp28e6ppO8ons9x1kBAmAZrno8LXwOa2t22hQpUv1mYksRkZotViAXS72t4HkOVl
SEQVVLElWAIfPbGJwtu1/qgS8dCckA2MeLeN/dKHRm8gD63XsYt37nQnBa2iraKX
yN5sdih+WLgXCf55mubFlQfE6+7qgn27khZpMeJAwGk6N+Rz/Q3q1zSFX9YB+P6d
9ppgoRFVxYpekwtCrLkVLxSAoEwCKi6sdYFnvIngHIMlLiVHjNsLd5YKTAsZcEE=
=zTq5
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa264.patch"
Content-Disposition: attachment; filename="xsa264.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGRvbid0IGJ5cGFzcyBwcmVlbXB0aW9uIGNoZWNrcwoKV2hp
bGUgdW5saWtlbHksIGl0IGlzIG5vdCBpbXBvc3NpYmxlIGZvciBhIG11bHRp
LXZDUFUgZ3Vlc3QgdG8gbGV2ZXJhZ2UKYnlwYXNzZXMgb2YgcHJlZW1wdGlv
biBjaGVja3MgdG8gZHJpdmUgWGVuIGludG8gYW4gdW5ib3VuZGVkIGxvb3Au
CgpUaGlzIGlzIFhTQS0yNjQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQm90aCBhcmNo
aXRlY3R1cmUncyByZWxpbnF1aXNoX21lbW9yeSgpIGFzIHdlbGwgYXMgbGl2
ZXBhdGNoX2xpc3QoKSBoYXZlCmEgc2ltaWxhciBpc3N1ZSwgYnV0IHRoZSBm
dW5jdGlvbnMgY2FuJ3QgYmUgaW52b2tlZCBieSAibm9ybWFsIiBndWVzdHMu
CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYv
bW0uYwpAQCAtMjU1MSw3ICsyNTUxLDcgQEAgc3RhdGljIGludCBfcHV0X3Bh
Z2VfdHlwZShzdHJ1Y3QgcGFnZV9pbgogICAgICAgICAgICAgICAgIG54ID0g
eCAmIH4oUEdUX3ZhbGlkYXRlZHxQR1RfcGFydGlhbCk7CiAgICAgICAgICAg
ICAgICAgaWYgKCB1bmxpa2VseSgoeSA9IGNtcHhjaGcoJnBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHgsIG54KSkgIT0geCkgKQotICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgICAgICAgICAgLyogV2UgY2xlYXJlZCB0aGUgJ3ZhbGlkIGJpdCcg
c28gd2UgZG8gdGhlIGNsZWFuIHVwLiAqLwogICAgICAgICAgICAgICAgIHJj
ID0gX3B1dF9maW5hbF9wYWdlX3R5cGUocGFnZSwgeCwgcHJlZW1wdGlibGUs
IHB0cGcpOwogICAgICAgICAgICAgICAgIGlmICggeCAmIFBHVF9wYXJ0aWFs
ICkKQEAgLTI1NzQsNyArMjU4NzQsMTggQEAgc3RhdGljIGludCBfcHV0X3Bh
Z2VfdHlwZShzdHJ1Y3QgcGFnZV9pbgogICAgICAgICAgICAgZWxzZQogICAg
ICAgICAgICAgICAgIEJVR19PTighSVNfRU5BQkxFRChDT05GSUdfUFZfTElO
RUFSX1BUKSk7CiAKLSAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAg
LyogZmFsbCB0aHJvdWdoICovCisgICAgICAgIGRlZmF1bHQ6CisgICAgICAg
ICAgICBpZiAoIHVubGlrZWx5KCh5ID0gY21weGNoZygmcGFnZS0+dS5pbnVz
ZS50eXBlX2luZm8sIHgsIG54KSkgIT0geCkgKQorICAgICAgICAgICAgICAg
IGJyZWFrOworCisgICAgICAgICAgICBpZiAoIHB0cGcgJiYgUEdUX3R5cGVf
ZXF1YWwoeCwgcHRwZy0+dS5pbnVzZS50eXBlX2luZm8pICkKKyAgICAgICAg
ICAgIHsKKyAgICAgICAgICAgICAgICBkZWNfbGluZWFyX3VzZXMocGFnZSk7
CisgICAgICAgICAgICAgICAgZGVjX2xpbmVhcl9lbnRyaWVzKHB0cGcpOwor
ICAgICAgICAgICAgfQorCisgICAgICAgICAgICByZXR1cm4gMDsKIAogICAg
ICAgICBjYXNlIFBHVF9sb2NrZWQ6CiAgICAgICAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsKQEAgLTI1ODcsMjMgKzI1OTgsMTIgQEAgc3RhdGljIGlu
dCBfcHV0X3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbgogICAgICAgICAgICAg
ICovCiAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKICAgICAgICAgICAgIHkg
PSBwYWdlLT51LmludXNlLnR5cGVfaW5mbzsKLSAgICAgICAgICAgIGNvbnRp
bnVlOwotICAgICAgICB9Ci0KLSAgICAgICAgaWYgKCBsaWtlbHkoKHkgPSBj
bXB4Y2hnKCZwYWdlLT51LmludXNlLnR5cGVfaW5mbywgeCwgbngpKSA9PSB4
KSApCiAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogCiAgICAgICAg
IGlmICggcHJlZW1wdGlibGUgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2so
KSApCiAgICAgICAgICAgICByZXR1cm4gLUVJTlRSOwogICAgIH0KLQotICAg
IGlmICggcHRwZyAmJiBQR1RfdHlwZV9lcXVhbCh4LCBwdHBnLT51LmludXNl
LnR5cGVfaW5mbykgKQotICAgIHsKLSAgICAgICAgZGVjX2xpbmVhcl91c2Vz
KHBhZ2UpOwotICAgICAgICBkZWNfbGluZWFyX2VudHJpZXMocHRwZyk7Ci0g
ICAgfQotCi0gICAgcmV0dXJuIDA7CiB9CiAKIApAQCAtMjcwNCwxMiArMjcw
NCwxMSBAQCBzdGF0aWMgaW50IF9nZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdl
X2luCiAgICAgICAgICAgICBpZiAoICEoeCAmIFBHVF9wYXJ0aWFsKSApCiAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgLyogU29tZW9uZSBlbHNl
IGlzIHVwZGF0aW5nIHZhbGlkYXRpb24gb2YgdGhpcyBwYWdlLiBXYWl0Li4u
ICovCi0gICAgICAgICAgICAgICAgd2hpbGUgKCAoeSA9IHBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvKSA9PSB4ICkKLSAgICAgICAgICAgICAgICB7CisgICAg
ICAgICAgICAgICAgZG8gewogICAgICAgICAgICAgICAgICAgICBpZiAoIHBy
ZWVtcHRpYmxlICYmIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgKQogICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5UUjsKICAgICAgICAg
ICAgICAgICAgICAgY3B1X3JlbGF4KCk7Ci0gICAgICAgICAgICAgICAgfQor
ICAgICAgICAgICAgICAgIH0gd2hpbGUgKCAoeSA9IHBhZ2UtPnUuaW51c2Uu
dHlwZV9pbmZvKSA9PSB4ICk7CiAgICAgICAgICAgICAgICAgY29udGludWU7
CiAgICAgICAgICAgICB9CiAgICAgICAgICAgICAvKiBUeXBlIHJlZiBjb3Vu
dCB3YXMgbGVmdCBhdCAxIHdoZW4gUEdUX3BhcnRpYWwgZ290IHNldC4gKi8K

--=separator
Content-Type: application/octet-stream; name="xsa264-4.10.patch"
Content-Disposition: attachment; filename="xsa264-4.10.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGRvbid0IGJ5cGFzcyBwcmVlbXB0aW9uIGNoZWNrcwoKV2hp
bGUgdW5saWtlbHksIGl0IGlzIG5vdCBpbXBvc3NpYmxlIGZvciBhIG11bHRp
LXZDUFUgZ3Vlc3QgdG8gbGV2ZXJhZ2UKYnlwYXNzZXMgb2YgcHJlZW1wdGlv
biBjaGVja3MgdG8gZHJpdmUgWGVuIGludG8gYW4gdW5ib3VuZGVkIGxvb3Au
CgpUaGlzIGlzIFhTQS0yNjQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTI1MjYs
NyArMjUyNiw3IEBAIHN0YXRpYyBpbnQgX3B1dF9wYWdlX3R5cGUoc3RydWN0
IHBhZ2VfaW4KICAgICAgICAgICAgICAgICBueCA9IHggJiB+KFBHVF92YWxp
ZGF0ZWR8UEdUX3BhcnRpYWwpOwogICAgICAgICAgICAgICAgIGlmICggdW5s
aWtlbHkoKHkgPSBjbXB4Y2hnKCZwYWdlLT51LmludXNlLnR5cGVfaW5mbywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4
LCBueCkpICE9IHgpICkKLSAgICAgICAgICAgICAgICAgICAgY29udGludWU7
CisgICAgICAgICAgICAgICAgICAgIGdvdG8gbWF5YmVfcHJlZW1wdDsKICAg
ICAgICAgICAgICAgICAvKiBXZSBjbGVhcmVkIHRoZSAndmFsaWQgYml0JyBz
byB3ZSBkbyB0aGUgY2xlYW4gdXAuICovCiAgICAgICAgICAgICAgICAgcmMg
PSBfcHV0X2ZpbmFsX3BhZ2VfdHlwZShwYWdlLCB4LCBwcmVlbXB0aWJsZSwg
cHRwZyk7CiAgICAgICAgICAgICAgICAgcHRwZyA9IE5VTEw7CkBAIC0yNTU4
LDEyICsyNTU4LDEzIEBAIHN0YXRpYyBpbnQgX3B1dF9wYWdlX3R5cGUoc3Ry
dWN0IHBhZ2VfaW4KICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgY3B1
X3JlbGF4KCk7CiAgICAgICAgICAgICB5ID0gcGFnZS0+dS5pbnVzZS50eXBl
X2luZm87Ci0gICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgICAgIGdv
dG8gbWF5YmVfcHJlZW1wdDsKICAgICAgICAgfQogCiAgICAgICAgIGlmICgg
bGlrZWx5KCh5ID0gY21weGNoZygmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8s
IHgsIG54KSkgPT0geCkgKQogICAgICAgICAgICAgYnJlYWs7CiAKKyAgICBt
YXliZV9wcmVlbXB0OgogICAgICAgICBpZiAoIHByZWVtcHRpYmxlICYmIGh5
cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgKQogICAgICAgICAgICAgcmV0dXJu
IC1FSU5UUjsKICAgICB9CkBAIC0yNjc2LDEyICsyNjc3LDExIEBAIHN0YXRp
YyBpbnQgX19nZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2kKICAgICAgICAg
ICAgIGlmICggISh4ICYgUEdUX3BhcnRpYWwpICkKICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAvKiBTb21lb25lIGVsc2UgaXMgdXBkYXRpbmcg
dmFsaWRhdGlvbiBvZiB0aGlzIHBhZ2UuIFdhaXQuLi4gKi8KLSAgICAgICAg
ICAgICAgICB3aGlsZSAoICh5ID0gcGFnZS0+dS5pbnVzZS50eXBlX2luZm8p
ID09IHggKQotICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBk
byB7CiAgICAgICAgICAgICAgICAgICAgIGlmICggcHJlZW1wdGlibGUgJiYg
aHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlRSOwogICAgICAgICAgICAgICAgICAgICBj
cHVfcmVsYXgoKTsKLSAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAg
ICAgfSB3aGlsZSAoICh5ID0gcGFnZS0+dS5pbnVzZS50eXBlX2luZm8pID09
IHggKTsKICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAg
IH0KICAgICAgICAgICAgIC8qIFR5cGUgcmVmIGNvdW50IHdhcyBsZWZ0IGF0
IDEgd2hlbiBQR1RfcGFydGlhbCBnb3Qgc2V0LiAqLwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
