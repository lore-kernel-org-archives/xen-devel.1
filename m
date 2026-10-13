Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950A3CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:29:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447195.1663527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbdI-0005eS-F1; Tue, 13 Oct 2026 12:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447195.1663527; Tue, 13 Oct 2026 12:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbdG-0005XD-Mo; Tue, 13 Oct 2026 12:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1447195;
 Tue, 13 Oct 2026 12:29:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcx-000207-KN; Tue, 13 Oct 2026 12:29:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbcw-00DIaV-Tv; Tue, 13 Oct 2026 14:29:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2401-e002-0a2a0a5209dd-0a2a4503a296-40
 for <multiple-recipients>; Tue, 13 Oct 2026 14:29:06 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2411-fae8-0a2a45030019-6882d725a7b0-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:29:06 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbct-00000003NJD-2Axv; Tue, 13 Oct 2026 12:29:03 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbct-0000000F9PF-18JY; Tue, 13 Oct 2026 12:29:03 +0000
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
Subject: Xen Security Advisory 521 v2 (CVE-2026-102701) - tapdisk:
 Out-of-bounds access in tap_ctl_connect_xenblkif()
Message-Id: <E1xGbct-0000000F9PF-18JY@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:29:03 +0000
X-purgate-ID: tlsNG-33051d/1791894546-77EC24E9-556037BB/0/0
X-purgate-type: clean
X-purgate-size: 6574

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

           Xen Security Advisory CVE-2026-102701 / XSA-521
                              version 2

      tapdisk: Out-of-bounds access in tap_ctl_connect_xenblkif()

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Tapdisk is a userspace xen-blkback implementation used by the XAPI
toolstack.

During connection, multi-page rings may be negotiated between the
frontend and backend.  Tapdisk had no boundary check on the size
requested by the frontend, and assumed it did not exceed 8.

IMPACT
======

A buggy or malicious guest can cause a stack overflow in tapdisk,
potentially leading to code execution.  Tapdisk normally runs as root.

VULNERABLE SYSTEMS
==================

All versions of tapdisk are vulnerable.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by Claude Opus and diagnosed as a security issue
by Teddy Astie of Vates.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa521.patch           blktap master

