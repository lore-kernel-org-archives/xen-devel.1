Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A91C79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:01:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411329.1642046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVQ-0005B3-7C; Tue, 08 Sep 2026 12:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411329.1642046; Tue, 08 Sep 2026 12:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uVQ-0005AK-0o; Tue, 08 Sep 2026 12:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1411329;
 Tue, 08 Sep 2026 12:00:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1x3uVN-0004KE-J8; Tue, 08 Sep 2026 12:00:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uVM-00BhQN-Vy; Tue, 08 Sep 2026 14:00:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8ea-8faa-0a2a0a5109dd-0a2a45058a8e-48
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:48 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a9ff8ef-4cb1-0a2a45050019-6882d725b970-3
 for <multiple-recipients>; Tue, 08 Sep 2026 14:00:48 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVF-004n4b-2Z;
 Tue, 08 Sep 2026 12:00:42 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1x3uVG-00GjtI-0E;
 Tue, 08 Sep 2026 12:00:42 +0000
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
Subject: Xen Security Advisory 510 v3 (CVE-2026-79602) - x86: improper
 handling of HVM emulation return codes
Message-Id: <E1x3uVG-00GjtI-0E@xenbits.xenproject.org>
Date: Tue, 08 Sep 2026 12:00:42 +0000
X-purgate-ID: tlsNG-c201ff/1788868848-F4AA72A1-504A4F66/0/0
X-purgate-type: clean
X-purgate-size: 5243

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-79602 / XSA-510
                               version 3

           x86: improper handling of HVM emulation return codes

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

A guest with a PCI device assigned that has at least a BAR on the IO port
space can trigger a BUG() in Xen.

IMPACT
======

Passing through a PCI device with at least one BAR in IO address space to
unprivileged HVM guests can result in a Denial of Service (DoS) affecting
the entire host.

VULNERABLE SYSTEMS
==================

Xen versions 4.6 and later are vulnerable.  This is known to be the case
with the fix for XSA-491, but it's possible the issue can also be
triggered from other, non-analyzed paths.

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

Only HVM guests with a PCI device with IO BARs assigned can leverage the
vulnerability.

MITIGATION
==========

There is no mitigation available.

CREDITS
=======

This issue was discovered by Jiqian Chen of AMD and diagnosed as a
security issue by Roger Pau Monné of AMD.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa510.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa510*
915cca4f0e6af998683a3551e5913d2489b23a697d5eab11358d4d8ffe0a0e55  xsa510.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmqf98UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ3GEIALHxkeOzpl3/ctf8o9R89LFTfayDXMY6xGbUTsRk
oiLIoKkYkZJPtiG6cY8YGRvzm/UYr+KpeMBsNtm0EcbZlPClGjkEc7JSSpMvcVps
XTzRkIUhyOTfpKklhDQJynIIpMu8NkJBLvyVYDcY8fpeZ7yDykMkQ4RyvXT5A56r
Vn18FJ401QqBO0+NTD0aCcasiLFpfrsh3AhPfKLIi7c3q0tIayyNBS8NBSNss+TF
OJew3jWX7bWnAUlPl4b8EMm4gwK/7o6YJYW+NMCTNMJ/UdfvOJkkq9T8l/41FIXq
ArtZrFpKWxsitNoXG7pJIyH/C5wBH2DFABzfqgNjkpzfqKw=
=sVA/
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa510.patch"
Content-Disposition: attachment; filename="xsa510.patch"
Content-Transfer-Encoding: base64

RnJvbSA3OTY1MzczMTE3OTdkNjAwYzBjNzE2ZDBjMDE1NTMxZmM0MWFiYjky
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyQHhlbnByb2plY3Qub3JnPgpEYXRlOiBGcmksIDcgQXVnIDIw
MjYgMTE6MDM6NDggKzAyMDAKU3ViamVjdDogW1BBVENIXSB4ODYvZW11bDog
Y29wZSB3aXRoIGludGVybmFsIGhhbmRsZXJzIHJldHVybmluZyBYODZFTVVM
X1JFVFJZCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0Cgpodm1faW9faW50ZXJjZXB0KCkgY2FuIHJldHVybiBYODZFTVVM
X1JFVFJZLCBhbmQgYXMgc3VjaCBpdCBuZWVkcyB0byBiZQpoYW5kbGVkIGlu
IHRoZSBzd2l0Y2ggaW4gaHZtZW11bF9kb19pbygpIHRvIGF2b2lkIHRyaWdn
ZXJpbmcgdGhlIEJVRygpIGZyb20KdGhlIGRlZmF1bHQgY2FzZS4KClJlc2V0
IHRoZSB2Q1BVIHN0YXRlIHRvIG5vIGluLWZsaWdodCBJT1JFUSBhbmQgcmV0
dXJuIFg4NkVNVUxfUkVUUlkgc28gdGhhdAp0aGUgYWNjZXNzIGlzIHJldHJp
ZWQuCgpUaGlzIGlzIFhTQS01MTAgLyBDVkUtMjAyNi03OTYwMi4KClJlcG9y
dGVkLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXJAeGVucHJvamVj
dC5vcmc+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jIGIveGVuL2FyY2gveDg2L2h2
bS9lbXVsYXRlLmMKaW5kZXggMmVmYjFkNGYwODIzLi5jMDllYTAwMmVjNjIg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC0zMDgsNiArMzA4LDcg
QEAgc3RhdGljIGludCBodm1lbXVsX2RvX2lvKAogICAgIHN3aXRjaCAoIHJj
ICkKICAgICB7CiAgICAgY2FzZSBYODZFTVVMX09LQVk6CisgICAgY2FzZSBY
ODZFTVVMX1JFVFJZOgogICAgICAgICB2aW8tPnJlcS5zdGF0ZSA9IFNUQVRF
X0lPUkVRX05PTkU7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgWDg2RU1V
TF9VTkhBTkRMRUFCTEU6Ci0tIAoyLjUzLjAKCg==

--=separator--

