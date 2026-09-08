Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F408C79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:01:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411325.1642003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVN-0004HH-AN; Tue, 08 Sep 2026 12:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411325.1642003; Tue, 08 Sep 2026 12:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVN-0004GV-56; Tue, 08 Sep 2026 12:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1411325;
 Tue, 08 Sep 2026 12:00:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1x3uVL-0004Co-IW; Tue, 08 Sep 2026 12:00:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uVK-00BhQN-FC; Tue, 08 Sep 2026 14:00:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8ea-8faa-0a2a0a5109dd-0a2a45058a8e-24
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:46 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8ed-4cb1-0a2a45050019-6882d725a1bc-3
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:46 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVB-004n4N-1v;
 Tue, 08 Sep 2026 12:00:37 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVB-00GjSA-2j;
 Tue, 08 Sep 2026 12:00:37 +0000
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
Subject: Xen Security Advisory 509 v3 (CVE-2026-62437) - x86: DMs may
 cause mem leak by IRQ binding
Message-Id: <E1x3uVB-00GjSA-2j@xenbits.xenproject.org>
Date: Tue, 08 Sep 2026 12:00:37 +0000
X-purgate-ID: tlsNG-c201ff/1788868846-71CA82A1-59F74CBE/0/0
X-purgate-type: clean
X-purgate-size: 5993

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62437 / XSA-509
                               version 3

              x86: DMs may cause mem leak by IRQ binding

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When guests are terminated, various pieces of cleanup need carrying out.
The cleaning up of PCI devices which were assigned to guests, and the
associated removal of tracking structures for IRQs used by the devices
occurs relatively early in the process.  Unfortunately after that point
the guest about to be terminated could cause its device model (DM) to
re-establish such tracking structures, by having it bind one or more IRQs
anew.  While some of those tracking structures would still be cleaned up
later on, at least one would not be.

IMPACT
======

A HVM guest with one or more PCI devices assigned can cause a memory leak
in the hypervisor, possibly leading to Denial of Service (DoS) of the
entire host.

VULNERABLE SYSTEMS
==================

All Xen versions from at least 3.2 onwards are affected.  Older versions
have not been inspected.

Only HVM guests with assigned PCI devices can leverage the vulnerability.

MITIGATION
==========

Running only PV or PVH guests will avoid the vulnerability.

Running only HVM guests without passing through PCI devices to them will
also avoid the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa509.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa509*
1e027737afa753f3498102ceac4abe62b11a49cfa019f25bb19728a7931f9096  xsa509.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patch described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigation is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because removing/replacing of pass-through devices or their
replacement by emulated devices is a guest visible configuration
change, which may lead to re-discovery of the issue.

Deployment of this mitigation is permitted only AFTER the embargo ends.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmqf970MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ6hYIAIDrF44cxjA9slR5fXYXpQvlGHE8wvTr5F5vNdXO
JlB8yMQjdUPMfSLX0oMPapUwLE/UzFFA/MTXORrK6nj3TbRRHLqF9e9upL6e3QHH
RrV4m2R5OSVjD6PG+T+e24ES5I4SLUTWv9i4vQZPzY54rjMtZ4d53DZk2eQ5v9kj
ozYgQzwk5vMvRhnPv6MVdcBr2EfQ274+XxMKioMBZaFuv+zeomaQTAiok8gXhotX
6twiuhuhvMOtF2FA8V1WkKwUqw5NKm/plv54d8RRB/XNdxPe/8bxY0NlLGgRpMf3
cjSqsuhpEgpY3Vh62v3S0fAtExnWppdb/glJE+g4MZGzC7s=
=J7JJ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa509.patch"
Content-Disposition: attachment; filename="xsa509.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvcGFzcy10aHJvdWdoOiBkaXNhbGxvdyBwdF9pcnFfY3JlYXRlX2Jp
bmQoKSBvbiBkeWluZyBkb21haW5zCgpETXMgbWF5IGludm9rZSBYRU5fRE9N
Q1RMX2JpbmRfcHRfaXJxIGZvciBkb21haW5zIGFscmVhZHkgdW5kZXIKZGVz
dHJ1Y3Rpb24uIFdoZW4gWEVOX0RPTUNUTF9iaW5kX3B0X2lycSBpcyBpbnZv
a2VkIGFmdGVyCnBjaV9yZWxlYXNlX2RldmljZXMoKSAoaW52b2tlZCBmcm9t
IHVuZGVybmVhdGggZG9tYWluX2tpbGwoKSkgaGFkIGFscmVhZHkKY29tcGxl
dGVkLCBpdCB3b3VsZCBhbGxvY2F0ZSBodm1fZG9tYWluX2lycShkKS0+ZHBj
aSBhbmV3LCB3aXRob3V0IHRoYXQKZXZlciBiZWluZyBmcmVlZCBkdXJpbmcg
c3Vic2VxdWVudCBkb21haW4gY2xlYW51cC4KCkxldmVyYWdlIGV2dGNobl9k
ZXN0cm95KCkncyBraW5kLW9mLXNwaW4tYmFycmllciwgYWxsb3dpbmcgdG8g
c2ltcGx5IGNoZWNrCi0+aXNfZHlpbmcgd2l0aCB0aGUgZG9tYWluJ3MgZXZl
bnQgbG9jayBoZWxkLgoKVGhpcyBpcyBYU0EtNTA5IC8gQ1ZFLTIwMjYtNjI0
MzcuCgpGaXhlczogN2EyNmI1NDFhMjAyICgidnRkOiBEeW5hbWljYWxseSBh
bGxvY2F0ZSBJUlEtdHJhY2tpbmcgc3RydWN0dXJlcywgb25seSBmb3IgdGhv
c2UiKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3g4Ni9odm0uYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
aHZtLmMKQEAgLTIzMSw2ICsyMzEsMTIgQEAgaW50IHB0X2lycV9jcmVhdGVf
YmluZCgKICByZXN0YXJ0OgogICAgIHdyaXRlX2xvY2soJmQtPmV2ZW50X2xv
Y2spOwogCisgICAgaWYgKCBkLT5pc19keWluZyApCisgICAgeworICAgICAg
ICB3cml0ZV91bmxvY2soJmQtPmV2ZW50X2xvY2spOworICAgICAgICByZXR1
cm4gLUVTUkNIOworICAgIH0KKwogICAgIGh2bV9pcnFfZHBjaSA9IGRvbWFp
bl9nZXRfaXJxX2RwY2koZCk7CiAgICAgaWYgKCAhaHZtX2lycV9kcGNpICYm
ICFpc19oYXJkd2FyZV9kb21haW4oZCkgKQogICAgIHsK

--=separator--

