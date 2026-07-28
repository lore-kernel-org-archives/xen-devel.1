Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3E3C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372527.1620045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZA-0007Bo-UF; Tue, 28 Jul 2026 12:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372527.1620045; Tue, 28 Jul 2026 12:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZ8-00075e-Vf; Tue, 28 Jul 2026 12:05:46 +0000
Received: by outflank-mailman (input) for mailman id 1372527;
 Tue, 28 Jul 2026 12:05:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYl-00036z-0S; Tue, 28 Jul 2026 12:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYk-00Ebq5-9l; Tue, 28 Jul 2026 14:05:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689afb-5cb7-0a2a0a5109dd-0a2a45089998-22
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:22 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b00-f659-0a2a45080019-6882d725e092-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:21 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYf-00DPEI-27;
 Tue, 28 Jul 2026 12:05:17 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYf-003DpD-15;
 Tue, 28 Jul 2026 12:05:17 +0000
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
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 503 v2 (CVE-2026-62430) - x86:
 Out-of-bounds read in vRTC emulation
Message-Id: <E1wogYf-003DpD-15@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:17 +0000
X-purgate-ID: tlsNG-c1860d/1785240322-DFAD487B-A38BD2BE/0/0
X-purgate-type: clean
X-purgate-size: 9217

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62430 / XSA-503
                               version 2

               x86: Out-of-bounds read in vRTC emulation

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Accesses to the CMOS memory contents are done using an indirect IO port
pair.  Therefore Xen needs to cache the guest chosen index, and one of
the usages of the index didn't take the necessary locking to avoid
concurrent changes.  As a result, a guest could change the index after
it being checked, causing a subsequent out-of-bound read access to the
contents of an array.

IMPACT
======

An attacker can read out-of-bounds, this is limited to Xen data, and not
data belonging to other guests.

VULNERABLE SYSTEMS
==================

All Xen versions from 3.2 onwards are vulnerable.  Xen versions 3.1 and
earlier are not vulnerable.

MITIGATION
==========

Running only PV or PVH guests will avoid the vulnerability.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa503.patch           xen-unstable - Xen 4.19.x
xsa503-4.18.patch      Xen 4.18.x - Xen 4.17.x

$ sha256sum xsa503*
86ffb287767aa410e2c6b970db5167d743ca3c788b43522d46d06f41caead929  xsa503.patch
3a09ea83f092ade72c8d107c91b480f44e5c865d7f36306db8490403db9aa7ed  xsa503-4.18.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomrgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZMg8H/0FuxuDZLnfvFfa8uGtWBokPW93kxSjCoPG3obbR
pJ4IqULRNrdMQfo+3ssrppoH41/ADzatAkbB6seW7UWhVmXCFBE19ZELGXtkn1bh
GU68jjUq4u4BgQSIXsapcN2wNPahVOnD8+N5dayb+/zde8aBST10xhT3tmvNnR5k
dI4t1W3LOXqO4QPXKua7ipLGzTnnzkgHflssYbyclmL2qq82frDUCl5Kf8EDkzhC
I2YigSVjYsreQHIYUpeGADB7/Xpr/ARnqaWi2cB9O3FhlkvJDIWOAR3fUuIfZnim
ASzMZSPwRQ8Mo2TuzSSXjG2oIVkZy8+6thia9cZLuP18UzY=
=UuFk
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa503.patch"
Content-Disposition: attachment; filename="xsa503.patch"
Content-Transfer-Encoding: base64

