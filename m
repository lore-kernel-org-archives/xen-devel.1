Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC19BC54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372605.1620143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZe-0003cZ-Mp; Tue, 28 Jul 2026 12:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372605.1620143; Tue, 28 Jul 2026 12:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZc-0003T5-1N; Tue, 28 Jul 2026 12:06:16 +0000
Received: by outflank-mailman (input) for mailman id 1372605;
 Tue, 28 Jul 2026 12:05:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYu-0004Zl-Pp; Tue, 28 Jul 2026 12:05:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYu-00EbuA-2u; Tue, 28 Jul 2026 14:05:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b0a-5cb7-0a2a0a5109dd-0a2a4506d2aa-4
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:32 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b0a-195a-0a2a45060019-6882d725acb0-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:31 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYp-00DPFi-1f;
 Tue, 28 Jul 2026 12:05:27 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYp-003Dy5-0f;
 Tue, 28 Jul 2026 12:05:27 +0000
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
Subject: Xen Security Advisory 506 v2 (CVE-2026-62433) - correct buffer
 checks for DM_OP hypercalls
Message-Id: <E1wogYp-003Dy5-0f@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:27 +0000
X-purgate-ID: tlsNG-16d1c6/1785240331-FEA7477B-8DF5F12B/0/0
X-purgate-type: clean
X-purgate-size: 7333

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62433 / XSA-506
                               version 2

              correct buffer checks for DM_OP hypercalls

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Parts of the DM_OP handling code assumes the caller has provided the
required number of buffers for the given operation without any checking
being done.  As a result, certain operations might access stack
rubble as structures are possibly uninitialized.

IMPACT
======

A device model of a HVM guest can gain insight on the contents of the
Xen stack, thus possibly leaking data from other guests contexts.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.10 onwards are vulnerable.  Xen versions 4.9 and
earlier are not vulnerable.

Only entities controlling HVM guests can leverage the vulnerability.
These are device models running in either a stub domain or de-privileged
in Dom0.

MITIGATION
==========

Running only PV or PVH guests will avoid the vulnerability.

(Switching from a device model stub domain or a de-privileged device
model to a fully privileged Dom0 device model does NOT mitigate this
vulnerability.  Rather, it simply recategorises the vulnerability to
hostile management code, regarding it "as designed"; thus it merely
reclassifies these issues as "not a bug".  The security of a Xen system
using stub domains is still better than with a qemu-dm running as a Dom0
process.  Users and vendors of stub qemu dm systems should not change
their configuration to use a Dom0 QEMU process.)

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa506.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa506*
7fa79f0421eafa420f7af791ad35a96a769c945260d81419052611771347b411  xsa506.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomrwMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZNF4H/0c6JMsivAWWDIQ920Bwh7EEOKhMv3nGIrBqrN8/
TGKJNNoNQinhoQv9fnqwsHaiC8e49PNUJqTpEN8/o/b0obnl4Tw2JyUXFY1bZyaz
XNS85rkrUc0+Ue/Ka2464mmQ826TJXfaXG9CZYlC5cO/JtzX65ecMW4H7ju2tdnt
c9xK+I5kIQPwUwy3HUMrKFvWi+JIvpCzhuHYDH2iJDecmk42pOmnKtS54q6YO15n
c4xdn7aNyeECKQw4qUcjKC7zKRgrqFu5J3BlvXauZOkJCL50PK+OpWK6QV+fRNGy
N7dnY5w+1BMVrHywZI5iy8WqZtJoi6TOO1Gl0WcB07/vvJk=
=APkr
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa506.patch"
Content-Disposition: attachment; filename="xsa506.patch"
Content-Transfer-Encoding: base64

