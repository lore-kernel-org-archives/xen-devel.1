Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92FC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:01:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411341.1642151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVb-0007aB-Ve; Tue, 08 Sep 2026 12:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411341.1642151; Tue, 08 Sep 2026 12:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVb-0007W1-8P; Tue, 08 Sep 2026 12:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1411341;
 Tue, 08 Sep 2026 12:01:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1x3uVY-0006bj-7D; Tue, 08 Sep 2026 12:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uVW-004OAf-UC; Tue, 08 Sep 2026 14:00:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8f2-e002-0a2a0a5209dd-0a2a450b9730-30
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:58 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8f9-b7e8-0a2a450b0019-6882d7258fae-3
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:58 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVQ-004n5e-3D;
 Tue, 08 Sep 2026 12:00:53 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVR-00Gl8b-0v;
 Tue, 08 Sep 2026 12:00:53 +0000
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
Subject: Xen Security Advisory 513 v3 (CVE-2026-79605,CVE-2026-79606) -
 Out-of-bounds accesses in Tapdisk
Message-Id: <E1x3uVR-00Gl8b-0v@xenbits.xenproject.org>
Date: Tue, 08 Sep 2026 12:00:53 +0000
X-purgate-ID: tlsNG-42698a/1788868858-186CA9EA-4D68BDF9/0/0
X-purgate-type: clean
X-purgate-size: 13168

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

     Xen Security Advisory CVE-2026-79605,CVE-2026-79606 / XSA-513
                               version 3

                   Out-of-bounds accesses in Tapdisk

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Tapdisk is a userspace xen-blkback implementation used by the XAPI
toolstack.  Several bounds checks have been found to be incorrect.

 * There is no upper bounds check for blkif->last_sect.  Passing a value
   larger than 7 will result in a read or write beyond the mapped grant.

   This is CVE-2026-79605.

 * The gcopy_segs[] object has incorrect bounds checks on it.  Passing
   nr_segments between 12 and 32 will corrupt adjacent memory.

   This is CVE-2026-79606.

IMPACT
======

A malicious guest can obtain code execution within the tapdisk process
running in dom0.  Tapdisk normally runs as root.

VULNERABLE SYSTEMS
==================

All versions of tapdisk are vulnerable.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

Found by Jihwan Yoon of NAVER Cloud, and reported via XenServer.

RESOLUTION
==========

Applying the appropriate attached patchs resolves this issue.

xsa513-?.patch           blktap master