RnJvbSA5Mjg4NTA3NmVkNmVhM2E2NTJiMDE0M2NlMTEyNTgyZjkxOTMyYjEz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBGcmksIDEwIEp1bCAy
MDI2IDE1OjA1OjUwICswMjAwClN1YmplY3Q6IHg4Ni92cnRjOiBmaXggcmFj
ZSBpbiBDTU9TIGluZGV4IGNoZWNraW5nCk1JTUUtVmVyc2lvbjogMS4wCkNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpEbyB0aGUgY2hlY2tpbmcgZm9y
IGEgdmFsaWQgQ01PUyBpbmRleCB3aGlsZSBob2xkaW5nIHRoZSBzcGlubG9j
aywKb3RoZXJ3aXNlIHRoZSB2YWx1ZSBjb3VsZCBiZSBjaGFuZ2VkIGJ5IHRo
ZSBndWVzdCBhZnRlciBoYXZpbmcgYmVlbgpjaGVja2VkLgoKVGhpcyBpcyBY
U0EtNTAzIC8gQ1ZFLTIwMjYtNjI0MzAuCgpGaXhlczogMzRiZWYwZTZkNWY0
ICgiaHZtOiBBZGQgbG9ja2luZyB0byBwbGF0Zm9ybSB0aW1lcnMuIikKU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9ydGMuYyB8IDE5ICsrKysr
KysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vcnRjLmMgYi94ZW4vYXJjaC94ODYvaHZtL3J0Yy5jCmluZGV4IDRi
YTU4ODFiMjRkZS4uNjViM2I3OWYxZWRiIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3J0Yy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMK
QEAgLTY0NywxMyArNjQ3LDIxIEBAIHN0YXRpYyBpbnQgdXBkYXRlX2luX3By
b2dyZXNzKFJUQ1N0YXRlICpzKQogICAgIHJldHVybiAwOwogfQogCi1zdGF0
aWMgdWludDMyX3QgcnRjX2lvcG9ydF9yZWFkKFJUQ1N0YXRlICpzKQorc3Rh
dGljIGJvb2wgcnRjX2lvcG9ydF9yZWFkKFJUQ1N0YXRlICpzLCB1aW50MzJf
dCAqdmFsKQogewogICAgIGludCByZXQ7CiAgICAgc3RydWN0IGRvbWFpbiAq
ZCA9IHZydGNfZG9tYWluKHMpOwogCisgICAgKnZhbCA9IH4wOworCiAgICAg
c3Bpbl9sb2NrKCZzLT5sb2NrKTsKIAorICAgIGlmICggcy0+aHcuY21vc19p
bmRleCA+PSBSVENfQ01PU19TSVpFICkKKyAgICB7CisgICAgICAgIHNwaW5f
dW5sb2NrKCZzLT5sb2NrKTsKKyAgICAgICAgcmV0dXJuIGZhbHNlOworICAg
IH0KKwogICAgIHN3aXRjaCAoIHMtPmh3LmNtb3NfaW5kZXggKQogICAgIHsK
ICAgICBjYXNlIFJUQ19TRUNPTkRTOgpAQCAtNjkzLDcgKzcwMSw5IEBAIHN0
YXRpYyB1aW50MzJfdCBydGNfaW9wb3J0X3JlYWQoUlRDU3RhdGUgKnMpCiAK
ICAgICBzcGluX3VubG9jaygmcy0+bG9jayk7CiAKLSAgICByZXR1cm4gcmV0
OworICAgICp2YWwgPSByZXQ7CisKKyAgICByZXR1cm4gdHJ1ZTsKIH0KIAog
c3RhdGljIGludCBjZl9jaGVjayBoYW5kbGVfcnRjX2lvKApAQCAtNzE4LDEx
ICs3MjgsOCBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGhhbmRsZV9ydGNfaW8o
CiAgICAgICAgICp2YWwgPSAweGZmOwogICAgICAgICByZXR1cm4gWDg2RU1V
TF9PS0FZOwogICAgIH0KLSAgICBlbHNlIGlmICggdnJ0Yy0+aHcuY21vc19p
bmRleCA8IFJUQ19DTU9TX1NJWkUgKQotICAgIHsKLSAgICAgICAgKnZhbCA9
IHJ0Y19pb3BvcnRfcmVhZCh2cnRjKTsKKyAgICBlbHNlIGlmICggcnRjX2lv
cG9ydF9yZWFkKHZydGMsIHZhbCkgKQogICAgICAgICByZXR1cm4gWDg2RU1V
TF9PS0FZOwotICAgIH0KIAogICAgIHJldHVybiBYODZFTVVMX1VOSEFORExF
QUJMRTsKIH0KLS0gCjIuNTMuMAoK

--=separator
Content-Type: application/octet-stream; name="xsa503-4.18.patch"
Content-Disposition: attachment; filename="xsa503-4.18.patch"
Content-Transfer-Encoding: base64

