Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05839CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:29:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447132.1663426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcq-0000jO-LM; Tue, 13 Oct 2026 12:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447132.1663426; Tue, 13 Oct 2026 12:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcp-0000h9-W6; Tue, 13 Oct 2026 12:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1447132;
 Tue, 13 Oct 2026 12:28:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcm-0008PB-KU; Tue, 13 Oct 2026 12:28:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbcl-00DIPB-Vs; Tue, 13 Oct 2026 14:28:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2403-2eae-0a2a0a5409dd-0a2a4501ece6-14
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:55 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2406-5984-0a2a45010019-6882d7259974-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:55 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbci-00000003NHh-2Uhh; Tue, 13 Oct 2026 12:28:52 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbci-0000000F8xP-1Sbi; Tue, 13 Oct 2026 12:28:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.515 (Entity 5.515)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 518 v2 (CVE-2026-79611) - VMX: VMentry
 failure with branch tracing and blocked states
Message-Id: <E1xGbci-0000000F8xP-1Sbi@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:28:52 +0000
X-purgate-ID: tlsNG-d62444/1791894535-1E664757-CCC5F802/0/0
X-purgate-type: clean
X-purgate-size: 13424

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-79611 / XSA-518
                               version 2

      VMX: VMentry failure with branch tracing and blocked states

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

For XSA-308 logic was introduced, as VMX VMEntry checks do not like the
exact combination of state which occurs when #DB in intercepted, Single
Stepping is active, and blocked by STI/MovSS is active, despite this being
a legitimate state to be in.  The resulting VMEntry failure is fatal to
the guest.

Sadly there is another special sub-case of the above, with branch tracing
enabled.  In that case the prior adjustment would still cause a VMentry
failure, as before fatal to the guest.

IMPACT
======

HVM/PVH guest userspace code may be able to crash the guest, resulting
in a guest Denial of Service.

VULNERABLE SYSTEMS
==================

All versions of Xen are affected.

Only systems supporting VMX hardware virtual extensions (Intel, VIA or
Zhaoxin CPUs) are affected.  Arm as well as AMD and Hygon systems are
unaffected.

Only HVM/PVH guests are affected.  PV guests cannot leverage the
vulnerability.

MITIGATION
==========

Running only PV guests will avoid this vulnerability.

Running HVM guests on only AMD or Hygon hardware will also avoid this
vulnerability.

CREDITS
=======

This issue was discovered by Claude Opus and diagnosed as a security issue
by Teddy Astie of Vates.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa518.patch           xen-unstable - Xen 4.21.x
xsa518-4.20.patch      Xen 4.20.x - Xen 4.17.x

