Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58251C54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:05:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372462.1619819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYP-000734-2f; Tue, 28 Jul 2026 12:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372462.1619819; Tue, 28 Jul 2026 12:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYO-00070h-QS; Tue, 28 Jul 2026 12:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1372462;
 Tue, 28 Jul 2026 12:04:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYN-0006RS-87; Tue, 28 Jul 2026 12:04:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYM-00BEEG-Kg; Tue, 28 Jul 2026 14:04:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689adb-2eae-0a2a0a5409dd-0a2a450ce1f8-48
 for <multiple-recipients>; Tue, 28 Jul 2026 14:04:58 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689ae9-f479-0a2a450c0019-6882d725b7c2-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:04:58 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYG-00DP88-1t;
 Tue, 28 Jul 2026 12:04:52 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYG-003Dcb-0p;
 Tue, 28 Jul 2026 12:04:52 +0000
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
Subject: Xen Security Advisory 496 v2 (CVE-2026-42492) - vIRQ event
 channel binding may break Xenstore
Message-Id: <E1wogYG-003Dcb-0p@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:04:52 +0000
X-purgate-ID: tlsNG-d25034/1785240298-50321A5B-A6843B0E/0/0
X-purgate-type: clean
X-purgate-size: 5444

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-42492 / XSA-496
                               version 2

             vIRQ event channel binding may break Xenstore

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Xenstore, to have an up-to-date picture of the entire system, wants to
know of domains appearing and disappearing.  To make this more robust, a
new XEN_DOMCTL_get_domain_state was introduced.  The management of the
bitmap underlying that operation is tied into the binding of the
VIRQ_DOM_EXC virtual IRQ.  Unfortunately an error path there would tear
down the bitmap even in cases when it wasn't set up.  Unprivileged domains
can trigger that error path.

IMPACT
======

An unprivileged domain can affect the operation of Xenstore, potentially
leading to a Denial of Service (DoS) affecting the entire host.  A
hypervisor crash with similar host wide effect also is possible, albeit
unlikely.

VULNERABLE SYSTEMS
==================

Xen 4.21 and onwards are vulnerable.  Xen 4.20 and older are not
vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Grygorii Strashko of EPAM.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa496.patch           xen-unstable - Xen 4.21.x

$ sha256sum xsa496*
80a0a807dd9d7ae793b462d78da2bd9d4f84eb5062f3e60622d12edde9c2a27c  xsa496.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomqwMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZc8IIALEzvp6RymbSYDSTBqNl4k+mRBOfMTdwOGKA9lNm
zYl9rFlGcTTR2HogU9Vplm0gQmcrksFndwXMzjkOqLlRnbDs6JsSIpuQaWi6jm7f
Fj0QLAMXLxLLMAPvC8j9kLJjJrlv7X1VeYolsHBSq3lCoqb5YgZaqMIDuOXgO9+7
//cSTRbaEnm4UBrV/WxUX1pd6RHOBbioJjyLwy4QZyfoTfXtVrw6bv5IHsq8GyD6
QYRFnh9fZ+33p7LDoU5jUlDO+TnJZeUlbWGqMTsxdGx8l93662nNGDIYrxJr+/8g
6CmXyObBkiI3qXRT7sSt1/FzdnoDIQTPtIyv4xuIi4GMT+0=
=V0J6
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa496.patch"
Content-Disposition: attachment; filename="xsa496.patch"
Content-Transfer-Encoding: base64

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVw
YW0uY29tPgpTdWJqZWN0OiBldnRjaG46IGV2dGNobl9iaW5kX3ZpcnEoKSBl
cnJvciBwYXRoIHVuY29uZGl0aW9uYWxseSBjYWxscyBkb21haW5fZGVpbml0
X3N0YXRlcygpCgpUaGVyZSBpcyBhIGNvcm5lciBjYXNlIGluIHRoZSBlcnJv
ciBwYXRoIG9mIGV2dGNobl9iaW5kX3ZpcnEoKSAoaGFuZGxpbmcKRVZUQ0hO
T1BfYmluZF92aXJxIGh5cGVyY2FsbCkgd2hpY2ggYWxsb3dzIHVucHJpdmls
ZWdlZCBkb21haW5zIHRvCmludGVyZmVyZSB3aXRoIHByaXZpbGVnZWQgb25l
czogSWYgYW4gdW5wcml2aWxlZ2VkIGRvbWFpbiBhbGxvY2F0ZXMgYWxsCmF2
YWlsYWJsZSBwb3J0cyB0byByZWFjaCAibm8gbW9yZSBwb3J0cyBhdmFpbGFi
bGUiIGFuZCB0aGVuIGlzc3VlcyBhbgpFVlRDSE5PUF9iaW5kX3ZpcnEgaHlw
ZXJjYWxsIHRvIGJpbmQgYW55IGFsbG93ZWQgVklSUSAoZS5nLiBWSVJRX0RF
QlVHKSwKZG9tYWluX2RlaW5pdF9zdGF0ZXMoKSB3aWxsIGJlIGNhbGxlZCBk
ZXNwaXRlIG5vdCBoYXZpbmcgY2FsbGVkCmRvbWFpbl9pbml0X3N0YXRlcygp
LgoKVG8gZml4IHRoZSBpc3N1ZSBtb3ZlIGRvbWFpbl9kZWluaXRfc3RhdGVz
KGQpIHVuZGVyIHRoZSBzYW1lIGNvbmRpdGlvbiBhcwp1c2VkIGZvciB0aGUg
ZG9tYWluX2luaXRfc3RhdGVzKCkgY2FsbC4KClRoaXMgaXMgQ1ZFLTIwMjYt
NDI0OTIgLyBYU0EtNDk2LgoKRml4ZXM6IGY5NDM2MGE3ZmU5YiAoInhlbjog
YWRkIGJpdG1hcCB0byBpbmRpY2F0ZSBwZXItZG9tYWluIHN0YXRlIGNoYW5n
ZXMiKQpTaWduZWQtb2ZmLWJ5OiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29y
aWlfc3RyYXNoa29AZXBhbS5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vZXZl
bnRfY2hhbm5lbC5jCisrKyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5j
CkBAIC01MjMsNyArNTIzLDggQEAgaW50IGV2dGNobl9iaW5kX3ZpcnEoZXZ0
Y2huX2JpbmRfdmlycV90CiAgICAgaWYgKCByYyA8IDAgKQogICAgIHsKICAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJFVlRDSE5PUCBmYWls
dXJlOiBlcnJvciAlZFxuIiwgcmMpOwotICAgICAgICBkb21haW5fZGVpbml0
X3N0YXRlcyhkKTsKKyAgICAgICAgaWYgKCB2aXJxID09IFZJUlFfRE9NX0VY
QyApCisgICAgICAgICAgICBkb21haW5fZGVpbml0X3N0YXRlcyhkKTsKICAg
ICAgICAgZ290byBvdXQ7CiAgICAgfQogCg==

--=separator--