RnJvbSAyNjQ1MmUyODllYjZmNjRlODVkNjMwYzA2YTlmM2RlN2QwMTg4Y2Q3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBXZWQsIDE1IEp1bCAy
MDI2IDEyOjQ0OjM3ICswMjAwClN1YmplY3Q6IHg4Ni92cnRjOiBmaXggcmFj
ZSBpbiBDTU9TIGluZGV4IGNoZWNraW5nCk1JTUUtVmVyc2lvbjogMS4wCkNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpEbyB0aGUgY2hlY2tpbmcgZm9y
IGEgdmFsaWQgQ01PUyBpbmRleCB3aGlsZSBob2xkaW5nIHRoZSBzcGlubG9j
aywKb3RoZXJ3aXNlIHRoZSB2YWx1ZSBjb3VsZCBiZSBjaGFuZ2VkIGJ5IHRo
ZSBndWVzdCBhZnRlciBoYXZpbmcgYmVlbgpjaGVja2VkLgoKVGhpcyBpcyBY
U0EtNTAzIC8gQ1ZFLTIwMjYtNjI0MzAuCgpGaXhlczogMzRiZWYwZTZkNWY0
ICgiaHZtOiBBZGQgbG9ja2luZyB0byBwbGF0Zm9ybSB0aW1lcnMuIikKU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9ydGMuYyB8IDIxICsrKysr
KysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS9ydGMuYyBiL3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMKaW5kZXgg
NDgzOTM3NDM1MjA1Li5hZDE1ODI1YTFmMjAgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vcnRjLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9ydGMu
YwpAQCAtNjQ3LDE2ICs2NDcsMjQgQEAgc3RhdGljIGludCB1cGRhdGVfaW5f
cHJvZ3Jlc3MoUlRDU3RhdGUgKnMpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyB1aW50MzJfdCBydGNfaW9wb3J0X3JlYWQoUlRDU3RhdGUgKnMsIHVp
bnQzMl90IGFkZHIpCitzdGF0aWMgYm9vbCBydGNfaW9wb3J0X3JlYWQoUlRD
U3RhdGUgKnMsIHVpbnQzMl90IGFkZHIsIHVpbnQzMl90ICp2YWwpCiB7CiAg
ICAgaW50IHJldDsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdnJ0Y19kb21h
aW4ocyk7CiAKKyAgICAqdmFsID0gfjA7CisKICAgICBpZiAoIChhZGRyICYg
MSkgPT0gMCApCi0gICAgICAgIHJldHVybiAweGZmOworICAgICAgICByZXR1
cm4gdHJ1ZTsKIAogICAgIHNwaW5fbG9jaygmcy0+bG9jayk7CiAKKyAgICBp
ZiAoIHMtPmh3LmNtb3NfaW5kZXggPj0gUlRDX0NNT1NfU0laRSApCisgICAg
eworICAgICAgICBzcGluX3VubG9jaygmcy0+bG9jayk7CisgICAgICAgIHJl
dHVybiBmYWxzZTsKKyAgICB9CisKICAgICBzd2l0Y2ggKCBzLT5ody5jbW9z
X2luZGV4ICkKICAgICB7CiAgICAgY2FzZSBSVENfU0VDT05EUzoKQEAgLTY5
Niw3ICs3MDQsOSBAQCBzdGF0aWMgdWludDMyX3QgcnRjX2lvcG9ydF9yZWFk
KFJUQ1N0YXRlICpzLCB1aW50MzJfdCBhZGRyKQogCiAgICAgc3Bpbl91bmxv
Y2soJnMtPmxvY2spOwogCi0gICAgcmV0dXJuIHJldDsKKyAgICAqdmFsID0g
cmV0OworCisgICAgcmV0dXJuIHRydWU7CiB9CiAKIHN0YXRpYyBpbnQgY2Zf
Y2hlY2sgaGFuZGxlX3J0Y19pbygKQEAgLTcxNiwxMSArNzI2LDggQEAgc3Rh
dGljIGludCBjZl9jaGVjayBoYW5kbGVfcnRjX2lvKAogICAgICAgICBpZiAo
IHJ0Y19pb3BvcnRfd3JpdGUodnJ0YywgcG9ydCwgKHVpbnQ4X3QpKnZhbCkg
KQogICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKICAgICB9Ci0g
ICAgZWxzZSBpZiAoIHZydGMtPmh3LmNtb3NfaW5kZXggPCBSVENfQ01PU19T
SVpFICkKLSAgICB7Ci0gICAgICAgICp2YWwgPSBydGNfaW9wb3J0X3JlYWQo
dnJ0YywgcG9ydCk7CisgICAgZWxzZSBpZiAoIHJ0Y19pb3BvcnRfcmVhZCh2
cnRjLCBwb3J0LCB2YWwpICkKICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tB
WTsKLSAgICB9CiAKICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7
CiB9Ci0tIAoyLjUzLjAKCg==

--=separator--