RnJvbSA2YzM4ODIzZTg5NzFmYWJkNGQyZTRkNDQ3YzY1YjM5ZjU3Yjk1M2Uz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUdWUsIDE0IEp1bCAy
MDI2IDEzOjEzOjEyICswMjAwClN1YmplY3Q6IHhlbi9kbW9wOiBjaGVjayBu
dW1iZXIgb2YgaW5wdXQgYnVmZmVycwpNSU1FLVZlcnNpb246IDEuMApDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhlIGh5cGVyY2FsbCByZXF1aXJl
cyBhdCBsZWFzdCBvbmUgaW5wdXQgYnVmZmVyLCBhcyBib3RoIGFyY2gtc3Bl
Y2lmaWMKaW1wbGVtZW50YXRpb25zIG9mIGRtX29wKCkgdW5jb25kaXRpb25h
bGx5IGFzc3VtZSAtPmJ1ZlswXSB0byBiZSB2YWxpZCAoYW5kCm5vdCBzdGFj
ayBydWJibGUpLgoKQWRkaXRpb25hbGx5LCBYRU5fRE1PUF9tb2RpZmllZF9t
ZW1vcnkgcmVxdWlyZXMgdHdvIGlucHV0IGJ1ZmZlcnMsIHlldCB0aGUKY29k
ZSB3YXMgYXNzdW1pbmcgdGhlIHNlY29uZCBidWZmZXIgdG8gYWx3YXlzIGJl
IHByb3ZpZGVkIGJ5IHRoZSB1c2VyIHdoZW4KY2hlY2tpbmcgZm9yIHRoZSBu
dW1iZXIgb2YgZXh0ZW50cy4gIEluIGNhc2UgdGhlIGNhbGxlciBzZXRzIG5y
X2J1ZnMgdG8gMSwKdGhlIGNvZGUgaW4gbW9kaWZpZWRfbWVtb3J5KCkgd2ls
bCByZWFkIHN0YWNrIGdhcmJhZ2UgYXMgdGhlIHNpemUgb2YgdGhlCmJ1ZmZl
ciwgdGh1cyBhbGxvd2luZyB0aGUgY2FsbGVyIHNvbWUgZGVncmVlIG9mIGlu
c2lnaHQgb24gdGhlIGNvbnRlbnRzIG9mCnRoZSBzdGFjayBieSBwcm9iaW5n
IHdoZXRoZXIgdGhlIGh5cGVyY2FsbCByZXR1cm5zIC1FSU5WQUwgb3IgLUVG
QVVMVCBhcyBhCnJlc3VsdCBvZiBzdWNoIGJvZ3VzIGNhbGwuCgpUaGlzIGlz
IFhTQS01MDYgLyBDVkUtMjAyNi02MjQzMy4KCkZpeGVzOiBlM2I5M2IzYzU5
NTQgKCJkbW9wOiBhZGQgeGVuZGV2aWNlbW9kZWxfbW9kaWZpZWRfbWVtb3J5
X2J1bGsoKSIpCkZpeGVzOiA4NWNiMTVkZmU0ZDEgKCJ4ODYvaHZtL2Rtb3A6
IG9ubHkgY29weSB3aGF0IGlzIG5lZWRlZCB0by9mcm9tIHRoZSBndWVzdCIp
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2Rt
LmMgfCA5ICsrKysrKysrKwogeGVuL2NvbW1vbi9kbS5jICAgICAgIHwgMyAr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG0uYyBiL3hlbi9hcmNoL3g4Ni9o
dm0vZG0uYwppbmRleCAwNjY0OThlMDdlYTEuLjFmNDRmZmYxMmEyMSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vZG0uYwpAQCAtNDk0LDYgKzQ5NCwxMiBAQCBpbnQgZG1fb3Ao
Y29uc3Qgc3RydWN0IGRtb3BfYXJncyAqb3BfYXJncykKICAgICAgICAgc3Ry
dWN0IHhlbl9kbV9vcF9tb2RpZmllZF9tZW1vcnkgKmRhdGEgPQogICAgICAg
ICAgICAgJm9wLnUubW9kaWZpZWRfbWVtb3J5OwogCisgICAgICAgIGlmICgg
b3BfYXJncy0+bnJfYnVmcyAhPSAyICkKKyAgICAgICAgeworICAgICAgICAg
ICAgcmMgPSAtRUlOVkFMOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAg
IH0KKwogICAgICAgICByYyA9IG1vZGlmaWVkX21lbW9yeShkLCBvcF9hcmdz
LCBkYXRhKTsKICAgICAgICAgY29uc3Rfb3AgPSAhcmM7CiAgICAgICAgIGJy
ZWFrOwpAQCAtNjU1LDYgKzY2MSw5IEBAIGludCBjb21wYXRfZG1fb3AoCiAg
ICAgdW5zaWduZWQgaW50IGk7CiAgICAgaW50IHJjOwogCisgICAgaWYgKCAh
bnJfYnVmcyApCisgICAgICAgIHJldHVybiAtRU5PREFUQTsKKwogICAgIGlm
ICggbnJfYnVmcyA+IEFSUkFZX1NJWkUoYXJncy5idWYpICkKICAgICAgICAg
cmV0dXJuIC1FMkJJRzsKIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kbS5j
IGIveGVuL2NvbW1vbi9kbS5jCmluZGV4IDIwMWI2NTJkZWI3ZS4uODY4OTcy
OGFiN2EzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RtLmMKKysrIGIveGVu
L2NvbW1vbi9kbS5jCkBAIC0yNiw2ICsyNiw5IEBAIGxvbmcgZG9fZG1fb3Ao
CiAgICAgc3RydWN0IGRtb3BfYXJncyBhcmdzOwogICAgIGludCByYzsKIAor
ICAgIGlmICggIW5yX2J1ZnMgKQorICAgICAgICByZXR1cm4gLUVOT0RBVEE7
CisKICAgICBpZiAoIG5yX2J1ZnMgPiBBUlJBWV9TSVpFKGFyZ3MuYnVmKSAp
CiAgICAgICAgIHJldHVybiAtRTJCSUc7CiAKLS0gCjIuNTMuMAoK

--=separator--