$ sha256sum xsa518*
a703af59b22f1e47543af0668c8715b4e4011ba4fc05fd8b94bf05503dce88ef  xsa518.patch
a1a1b3548166e051f62a0759af5df8d365f524ae52f4bbbe642d45692a1f8bde  xsa518-4.20.patch
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
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOIooMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZTOUIAMMapd/RMFzQxmwdwICbmj2zDnEWutkzQyV0bMMK
Ui2VleXQ7pDWH5OEfDNl6644Gs6x4zB9lrTZFubAFvXjqNUk9C3QxU6LOlV0RQAq
a96/glbPhXhOONdn1K5DuJq35sKjhGdsy8B+Ati+IGPstT8bGytrz+CVbdR1bnLb
3XvnRHqFSEHoQxejE/aRXpRw4k1HHD5wFQ/WfvgOEKYj+Ghjm+KE2sNhcahxxFf4
ys8v9JWBKhnLAe+mJIiMPGiKmX5uUVl6HhdX6SjTHuzzbsmITF3VOwsnHZR9vLn1
BqUwLG/uQKes4LRinfOA5RrOMt/q/ChjXPw2x6IZZJLjHVk=
=hyph
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa518.patch"
Content-Disposition: attachment; filename="xsa518.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU3ViamVjdDog
eDg2L3ZteDogUmV3b3JrICNEQiBpbnRlcmNlcHQgbG9naWMgdG8gZml4IFZNRW50cnkgZmFpbHVy
ZSB3aXRoIEJURgoKVGhlIGNvbnNpc3RlbmN5IGNoZWNrcyBpbiBlZmZlY3Qgd2hlbiBCbG9ja2Vk
LWJ5LVNUSS9Nb3ZTUyBhcmUgYWN0aXZlIGluY2x1ZGVzCkRFQlVHQ1RMLkJURiB0b28uICBUYWtl
IHRoaXMgaW50byBhY2NvdW50IHdoZW4gZWRpdGluZyBQRU5ESU5HX0RCRy5CUy4KClRoaXMgZW5k
cyB1cCBuYXJyb3dpbmcgdGhlIGNhc2VzIHdoZXJlIFBFTkRJTkdfREJHIGlzIG1vZGlmaWVkLiAg
UmV3b3JrIHRoZQpjb21tZW50IHRvIGJlIG1vcmUgcHJlY2lzZS4KClRoaXMgaXMgWFNBLTUxOCAv
IENWRS0yMDI2LTc5NjExLgoKRml4ZXM6IDFkM2ViODI1OTgwNCAoIng4Ni92dHg6IFdvcmsgYXJv
dW5kIFNpbmdsZVN0ZXAgKyBTVEkvTW92U1MgVk1FbnRyeSBmYWlsdXJlcyIpClJlcG9ydGVkLWJ5
OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4KU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRk
eS5hc3RpZUB2YXRlcy50ZWNoPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgNDEg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IDYyMzc2
MjNhNGMxNi4uOTdkZDM3ZGQ3Y2U0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtNDM5NiwzMyArNDM5Niwy
OCBAQCB2b2lkIGFzbWxpbmthZ2Ugdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQogICAgICAgICAgICAgICogV2UgaW50ZXJjZXB0ICNEQiB1bmNvbmRpdGlvbmFs
bHkgdG8gd29yayBhcm91bmQgQ1ZFLTIwMTUtODEwNCAvCiAgICAgICAgICAgICAgKiBYU0EtMTU2
IChndWVzdC1rZXJuZWwgaW5kdWNlZCBob3N0IERvUykuCiAgICAgICAgICAgICAgKgotICAgICAg
ICAgICAgICogU1RJL01vdlNTIHNoYWRvd3MgYmxvY2svZGVmZXIgaW50ZXJydXB0cy9leGNlcHRp
b25zIChleGFjdAotICAgICAgICAgICAgICogZGV0YWlscyBhcmUgY29tcGxpY2F0ZWQgYW5kIHBv
b3JseSBkb2N1bWVudGVkKS4gIERlYnVnCi0gICAgICAgICAgICAgKiBleGNlcHRpb25zIGRlbGF5
ZWQgZm9yIGFueSByZWFzb24gYXJlIHN0b3JlZCBpbiB0aGUKLSAgICAgICAgICAgICAqIFBFTkRJ
TkdfREJHX0VYQ0VQVElPTlMgZmllbGQuCisgICAgICAgICAgICAgKiBNb3N0IHNvdXJjZXMgb2Yg
I0RCIGFjY3VtdWF0ZSBzdGF0dXMgaW4gUEVORElOR19EQkcsIHdoaWNoIGFyZQorICAgICAgICAg
ICAgICogdGhlbiBkaXNwYXRjaGVkIGluIHByaW9yaXR5IG9yZGVyIHByaW9yIHRvIGZldGNoaW5n
IHRoZSBuZXh0CisgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbi4gIFdoZW4gdGhlICNEQiBpbnRl
cmNlcHQgdHJpZ2dlcnMsIFBFTkRJTkdfREJHIGlzIDAKKyAgICAgICAgICAgICAqIHdpdGggdGhl
IHN0YXR1cyBiaXRzIGhhdmluZyBtb3ZlZCBpbnRvIEVYSVRfUVVBTElGSUNBVElPTi4KICAgICAg
ICAgICAgICAqCi0gICAgICAgICAgICAgKiBUaGUgZmFsbGluZyBlZGdlIG9mIFBFTkRJTkdfREJH
IGNhdXNlcyAjREIgdG8gYmUgZGVsaXZlcmVkLAotICAgICAgICAgICAgICogcmVzdWx0aW5nIGlu
IGEgVk1FeGl0LCBhcyAjREIgaXMgaW50ZXJjZXB0ZWQuICBUaGUgVk1DUyBzdGlsbAotICAgICAg
ICAgICAgICogcmVwb3J0cyBibG9ja2VkLWJ5LVNUSS9Nb3ZTUy4KKyAgICAgICAgICAgICAqIEF0
IGFueSBwb2ludCBpZiBCbG9ja2VkLWJ5LVNUSS9Nb3ZTUyBhcmUgYWN0aXZlLCBleHRyYSBWTUVu
dHJ5CisgICAgICAgICAgICAgKiBjb25zaXN0ZW5jeSBjaGVja3MgYXJlIGFwcGxpZWQsIGNyb3Nz
LWNoZWNraW5nIEVGTEFHUy5URiwKKyAgICAgICAgICAgICAqIFBFTkRJTkdfREJHLkJTIGFuZCBE
RUJVR0NUTC5CVEYuICBUaGVzZSBjb25zaXN0ZW5jeSBjaGVja3MKKyAgICAgICAgICAgICAqIGFw
cGx5IHRvIEFjdGl2aXR5LXN0YXRlLUhMVCB0b28sIGJ1dCBYZW4gZG9lc24ndCBzdXBwb3J0IHRo
aXMuCiAgICAgICAgICAgICAgKgotICAgICAgICAgICAgICogVGhlIFZNRW50cnkgY2hlY2tzIHdo
ZW4gRUZMQUdTLlRGIGlzIHNldCBkb24ndCBsaWtlIGEgVk1DUyBpbgotICAgICAgICAgICAgICog
dGhpcyBzdGF0ZS4gIERlc3BpdGUgYSAjREIgcXVldWVkIGluIFZNRU5UUllfSU5UUl9JTkZPLCB0
aGUKLSAgICAgICAgICAgICAqIHN0YXRlIGlzIHJlamVjdGVkIGFzIERSNi5CUyBpc24ndCBwZW5k
aW5nLiAgRml4IHRoaXMgdXAuCisgICAgICAgICAgICAgKiBUaGUgVk1DUyBzdGF0ZSBhdCB0aGUg
cG9pbnQgb2YgI0RCIGludGVyY2VwdCBkb2VzIG5vdCBzYXRpc2Z5CisgICAgICAgICAgICAgKiB0
aGUgY29uc2lzdGVuY3kgY2hlY2tzLiAgSW4gdGhlIGNhc2UgdGhhdCBhIFNpbmdsZVN0ZXAgc2hv
dWxkCisgICAgICAgICAgICAgKiBiZSBwZW5kaW5nLCBmaWxsIFBFTkRJTkdfREJHIGJhY2sgaW4g
dG8gc2F0aXNmeSB0aGUgY29uc2l0ZW5jeQorICAgICAgICAgICAgICogY2hlY2suCiAgICAgICAg
ICAgICAgKi8KLSAgICAgICAgICAgIGlmICggdW5saWtlbHkocmVncy0+ZWZsYWdzICYgWDg2X0VG
TEFHU19URikgKQorICAgICAgICAgICAgaWYgKCB1bmxpa2VseShyZWdzLT5lZmxhZ3MgJiBYODZf
RUZMQUdTX1RGKSAmJgorICAgICAgICAgICAgICAgICAodm1yZWFkKEdVRVNUX0lOVEVSUlVQVElC
SUxJVFlfSU5GTykgJgorICAgICAgICAgICAgICAgICAgKFZNWF9JTlRSX1NIQURPV19TVEkgfCBW
TVhfSU5UUl9TSEFET1dfTU9WX1NTKSkgJiYKKyAgICAgICAgICAgICAgICAgISh2bXJlYWQoR1VF
U1RfSUEzMl9ERUJVR0NUTCkgJiBJQTMyX0RFQlVHQ1RMTVNSX0JURikgKQogICAgICAgICAgICAg
ewotICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW50X2luZm87Ci0KLSAgICAgICAgICAg
ICAgICBfX3ZtcmVhZChHVUVTVF9JTlRFUlJVUFRJQklMSVRZX0lORk8sICZpbnRfaW5mbyk7Ci0K
LSAgICAgICAgICAgICAgICBpZiAoIGludF9pbmZvICYgKFZNWF9JTlRSX1NIQURPV19TVEkgfCBW
TVhfSU5UUl9TSEFET1dfTU9WX1NTKSApCi0gICAgICAgICAgICAgICAgewotICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHBlbmRpbmdfZGJnOwotCi0gICAgICAgICAgICAgICAgICAg
IF9fdm1yZWFkKEdVRVNUX1BFTkRJTkdfREJHX0VYQ0VQVElPTlMsICZwZW5kaW5nX2RiZyk7Ci0g
ICAgICAgICAgICAgICAgICAgIF9fdm13cml0ZShHVUVTVF9QRU5ESU5HX0RCR19FWENFUFRJT05T
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVuZGluZ19kYmcgfCBEUl9TVEVQKTsK
LSAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgQVNTRVJUKHZtcmVhZChHVUVTVF9Q
RU5ESU5HX0RCR19FWENFUFRJT05TKSA9PSAwKTsKKyAgICAgICAgICAgICAgICBfX3Ztd3JpdGUo
R1VFU1RfUEVORElOR19EQkdfRVhDRVBUSU9OUywgWDg2X0RSNl9CUyk7CiAgICAgICAgICAgICB9
CiAKICAgICAgICAgICAgIGlmICggIXYtPmRvbWFpbi0+ZGVidWdnZXJfYXR0YWNoZWQgKQo=

