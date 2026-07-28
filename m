Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A34C54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:07:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373165.1620265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogb0-0005bG-FH; Tue, 28 Jul 2026 12:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373165.1620265; Tue, 28 Jul 2026 12:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogb0-0005Zb-72; Tue, 28 Jul 2026 12:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1373165;
 Tue, 28 Jul 2026 12:07:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogay-0004wc-1W; Tue, 28 Jul 2026 12:07:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogax-006yAC-DV; Tue, 28 Jul 2026 14:07:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b7a-bab6-0a2a0a5309dd-0a2a4507b18c-48
 for <multiple-recipients>; Tue, 28 Jul 2026 14:07:39 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b11-b4ea-0a2a45070019-6882d7259636-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:39 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYw-00DPGa-1s;
 Tue, 28 Jul 2026 12:05:34 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYw-003E18-0s;
 Tue, 28 Jul 2026 12:05:34 +0000
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
Subject: Xen Security Advisory 508 v2 - pygrub is only supported in
 de-privileged mode
Message-Id: <E1wogYw-003E18-0s@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:34 +0000
X-purgate-ID: tlsNG-ef75cf/1785240339-35CC7AE4-356D51DD/0/0
X-purgate-type: clean
X-purgate-size: 5079

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-508
                              version 2

            pygrub is only supported in de-privileged mode

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

XSA-443 and XSA-497 addressed specific issues in specific file system
drivers (libfsimage) used by pygrub.  Further issues were reported, and
yet more are to be expected. XSA-443 introduced a means to run pygrub
de-privileged.  Only this mode of operation is security supported from
now on.

IMPACT
======

A guest using pygrub can escalate its privilege to that of the domain
construction tools (i.e., normally, to control of the host).

VULNERABLE SYSTEMS
==================

All Xen versions from at least 3.2 onwards are affected.  Older versions
have not been inspected.

MITIGATION
==========

XSA-443 added a mechanism to run pygrub de-privileged.  Using this mode
will mitigate the vulnerability.

Ensuring that guests do not use the pygrub bootloader will avoid this
vulnerability.

For cases where the PV guest is known to be 64bit, and uses grub2 as a
bootloader, pvgrub is a suitable alternative to pygrub.

Running only HVM or PVH guests will avoid the vulnerability.

RESOLUTION
==========

Applying the attached patch documents this issue.  Patches for XSA-443
added additional functionality to pygrub and libxl in order to run pygrub
in a restricted environment using a specific UID.  Check xl.cfg man page
for information on the bootloader_restrict option.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa508.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa508*
f1e4b6490228b7fac61fd968229f98a3dfb782d56c6729d3fe01bc34c77fbd5c  xsa508.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomsAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZLhoH/38QGcVs3Xc3KuskdvBx57IV/vW9XjNlVYSngmdm
lKzXTZhjrecrPZvwBbhuqOBXkaFQSL17+lLVK3xRAzv2dd5hn2PqXkMj06JSwcrh
haXN/JWUDwQtmJuLfGNkQ9P1W27oMXZ3pBGhv1SsEfD0mNiyC7ZZKizU291usZbF
6JMUGNUmQ1Dyom2CiylmJGmrNrHzKdfNqURc+DoSOctpS9vbT0U0xLtKYvbVr3cj
7DuITo1/gS/3pxiUw/7E5uR7zPusBGISP1ir5rBqTkgoMf2tJkt7tfygqJtrqnkU
BaUt0ZCo7NBKg71o0AESZIdO3Ddg2QD6xrymtI0BVqa0n1E=
=9mkq
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa508.patch"
Content-Disposition: attachment; filename="xsa508.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBweWdydWI6IHNlY3VyaXR5LXN1cHBvcnRlZCBvbmx5IHdoZW4gcnVuIGRl
LXByaXZpbGVnZWQKClhTQS00NDMgYW5kIFhTQS00OTcgYWRkcmVzc2VkIHNw
ZWNpZmljIGlzc3VlcyBpbiBzcGVjaWZpYyBmaWxlIHN5c3RlbQpkcml2ZXJz
IChsaWJmc2ltYWdlKSB1c2VkIGJ5IHB5Z3J1Yi4gRnVydGhlciBpc3N1ZXMg
d2VyZSByZXBvcnRlZCwgYW5kIHlldAptb3JlIGFyZSB0byBiZSBleHBlY3Rl
ZC4gWFNBLTQ0MyBpbnRyb2R1Y2VkIGEgbWVhbnMgdG8gcnVuIHB5Z3J1YiBk
ZS0KcHJpdmlsZWdlZC4gT25seSB0aGlzIG1vZGUgb2Ygb3BlcmF0aW9uIGlz
IHNlY3VyaXR5IHN1cHBvcnRlZCBmcm9tIG5vdyBvbi4KClRoaXMgaXMgWFNB
LTUwOC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCi0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApA
QCAtMjg4LDYgKzI4OCwxMiBAQCBvciBpdHNlbGYgd2lsbCBub3QgYmUgcmVn
YXJkZWQgYSBzZWN1cml0CiAgICAgU3RhdHVzLCB1bnRydXN0ZWQgZHJpdmVy
IGRvbWFpbnM6IFN1cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBvcnRlZAog
ICAgIFN0YXR1cywgTGl2ZXVwZGF0ZTogTm90IGZ1bmN0aW9uYWwKIAorIyMg
R3Vlc3QgYm9vdCBsb2FkZXJzCisKKyMjIyBQeWdydWIKKworICAgIFN0YXR1
czogU3VwcG9ydGVkLCBzZWN1cml0eSBzdXBwb3J0ZWQgb25seSB3aGVuIHJ1
biBkZS1wcml2aWxlZ2VkCisKICMjIFRvb2xzdGFjay8zcmQgcGFydHkKIAog
IyMjIGxpYnZpcnQgZHJpdmVyIGZvciB4bAo=

--=separator--