$ sha256sum xsa513*
41e5f1929a7acbe83820ee0b359f9558120222d32442ea4fb5a6eee0bf937bf1  xsa513-1.patch
a5af5a73d2ede5124735213e4974f1aeff7f8118dfbacd52fbb03168fe96c6af  xsa513-2.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmqf98kMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZiuMIAIaNhPYKG/UeGc1JV70GEcyqS4d6NNlNBY0qtuGl
qVQ8LRVBReqRk0aS0hNDI7txFRsZ18ENteBKG/JaXD4mj5rylpnKdl7y8suTFrGi
QuFk1EyYBrud5gtpwW8sq4GKQLf5hoAIIUDGX4qmEC+blRuHTagUIHNwehrkRB+d
38UxmWQR2ppgBSsCJlclMJKSm1nWo04Qx/Nm3Aoc0og0hv+/UkdkDShTGrP/nutb
/r4yywz6LaqdCl7Te1ULx6sRVl1MIxtDqcvsRajqKc9nV56RAgrj3moIJRXRusW9
YqZxuUw8HJkhpisOlj6A/N16f+G7bxZwb3FEZBKuNGvM6lQ=
=oXUQ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa513-1.patch"
Content-Disposition: attachment; filename="xsa513-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KU3ViamVj
dDogVmFsaWRhdGUgZ3Vlc3QgYmxraWYgcmVxdWVzdCBzZWdtZW50IGJvdW5k
cwoKZmlyc3Rfc2VjdC9sYXN0X3NlY3QgaW4gYSBibGtpZiByZXF1ZXN0IHNl
Z21lbnQgYXJlIGd1ZXN0LWNvbnRyb2xsZWQgOC1iaXQKdmFsdWVzLCBidXQg
ZWFjaCBzZWdtZW50IGFkZHJlc3NlcyBhdCBtb3N0IGEgc2luZ2xlIHBhZ2Ug
KDggc2VjdG9ycykuCnRhcGRpc2tfeGVuYmxraWZfcGFyc2VfcmVxdWVzdCgp
IG9ubHkgY2hlY2tlZCBsYXN0X3NlY3QgPj0gZmlyc3Rfc2VjdCwgc28gYQpz
ZWdtZW50IHdpdGggbGFzdF9zZWN0ID4gNyB5aWVsZGVkIGFuIG92ZXJzaXpl
ZCB0cmFuc2ZlciBsZW5ndGguIFRoYXQgZHJpdmVzCm91dC1vZi1ib3VuZHMg
cG9pbnRlciBhcml0aG1ldGljIGFnYWluc3QgdGhlIHBlci1yZXF1ZXN0IGJ1
ZmZlciBhbmQgb3ZlcmZsb3dzCnRoZSB1aW50MTZfdCBnbnRkZXYgZ3JhbnQt
Y29weSBsZW5ndGggaW4gZ3Vlc3RfY29weTIoKSAoZS5nLiA2OEtCIHRydW5j
YXRlcyB0bwo0S0IsIHNvIHN0YWxlIGJ1ZmZlciBjb250ZW50cyBhcmUgdHJh
bnNmZXJyZWQpLgoKUmVqZWN0IGFueSBzZWdtZW50IHdob3NlIHNlY3RvcnMg
ZmFsbCBvdXRzaWRlIHRoZSBwYWdlLCByZXBsYWNpbmcgdGhlCmxvbmctc3Rh
bmRpbmcgVE9ETyBhdCB0aGUgdmVjdG9yaXNhdGlvbiBsb29wLgoKVGhpcyBp
cyBDVkUtMjAyNi03OTYwNSwgcGFydCBvZiBYU0EtNTEzLgoKU2lnbmVkLW9m
Zi1ieTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KQ28tQXV0
aG9yZWQtQnk6IENsYXVkZSBPcHVzIDQuOCA8bm9yZXBseUBhbnRocm9waWMu
Y29tPgpSZXZpZXdlZC1ieTogVGltIFNtaXRoIDx0aW0uc21pdGhAY2l0cml4
LmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RkLXJlcS5jIGIvZHJpdmVy
cy90ZC1yZXEuYwppbmRleCAyYTNmYjA1ZjRhZDAuLjY5YTk0N2Y1NzBlYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy90ZC1yZXEuYworKysgYi9kcml2ZXJzL3Rk
LXJlcS5jCkBAIC02NDQsOCArNjQ0LDE2IEBAIHRhcGRpc2tfeGVuYmxraWZf
cGFyc2VfcmVxdWVzdChzdHJ1Y3QgdGRfeGVuYmxraWYgKiBjb25zdCBibGtp
ZiwKICAgICAgICAgLyoKICAgICAgICAgICogTm90ZSB0aGF0IGZpcnN0IGFu
ZCBsYXN0IG1heSBiZSBlcXVhbCwgd2hpY2ggbWVhbnMgb25seSBvbmUgc2Vj
dG9yCiAgICAgICAgICAqIG11c3QgYmUgdHJhbnNmZXJyZWQuCisgICAgICAg
ICAqCisgICAgICAgICAqIGZpcnN0X3NlY3QvbGFzdF9zZWN0IGFyZSBndWVz
dC1jb250cm9sbGVkIDgtYml0IHZhbHVlcywgYnV0IGVhY2gKKyAgICAgICAg
ICogc2VnbWVudCBhZGRyZXNzZXMgYXQgbW9zdCBhIHNpbmdsZSBwYWdlLiBS
ZWplY3QgYW55IHNlZ21lbnQgd2hvc2UKKyAgICAgICAgICogc2VjdG9ycyBm
YWxsIG91dHNpZGUgdGhlIHBhZ2U6IGFuIG91dC1vZi1yYW5nZSBsYXN0X3Nl
Y3Qgd291bGQKKyAgICAgICAgICogcHJvZHVjZSBhbiBvdmVyc2l6ZWQgdHJh
bnNmZXIgbGVuZ3RoICh3aGljaCBhbHNvIG92ZXJmbG93cyB0aGUKKyAgICAg
ICAgICogdWludDE2X3QgZ250ZGV2IGdyYW50LWNvcHkgbGVuZ3RoKSBhbmQg
ZHJpdmUgb3V0LW9mLWJvdW5kcyBhY2Nlc3NlcworICAgICAgICAgKiB0byB0
aGUgcGVyLXJlcXVlc3QgYnVmZmVyLgogICAgICAgICAgKi8KLSAgICAgICAg
aWYgKHNlZy0+bGFzdF9zZWN0IDwgc2VnLT5maXJzdF9zZWN0KSB7CisgICAg
ICAgIGlmIChzZWctPmxhc3Rfc2VjdCA8IHNlZy0+Zmlyc3Rfc2VjdCB8fAor
ICAgICAgICAgICAgc2VnLT5sYXN0X3NlY3QgPj0gKFBBR0VfU0laRSA+PiBT
RUNUT1JfU0hJRlQpKSB7CiAgICAgICAgICAgICBSSU5HX0VSUihibGtpZiwg
InJlcSAlbHU6IGludmFsaWQgc2VjdG9ycyAlZC0lZFxuIiwKICAgICAgICAg
ICAgICAgICAgICAgcmVxLT5tc2cuaWQsIHNlZy0+Zmlyc3Rfc2VjdCwgc2Vn
LT5sYXN0X3NlY3QpOwogICAgICAgICAgICAgZXJyID0gRUlOVkFMOwpAQCAt
NjcwLDcgKzY3OCw3IEBAIHRhcGRpc2tfeGVuYmxraWZfcGFyc2VfcmVxdWVz
dChzdHJ1Y3QgdGRfeGVuYmxraWYgKiBjb25zdCBibGtpZiwKICAgICAgICAg
c3RydWN0IGJsa2lmX3JlcXVlc3Rfc2VnbWVudCAqc2VnID0gJnJlcS0+bXNn
LnNlZ1tpXTsKICAgICAgICAgc2l6ZV90IHNpemU7CiAKLSAgICAgICAgLyog
VE9ETyBjaGVjayB0aGF0IGZpcnN0X3NlY3QvbGFzdF9zZWN0IGFyZSB3aXRo
aW4gcGFnZSAqLworICAgICAgICAvKiBmaXJzdF9zZWN0L2xhc3Rfc2VjdCBh
cmUgYWxyZWFkeSB2YWxpZGF0ZWQsIGFib3ZlICovCiAKICAgICAgICAgbmV4
dCA9IHBhZ2UgKyAoc2VnLT5maXJzdF9zZWN0IDw8IFNFQ1RPUl9TSElGVCk7
CiAgICAgICAgIHNpemUgPSBzZWctPmxhc3Rfc2VjdCAtIHNlZy0+Zmlyc3Rf
c2VjdCArIDE7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa513-2.patch"
Content-Disposition: attachment; filename="xsa513-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KU3ViamVj
dDogQm91bmQgbnJfc2VnbWVudHMgYnkgc2VnW10gY2FwYWNpdHkgYW5kIHJp
Z2h0LXNpemUgYnVmZmVyCgpUd28gY29uc3RhbnRzIHdlcmUgaW4gcGxheSBm
b3IgdGhlIG51bWJlciBvZiBzZWdtZW50cyBpbiBhIHJlcXVlc3Q6CgogLSBC
TEtJRl9NQVhfU0VHTUVOVFNfUEVSX1JFUVVFU1QgKDExKSwgdGhlIFhlbiBB
QkkgbGltaXQgYW5kIHRoZSBzaXplIG9mIHRoZQogICByaW5nIGRlc2NyaXB0
b3IncyBibGtpZl9yZXF1ZXN0LnNlZ1tdIGFycmF5OyBhbmQKIC0gQkxLSUZf
TUFYX0JVRkZFUl9TRUdNRU5UU19QRVJfUkVRVUVTVCAoMzIpLCBhIGJsa3Rh
cC1sb2NhbCB2YWx1ZSBpbnRyb2R1Y2VkCiAgIHdoZW4gbXVsdGktcGFnZSBy
aW5ncyB3ZXJlIGVuYWJsZWQgKGRkNjA5NWMpLgoKTXVsdGktcGFnZSByaW5n
cyBlbmxhcmdlIHRoZSByaW5nIChtb3JlIHJlcXVlc3Qgc2xvdHMpLCBub3Qg
dGhlIG51bWJlciBvZgpzZWdtZW50cyBwZXIgcmVxdWVzdCwgc28gc2l6aW5n
IHRoZSBwZXItcmVxdWVzdCBzdHJ1Y3R1cmVzIGJ5IDMyIHdhcyBib3RoCnVu
bmVjZXNzYXJ5IGFuZCB1bnNhZmU6CgogLSB0YXBkaXNrX3hlbmJsa2lmX21h
a2VfdmJkX3JlcXVlc3QoKSB2YWxpZGF0ZWQgbnJfc2VnbWVudHMgYWdhaW5z
dCAzMiwgYnV0CiAgIG5yX3NlZ21lbnRzIGlzIGEgZ3Vlc3QtY29udHJvbGxl
ZCB1aW50OF90IGFuZCBtc2cuc2VnW10gb25seSBob2xkcyAxMQogICBlbnRy
aWVzLiBBIHJlcXVlc3Qgd2l0aCBucl9zZWdtZW50cyBpbiAoMTEsIDMyXSBw
YXNzZWQgdmFsaWRhdGlvbiBhbmQgdGhlbgogICBkcm92ZSBvdXQtb2YtYm91
bmRzIHJlYWRzIG9mIG1zZy5zZWdbXSBpbiB0YXBkaXNrX3hlbmJsa2lmX3Bh
cnNlX3JlcXVlc3QoKQogICBhbmQgZ3Vlc3RfY29weTIoKSwgd2hvc2Ugc3Rh
bGUgYnl0ZXMgd2VyZSB1c2VkIGFzIGdyZWYvZmlyc3Rfc2VjdC9sYXN0X3Nl
Y3QuCiAtIFRoZSBwZXItcmVxdWVzdCBidWZmZXIgYW5kIHRoZSBpb3ZbXS9n
cmVmW10gYXJyYXlzIHdlcmUgb3Zlci1hbGxvY2F0ZWQgdG8gMzIKICAgcGFn
ZXMvZW50cmllcyB3aGVyZSBvbmx5IDExIGFyZSByZWFjaGFibGUgKGdjb3B5
X3NlZ3NbXSB3YXMgYWxyZWFkeSAxMSkuCgpCb3VuZCBucl9zZWdtZW50cyBi
eSBCTEtJRl9NQVhfU0VHTUVOVFNfUEVSX1JFUVVFU1QgYW5kIHNpemUgdGhl
IHBlci1yZXF1ZXN0CmJ1ZmZlciAoVERfUkVRX0JVRkZFUl9TSVpFKSBhbmQg
dGhlIGlvdltdL2dyZWZbXSBhcnJheXMgYnkgdGhlIHNhbWUgY29uc3RhbnQs
CnNvIHRoZSB2YWxpZGF0aW9uIGJvdW5kLCB0aGUgc2VnbWVudCBhcnJheXMs
IGFuZCB0aGUgcmluZyBkZXNjcmlwdG9yJ3Mgc2VnW10KYWxsIGFncmVlLiBi
bG9jay1sY2FjaGUuYyBpbmhlcml0cyB0aGUgY29ycmVjdGVkIGJ1ZmZlciBz
aXplIHZpYQpURF9SRVFfQlVGRkVSX1NJWkUuIEFsc28gZGVyaXZlIHRoZSBi
dWZjYWNoZSBtdW5tYXAgc2l6ZSBmcm9tIFREX1JFUV9CVUZGRVJfU0laRQpz
byB0aGUgbWFwIGFuZCB1bm1hcCBzaXplcyBzaGFyZSBvbmUgZGVmaW5pdGlv
bi4KClRoZSBsZWdhY3kgYmxrdGFwMiBrZXJuZWwtbW1hcCBtYWNyb3MgaW4g
YmxrdGFwbGliLmggKE1NQVBfUEFHRVMgLyBNTUFQX1ZBRERSKQphcmUgYSBz
ZXBhcmF0ZSwga2VybmVsLXNoYXJlZCBsYXlvdXQgYW5kIGFyZSBpbnRlbnRp
b25hbGx5IGxlZnQgdW50b3VjaGVkLgoKVGhpcyBpcyBDVkUtMjAyNi03OTYw
NiwgcGFydCBvZiBYU0EtNTEzLgoKU2lnbmVkLW9mZi1ieTogTWFyayBTeW1z
IDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KQ28tQXV0aG9yZWQtQnk6IENsYXVk
ZSBPcHVzIDQuOCA8bm9yZXBseUBhbnRocm9waWMuY29tPgpSZXZpZXdlZC1i
eTogVGltIFNtaXRoIDx0aW0uc21pdGhAY2l0cml4LmNvbT4KCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3RkLXJlcS5jIGIvZHJpdmVycy90ZC1yZXEuYwppbmRl
eCA1YjliMzNmMTVjNWQuLmY0Njc5YWYxMWMzOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy90ZC1yZXEuYworKysgYi9kcml2ZXJzL3RkLXJlcS5jCkBAIC0xMjEs
NyArMTIxLDcgQEAgdGRfeGVuYmxraWZfYnVmY2FjaGVfZnJlZShzdHJ1Y3Qg
dGRfeGVuYmxraWYgKiBjb25zdCBibGtpZikKIAogICAgIHdoaWxlIChibGtp
Zi0+bl9yZXFzX2J1ZmNhY2hlX2ZyZWUgPiBURF9SRVFTX0JVRkNBQ0hFX01J
Til7CiAgICAgICAgIG11bm1hcChibGtpZi0+cmVxc19idWZjYWNoZVstLWJs
a2lmLT5uX3JlcXNfYnVmY2FjaGVfZnJlZV0sCi0gICAgICAgICAgICAgICAo
c2l6ZV90KUJMS0lGX01BWF9CVUZGRVJfU0VHTUVOVFNfUEVSX1JFUVVFU1Qg
PDwgUEFHRV9TSElGVCk7CisgICAgICAgICAgICAgICAoc2l6ZV90KVREX1JF
UV9CVUZGRVJfU0laRSk7CiAgICAgfQogfQogCkBAIC03ODYsMTEgKzc4Niwx
NCBAQCB0YXBkaXNrX3hlbmJsa2lmX21ha2VfdmJkX3JlcXVlc3Qoc3RydWN0
IHRkX3hlbmJsa2lmICogY29uc3QgYmxraWYsCiAgICAgZ2V0dGltZW9mZGF5
KCZ0YXByZXEtPnRzLCBOVUxMKTsKIAogICAgIC8qCi0gICAgICogQ2hlY2sg
dGhhdCB0aGUgbnVtYmVyIG9mIHNlZ21lbnRzIGlzIHNhbmUuCisgICAgICog
Q2hlY2sgdGhhdCB0aGUgbnVtYmVyIG9mIHNlZ21lbnRzIGlzIHNhbmUuIG5y
X3NlZ21lbnRzIGlzIGd1ZXN0LQorICAgICAqIGNvbnRyb2xsZWQ7IHRoZSBi
bGtpZiBwcm90b2NvbCBwZXJtaXRzIGF0IG1vc3QKKyAgICAgKiBCTEtJRl9N
QVhfU0VHTUVOVFNfUEVSX1JFUVVFU1Qgc2VnbWVudHMgcGVyIHJlcXVlc3Qs
IHdoaWNoIGlzIGhvdyB0aGUKKyAgICAgKiByaW5nIGRlc2NyaXB0b3IgYW5k
IG91ciBwZXItcmVxdWVzdCBidWZmZXJzIGFyZSBzaXplZC4KICAgICAgKi8K
ICAgICBpZiAodW5saWtlbHkoKHRhcHJlcS0+bXNnLm5yX3NlZ21lbnRzID09
IDAgJiYKICAgICAgICAgICAgICAgICB0YXByZXEtPm1zZy5vcGVyYXRpb24g
IT0gQkxLSUZfT1BfV1JJVEVfQkFSUklFUikgfHwKLSAgICAgICAgICAgIHRh
cHJlcS0+bXNnLm5yX3NlZ21lbnRzID4gQkxLSUZfTUFYX0JVRkZFUl9TRUdN
RU5UU19QRVJfUkVRVUVTVCkpIHsKKyAgICAgICAgICAgIHRhcHJlcS0+bXNn
Lm5yX3NlZ21lbnRzID4gQkxLSUZfTUFYX1NFR01FTlRTX1BFUl9SRVFVRVNU
KSkgewogICAgICAgICBSSU5HX0VSUihibGtpZiwgInJlcSAlbHU6IGJhZCBu
dW1iZXIgb2Ygc2VnbWVudHMgaW4gcmVxdWVzdCAoJWQpXG4iLAogICAgICAg
ICAgICAgICAgIHRhcHJlcS0+bXNnLmlkLCB0YXByZXEtPm1zZy5ucl9zZWdt
ZW50cyk7CiAgICAgICAgIGVyciA9IEVJTlZBTDsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdGQtcmVxLmggYi9kcml2ZXJzL3RkLXJlcS5oCmluZGV4IGRhZDQw
ZjI5NDYyOC4uNzI3OWE5MzVhNmI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Rk
LXJlcS5oCisrKyBiL2RyaXZlcnMvdGQtcmVxLmgKQEAgLTM4LDcgKzM4LDE0
IEBACiAjaW5jbHVkZSA8eGVuL2dudGRldi5oPgogI2luY2x1ZGUgInRkLWJs
a2lmLmgiCiAKLSNkZWZpbmUgVERfUkVRX0JVRkZFUl9TSVpFIChCTEtJRl9N
QVhfQlVGRkVSX1NFR01FTlRTX1BFUl9SRVFVRVNUIDw8IFBBR0VfU0hJRlQp
CisvKgorICogQSByaW5nIHJlcXVlc3QgZGVzY3JpcHRvciAoYmxraWZfcmVx
dWVzdF90KSBjYXJyaWVzIGF0IG1vc3QKKyAqIEJMS0lGX01BWF9TRUdNRU5U
U19QRVJfUkVRVUVTVCBzZWdtZW50cywgZWFjaCBtYXBwaW5nIGEgc2luZ2xl
IHBhZ2UsIHNvIHRoZQorICogcGVyLXJlcXVlc3QgZGF0YSBidWZmZXIgYW5k
IHRoZSB2ZWN0b3Jpc2VkIHNlZ21lbnQgYXJyYXlzIGJlbG93IG9ubHkgZXZl
cgorICogbmVlZCB0aGF0IG1hbnkgZW50cmllcy4gKFRoaXMgYmFja2VuZCBk
b2VzIG5vdCBpbXBsZW1lbnQgQkxLSUZfT1BfSU5ESVJFQ1QsCisgKiB3aGlj
aCBpcyB0aGUgb25seSBtZWNoYW5pc20gdGhhdCB3b3VsZCByYWlzZSB0aGUg
cGVyLXJlcXVlc3Qgc2VnbWVudCBjb3VudC4pCisgKi8KKyNkZWZpbmUgVERf
UkVRX0JVRkZFUl9TSVpFIChCTEtJRl9NQVhfU0VHTUVOVFNfUEVSX1JFUVVF
U1QgPDwgUEFHRV9TSElGVCkKIAogLyoqCiAgKiBSZXByZXNlbnRhdGlvbiBv
ZiB0aGUgaW50ZXJtZWRpYXRlIHJlcXVlc3QgdXNlZCB0byByZXRyaWV2ZSBh
IHJlcXVlc3QgZnJvbQpAQCAtODAsOSArODcsOSBAQCBzdHJ1Y3QgdGRfeGVu
YmxraWZfcmVxIHsKICAgICAvKioKICAgICAgKiBUaGUgc2NhdHRlci9nYXRo
ZXIgbGlzdCB0ZF92YmRfcmVxdWVzdF90LmlvdiBwb2ludHMgdG8uCiAgICAg
ICovCi0gICAgc3RydWN0IHRkX2lvdmVjIGlvdltCTEtJRl9NQVhfQlVGRkVS
X1NFR01FTlRTX1BFUl9SRVFVRVNUXTsKKyAgICBzdHJ1Y3QgdGRfaW92ZWMg
aW92W0JMS0lGX01BWF9TRUdNRU5UU19QRVJfUkVRVUVTVF07CiAKLSAgICBn
cmFudF9yZWZfdCBncmVmW0JMS0lGX01BWF9CVUZGRVJfU0VHTUVOVFNfUEVS
X1JFUVVFU1RdOworICAgIGdyYW50X3JlZl90IGdyZWZbQkxLSUZfTUFYX1NF
R01FTlRTX1BFUl9SRVFVRVNUXTsKICAgICBpbnQgcHJvdDsKIAogCXN0cnVj
dCBnbnRkZXZfZ3JhbnRfY29weV9zZWdtZW50Cg==

--=separator--