--=separator
Content-Type: application/octet-stream; name="xsa518-4.20.patch"
Content-Disposition: attachment; filename="xsa518-4.20.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU3ViamVjdDog
eDg2L3ZteDogUmV3b3JrICNEQiBpbnRlcmNlcHQgbG9naWMgdG8gZml4IFZNRW50cnkgZmFpbHVy
ZSB3aXRoIEJURgoKVGhlIGNvbnNpc3RlbmN5IGNoZWNrcyBpbiBlZmZlY3Qgd2hlbiBCbG9ja2Vk
LWJ5LVNUSS9Nb3ZTUyBhcmUgYWN0aXZlIGluY2x1ZGVzCkRFQlVHQ1RMLkJURiB0b28uICBUYWtl
IHRoaXMgaW50byBhY2NvdW50IHdoZW4gZWRpdGluZyBQRU5ESU5HX0RCRy5CUy4KClRoaXMgZW5k
cyB1cCBuYXJyb3dpbmcgdGhlIGNhc2VzIHdoZXJlIFBFTkRJTkdfREJHIGlzIG1vZGlmaWVkLiAg
UmV3b3JrIHRoZQpjb21tZW50IHRvIGJlIG1vcmUgcHJlY2lzZS4KClRoaXMgaXMgWFNBLTUxOCAv
IENWRS0yMDI2LTc5NjExLgoKRml4ZXM6IDFkM2ViODI1OTgwNCAoIng4Ni92dHg6IFdvcmsgYXJv
dW5kIFNpbmdsZVN0ZXAgKyBTVEkvTW92U1MgVk1FbnRyeSBmYWlsdXJlcyIpClJlcG9ydGVkLWJ5
OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4KU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRk
eS5hc3RpZUB2YXRlcy50ZWNoPgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKKysr
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKQEAgLTQyODEsMjYgKzQyODEsMzAgQEAgdm9p
ZCBhc21saW5rYWdlIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1YwogICAgICAgICAgICAgICogV2Ug
aW50ZXJjZXB0ICNEQiB1bmNvbmRpdGlvbmFsbHkgdG8gd29yayBhcm91bmQgQ1ZFLTIwMTUtODEw
NCAvCiAgICAgICAgICAgICAgKiBYU0EtMTU2IChndWVzdC1rZXJuZWwgaW5kdWNlZCBob3N0IERv
UykuCiAgICAgICAgICAgICAgKgotICAgICAgICAgICAgICogU1RJL01vdlNTIHNoYWRvd3MgYmxv
Y2svZGVmZXIgaW50ZXJydXB0cy9leGNlcHRpb25zIChleGFjdAotICAgICAgICAgICAgICogZGV0
YWlscyBhcmUgY29tcGxpY2F0ZWQgYW5kIHBvb3JseSBkb2N1bWVudGVkKS4gIERlYnVnCi0gICAg
ICAgICAgICAgKiBleGNlcHRpb25zIGRlbGF5ZWQgZm9yIGFueSByZWFzb24gYXJlIHN0b3JlZCBp
biB0aGUKLSAgICAgICAgICAgICAqIFBFTkRJTkdfREJHX0VYQ0VQVElPTlMgZmllbGQuCisgICAg
ICAgICAgICAgKiBNb3N0IHNvdXJjZXMgb2YgI0RCIGFjY3VtdWF0ZSBzdGF0dXMgaW4gUEVORElO
R19EQkcsIHdoaWNoIGFyZQorICAgICAgICAgICAgICogdGhlbiBkaXNwYXRjaGVkIGluIHByaW9y
aXR5IG9yZGVyIHByaW9yIHRvIGZldGNoaW5nIHRoZSBuZXh0CisgICAgICAgICAgICAgKiBpbnN0
cnVjdGlvbi4gIFdoZW4gdGhlICNEQiBpbnRlcmNlcHQgdHJpZ2dlcnMsIFBFTkRJTkdfREJHIGlz
IDAKKyAgICAgICAgICAgICAqIHdpdGggdGhlIHN0YXR1cyBiaXRzIGhhdmluZyBtb3ZlZCBpbnRv
IEVYSVRfUVVBTElGSUNBVElPTi4KICAgICAgICAgICAgICAqCi0gICAgICAgICAgICAgKiBUaGUg
ZmFsbGluZyBlZGdlIG9mIFBFTkRJTkdfREJHIGNhdXNlcyAjREIgdG8gYmUgZGVsaXZlcmVkLAot
ICAgICAgICAgICAgICogcmVzdWx0aW5nIGluIGEgVk1FeGl0LCBhcyAjREIgaXMgaW50ZXJjZXB0
ZWQuICBUaGUgVk1DUyBzdGlsbAotICAgICAgICAgICAgICogcmVwb3J0cyBibG9ja2VkLWJ5LVNU
SS9Nb3ZTUy4KKyAgICAgICAgICAgICAqIEF0IGFueSBwb2ludCBpZiBCbG9ja2VkLWJ5LVNUSS9N
b3ZTUyBhcmUgYWN0aXZlLCBleHRyYSBWTUVudHJ5CisgICAgICAgICAgICAgKiBjb25zaXN0ZW5j
eSBjaGVja3MgYXJlIGFwcGxpZWQsIGNyb3NzLWNoZWNraW5nIEVGTEFHUy5URiwKKyAgICAgICAg
ICAgICAqIFBFTkRJTkdfREJHLkJTIGFuZCBERUJVR0NUTC5CVEYuICBUaGVzZSBjb25zaXN0ZW5j
eSBjaGVja3MKKyAgICAgICAgICAgICAqIGFwcGx5IHRvIEFjdGl2aXR5LXN0YXRlLUhMVCB0b28s
IGJ1dCBYZW4gZG9lc24ndCBzdXBwb3J0IHRoaXMuCiAgICAgICAgICAgICAgKgotICAgICAgICAg
ICAgICogVGhlIFZNRW50cnkgY2hlY2tzIHdoZW4gRUZMQUdTLlRGIGlzIHNldCBkb24ndCBsaWtl
IGEgVk1DUyBpbgotICAgICAgICAgICAgICogdGhpcyBzdGF0ZS4gIERlc3BpdGUgYSAjREIgcXVl
dWVkIGluIFZNRU5UUllfSU5UUl9JTkZPLCB0aGUKLSAgICAgICAgICAgICAqIHN0YXRlIGlzIHJl
amVjdGVkIGFzIERSNi5CUyBpc24ndCBwZW5kaW5nLiAgRml4IHRoaXMgdXAuCisgICAgICAgICAg
ICAgKiBUaGUgVk1DUyBzdGF0ZSBhdCB0aGUgcG9pbnQgb2YgI0RCIGludGVyY2VwdCBkb2VzIG5v
dCBzYXRpc2Z5CisgICAgICAgICAgICAgKiB0aGUgY29uc2lzdGVuY3kgY2hlY2tzLiAgSW4gdGhl
IGNhc2UgdGhhdCBhIFNpbmdsZVN0ZXAgc2hvdWxkCisgICAgICAgICAgICAgKiBiZSBwZW5kaW5n
LCBmaWxsIFBFTkRJTkdfREJHIGJhY2sgaW4gdG8gc2F0aXNmeSB0aGUgY29uc2l0ZW5jeQorICAg
ICAgICAgICAgICogY2hlY2suCiAgICAgICAgICAgICAgKi8KICAgICAgICAgICAgIGlmICggdW5s
aWtlbHkocmVncy0+ZWZsYWdzICYgWDg2X0VGTEFHU19URikgKQogICAgICAgICAgICAgewotICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW50X2luZm87CisgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBpbnRfaW5mbywgZGVidWdjdGw7CiAKICAgICAgICAgICAgICAgICBfX3ZtcmVh
ZChHVUVTVF9JTlRFUlJVUFRJQklMSVRZX0lORk8sICZpbnRfaW5mbyk7CisgICAgICAgICAgICAg
ICAgX192bXJlYWQoR1VFU1RfSUEzMl9ERUJVR0NUTCwgJmRlYnVnY3RsKTsKIAotICAgICAgICAg
ICAgICAgIGlmICggaW50X2luZm8gJiAoVk1YX0lOVFJfU0hBRE9XX1NUSSB8IFZNWF9JTlRSX1NI
QURPV19NT1ZfU1MpICkKKyAgICAgICAgICAgICAgICBpZiAoIChpbnRfaW5mbyAmIChWTVhfSU5U
Ul9TSEFET1dfU1RJIHwgVk1YX0lOVFJfU0hBRE9XX01PVl9TUykpICYmCisgICAgICAgICAgICAg
ICAgICAgICAhKGRlYnVnY3RsICYgSUEzMl9ERUJVR0NUTE1TUl9CVEYpICkKICAgICAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGVuZGluZ19kYmc7CiAK

--=separator--

