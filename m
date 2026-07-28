Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3642C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372589.1620127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZY-0002WI-8f; Tue, 28 Jul 2026 12:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372589.1620127; Tue, 28 Jul 2026 12:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZU-0002Pj-U6; Tue, 28 Jul 2026 12:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1372589;
 Tue, 28 Jul 2026 12:05:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYr-00049f-Tx; Tue, 28 Jul 2026 12:05:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYr-004Ofp-75; Tue, 28 Jul 2026 14:05:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689aff-bab6-0a2a0a5309dd-0a2a450491da-38
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:29 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b07-b57f-0a2a45040019-6882d725aca0-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:29 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYm-00DPFD-06;
 Tue, 28 Jul 2026 12:05:23 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYl-003Dvz-2L;
 Tue, 28 Jul 2026 12:05:23 +0000
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
Subject: Xen Security Advisory 505 v2 (CVE-2026-62432) - evtchn: Race
 between FIFO expand and reset
Message-Id: <E1wogYl-003Dvz-2L@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:23 +0000
X-purgate-ID: tlsNG-ebf023/1785240329-C36C2B50-0B82A60E/0/0
X-purgate-type: clean
X-purgate-size: 5223

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62432 / XSA-505
                               version 2

              evtchn: Race between FIFO expand and reset

UPDATES IN VERSION 2
====================

Typo correction in description.

Public release.

ISSUE DESCRIPTION
=================

The EVTCHNOP_expand_array hypercall checks for whether FIFO event
channels are enabled, but without holding the correct lock.  It can race
with EVTCHNOP_reset, resulting in dereferencing a NULL pointer.

IMPACT
======

A malicious HVM guest (x86 HVM or PVH, and ARM) can crash Xen leading to
a denial of service.

A malicious x86 PV guest can most likely crash Xen leading to a denial
of service, but memory corruption or privilege escalation cannot be
ruled out.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.5 onwards are vulnerable.  Xen versions 4.4 and
earlier are not vulnerable.

MITIGATION
==========

There are no mitigations.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa505.patch           xen-unstable - Xen 4.17

$ sha256sum xsa505*
80619fdbb547dea191439ef1c9539fa0991e8f6c449b3970a086f3287fb9ce6e  xsa505.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomrsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ5H8IAMKtDfTsBJaoOosFHEU0Gyv96fP98D89URo21RrD
V+Lpd9CTatYuTnz53gztlUa7s2/ARYl488bNURwPTdTjSEdJBbFQKrEyAZsryTyh
hiIJF7AhQf8LsY3qk2xuJ+/tKc720WK/zsUGVRz6Jhf9W90g5wBhIM1RAhfy7H2t
Zn74wXDi4dsMLQg6VivzRq+y+XJfZKR6qoKztiDHk0DBobmJzQFF2cfkiiWDRW9l
NuvLxKjsPyS4K+Jcm9k65RzmWfDprxmL/63VDAt0W8dSAe+u1zyDh/aT+OFK5R1g
c6CwdjquY4hhSYhwix4TW18LRlY0NA/pqn3FmhLQl3XZmfU=
=z4Qy
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa505.patch"
Content-Disposition: attachment; filename="xsa505.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
U3ViamVjdDogeGVuL2V2dGNobjogZml4IHJhY2UgYmV0d2VlbiBGSUZPIGV4
cGFuZCBhbmQgcmVzZXQgb3BlcmF0aW9ucwoKZXZ0Y2huX2ZpZm9fZXhwYW5k
X2FycmF5KCkgd2lsbCBjaGVjayBmb3IgdGhlIGRvbWFpbiBldnRjaG5fZmlm
byBiZWluZwpwb3B1bGF0ZWQgd2l0aG91dCBob2xkaW5nIHRoZSBldmVudF9s
b2NrLCB3aGljaCBjYW4gbGVhZCB0byBhIHJhY2Ugd2l0aCBhCmNvbmN1cnJl
bnQgZXZ0Y2huX3Jlc2V0KCkuCgpFbnN1cmUgdGhlIGNoZWNraW5nIGZvciBl
dnRjaG5fZmlmbyBwcmVzZW5jZSBpcyBkb25lIHdoaWxlIGhvbGRpbmcgdGhl
CmV2ZW50X2xvY2suCgpUaGlzIGlzIFhTQS01MDUgLyBDVkUtMjAyNi02MjQz
Mi4KCkZpeGVzOiA0MDBiM2JkNjQyNmYgKCJldnRjaG46IG1ha2UgRVZUQ0hO
T1BfcmVzZXQgc3VpdGFibGUgZm9yIGtleGVjIikKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmll
d2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZXZlbnRfZmlmby5jIGIv
eGVuL2NvbW1vbi9ldmVudF9maWZvLmMKaW5kZXggMzdjYmE5YmM0NTY0Li5j
YWUwOGE1OTRlOWYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZXZlbnRfZmlm
by5jCisrKyBiL3hlbi9jb21tb24vZXZlbnRfZmlmby5jCkBAIC02OTIsMTMg
KzY5MiwxMSBAQCBzdGF0aWMgaW50IGFkZF9wYWdlX3RvX2V2ZW50X2FycmF5
KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuKQogaW50IGV2
dGNobl9maWZvX2V4cGFuZF9hcnJheShjb25zdCBzdHJ1Y3QgZXZ0Y2huX2V4
cGFuZF9hcnJheSAqZXhwYW5kX2FycmF5KQogewogICAgIHN0cnVjdCBkb21h
aW4gKmQgPSBjdXJyZW50LT5kb21haW47Ci0gICAgaW50IHJjOwotCi0gICAg
aWYgKCAhZC0+ZXZ0Y2huX2ZpZm8gKQotICAgICAgICByZXR1cm4gLUVPUE5P
VFNVUFA7CisgICAgaW50IHJjID0gLUVPUE5PVFNVUFA7CiAKICAgICB3cml0
ZV9sb2NrKCZkLT5ldmVudF9sb2NrKTsKLSAgICByYyA9IGFkZF9wYWdlX3Rv
X2V2ZW50X2FycmF5KGQsIGV4cGFuZF9hcnJheS0+YXJyYXlfZ2ZuKTsKKyAg
ICBpZiAoIGQtPmV2dGNobl9maWZvICkKKyAgICAgICAgcmMgPSBhZGRfcGFn
ZV90b19ldmVudF9hcnJheShkLCBleHBhbmRfYXJyYXktPmFycmF5X2dmbik7
CiAgICAgd3JpdGVfdW5sb2NrKCZkLT5ldmVudF9sb2NrKTsKIAogICAgIHJl
dHVybiByYzsK

--=separator--