$ sha256sum xsa521*
72ece150e9d0836f217f3382c8dc76cd51bffbe4b7610c00f219b90e5600cbc5  xsa521.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOIvgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZgdgIAKXTyop/90HNxeBpRVbYP2vrPCm2YBMzoc3YtxdM
0wWdbFvUptHWnzypCWuUGJWq8ZFf4lInnkJrj0sJ9te+OSQDqcfwTMEQuDWzBM08
lQ27H0kcum3rble2V2CFCK4uOoLYwOYX/bA5vCeGiiPQcUU3m++6IoAMaRY7G2V7
RTNJmNCtbGiC7l3ExUX9KxnFCSaX9gL99YkygybBecSsjJhdlGZj7pzvJtomv1sC
fVSAFmXkivLGKX8TXQdj/48xmdqNSIQgYbdSdyZgGjmy7bxIgxB576FHwlN/fzf7
ZzpeEO8yZTFWeCJCKZavvjsq/7u2vxUtpoL3c81vSKWCOLc=
=w1aW
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa521.patch"
Content-Disposition: attachment; filename="xsa521.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1YmplY3Q6IEVuc3Vy
ZSBwYXNzZWQgcmluZy1wYWdlLW9yZGVyIGlzIHZhbGlkCgpUaGUgY3VycmVudCBsb2dpYyBhY2Nl
cHRzIGFueSBndWVzdCBwcm92aWRlZCByaW5nIG9yZGVyLCB3aGljaCBjYW4gY2F1c2UgYQpzdGFj
ayBvdmVyZmxvdyBpbiB0YXBfY3RsX2Nvbm5lY3RfeGVuYmxraWYoKSBhcyB0YXBkaXNrX21lc3Nh
Z2VfYmxraWY6OmdyZWYKY2FuIG9ubHkgc3RvcmUgOCBncmFudCByZWZlcmVuY2VzLCB5ZXQgb3Jk
ZXIgbWF5IGJlIGxhcmdlciB0aGFuIDMuCgpGaXggdGhpcyBieSBjaGVja2luZyB0aGF0IHJpbmcg
b3JkZXIgdmFsdWVzIGlzIGluIFswLi4zXSByYW5nZS4gIEFsc28gY2xhcmlmeQp0aGUgZ3JlZiBh
cnJheSBzaXplIGluIHRhcGRpc2tfbWVzc2FnZV9ibGtpZiAoZml4ZXMgVE9ETykuCgpUaGlzIGlz
IFhTQS01MjEgLyBDVkUtMjAyNi0xMDI3MDEuCgpTaWduZWQtb2ZmLWJ5OiBUZWRkeSBBc3RpZSA8
dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4KUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3Nz
LmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpUZXN0ZWQtYnk6IEFsZXggQnJldHQgPGFsZXguYnJldHRA
Y2l0cml4LmNvbT4KCmRpZmYgLS1naXQgYS9jb250cm9sL3RhcC1jdGwteGVuLmMgYi9jb250cm9s
L3RhcC1jdGwteGVuLmMKaW5kZXggZjA5Yjc2ZWE4MjU1Li4zN2RmZjA2NjIzYmYgMTAwNjQ0Ci0t
LSBhL2NvbnRyb2wvdGFwLWN0bC14ZW4uYworKysgYi9jb250cm9sL3RhcC1jdGwteGVuLmMKQEAg
LTQ1LDYgKzQ1LDggQEAKICNpbmNsdWRlIDxzdHJpbmcuaD4KICNpbmNsdWRlIDx1bmlzdGQuaD4K
IAorI2luY2x1ZGUgInhlbl9ibGtpZi5oIgorI2luY2x1ZGUgImRlYnVnLmgiCiAjaW5jbHVkZSAi
dGFwLWN0bC5oIgogI2luY2x1ZGUgImNvbXBpbGVyLmgiCiAjaW5jbHVkZSAidXRpbC5oIgpAQCAt
NTgsNyArNjAsOSBAQCB0YXBfY3RsX2Nvbm5lY3RfeGVuYmxraWYoY29uc3QgcGlkX3QgcGlkLCBj
b25zdCBkb21pZF90IGRvbWlkLCBjb25zdCBpbnQgZGV2aWQsCiAgICAgdGFwZGlza19tZXNzYWdl
X3QgbWVzc2FnZTsKICAgICBpbnQgaSwgZXJyOwogCi0JbWVtc2V0KCZtZXNzYWdlLCAwLCBzaXpl
b2YobWVzc2FnZSkpOworICAgIEFTU0VSVChvcmRlciA+PSAwICYmIG9yZGVyIDw9IE1BWF9SSU5H
X1BBR0VfT1JERVIpOworCisgICAgbWVtc2V0KCZtZXNzYWdlLCAwLCBzaXplb2YobWVzc2FnZSkp
OwogICAgIG1lc3NhZ2UudHlwZSA9IFRBUERJU0tfTUVTU0FHRV9YRU5CTEtJRl9DT05ORUNUOwog
ICAgIG1lc3NhZ2UuY29va2llID0gbWlub3I7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdGFwZGlz
ay1tZXNzYWdlLmggYi9pbmNsdWRlL3RhcGRpc2stbWVzc2FnZS5oCmluZGV4IDQ4OTAxN2NhNjkw
OS4uNzIzMWExNGQzMDFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL3RhcGRpc2stbWVzc2FnZS5oCisr
KyBiL2luY2x1ZGUvdGFwZGlzay1tZXNzYWdlLmgKQEAgLTM0LDYgKzM0LDggQEAKICNpbmNsdWRl
IDxpbnR0eXBlcy5oPgogI2luY2x1ZGUgPHN5cy90eXBlcy5oPgogCisjaW5jbHVkZSAieGVuX2Js
a2lmLmgiCisKIC8qCiAgKiBUT0RPIFRoaXMgaXMgcXVpdGUgc21hbGwgc2luY2Ugd2UgZG9uJ3Qg
YWxsb3cgcGF0aCBiaWdnZXIgdGhhbiAyNTYgY2hhcnMuIElmCiAgKiB3ZSBldmVyIGluY3JlYXNl
IHRoaXMsIG1ha2Ugc3VyZSB0YXBkaXNrX21lc3NhZ2VfdCBzdHJ1Y3R1cmVzIGFyZSBub3QKQEAg
LTEzNSw5ICsxMzcsOCBAQCB0eXBlZGVmIHN0cnVjdCB0YXBkaXNrX21lc3NhZ2VfYmxraWYgewog
CiAJLyoqCiAJICogR3JhbnQgcmVmZXJlbmNlcyBmb3IgdGhlIHNoYXJlZCByaW5nLgotCSAqIFRP
RE8gV2h5IDggc3BlY2lmaWNhbGx5PwogCSAqLwotCXVpbnQzMl90IGdyZWZbOF07CisJdWludDMy
X3QgZ3JlZltNQVhfUklOR19QQUdFU107CiAKIAkvKioKIAkgKiBOdW1iZXIgb2YgcGFnZXMgaW4g
dGhlIHJpbmcsIGV4cHJlc3NlZCBhcyBhIHBhZ2Ugb3JkZXIuCmRpZmYgLS1naXQgYS90YXBiYWNr
L2Zyb250ZW5kLmMgYi90YXBiYWNrL2Zyb250ZW5kLmMKaW5kZXggMjQzZjg0MjUyZGQ2Li45ODZm
NDU2NDdiZjYgMTAwNjQ0Ci0tLSBhL3RhcGJhY2svZnJvbnRlbmQuYworKysgYi90YXBiYWNrL2Zy
b250ZW5kLmMKQEAgLTExOSw2ICsxMTksMTIgQEAgY29ubmVjdF90YXAodmJkX3QgKiBjb25zdCBk
ZXZpY2UpCiAgICAgICAgICAgICAgICAgIiVkIiwgJm9yZGVyKSkKICAgICAgICAgb3JkZXIgPSAw
OwogCisgICAgaWYgKG9yZGVyIDwgMCB8fCBvcmRlciA+IE1BWF9SSU5HX1BBR0VfT1JERVIpIHsK
KyAgICAgICAgV0FSTihkZXZpY2UsICJmcm9udC1lbmQgYXNrZWQgZm9yIGFuIGludmFsaWQgcmlu
ZyBvcmRlcjogJWRcbiIsIG9yZGVyKTsKKyAgICAgICAgZXJyID0gRUlOVkFMOworICAgICAgICBn
b3RvIG91dDsKKyAgICB9CisKICAgICAgbnJfcGFnZXMgPSAxIDw8IG9yZGVyOwogCiAgICAgaWYg
KCEoZ3JlZiA9IGNhbGxvYyhucl9wYWdlcywgc2l6ZW9mKGdyYW50X3JlZl90KSkpKSB7Cg==

--=separator--

