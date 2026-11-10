Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAC606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 18:01:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1482162.1686132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQq9Z-00058Y-Ij; Tue, 10 Nov 2026 18:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482162.1686132; Tue, 10 Nov 2026 18:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQq9Z-00057y-88; Tue, 10 Nov 2026 18:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1482162;
 Tue, 10 Nov 2026 18:01:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq9Y-00051e-1r; Tue, 10 Nov 2026 18:01:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQq9X-00FX9G-Ei; Tue, 10 Nov 2026 19:01:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af35bdf-2eae-0a2a0a5409dd-0a2a4508c70c-0
 for <multiple-recipients>; Tue, 10 Nov 2026 19:01:03 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af35bde-f659-0a2a45080019-6882d725b686-3
 for <multiple-recipients>; Tue, 10 Nov 2026 19:01:03 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq9T-00000006HGr-3oBX; Tue, 10 Nov 2026 18:01:00 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq9U-00000003NIq-0nZf; Tue, 10 Nov 2026 18:01:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: MIME-tools 5.515 (Entity 5.515)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 529 v2 (CVE-2026-102705) - XAPI:
 data-dependent compare function used for Pool Secret
Message-Id: <E1xQq9U-00000003NIq-0nZf@xenbits.xenproject.org>
Date: Tue, 10 Nov 2026 18:01:00 +0000
X-purgate-ID: tlsNG-c1860d/1794333663-CFED287B-082B4E61/0/0
X-purgate-type: clean
X-purgate-size: 5408
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

           Xen Security Advisory CVE-2026-102705 / XSA-529
                              version 2

      XAPI: data-dependent compare function used for Pool Secret

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

XAPI has a bearer token used to authenticate requests made between hosts
in a pool, known as the Pool Secret.

Comparison of this token is performed with a function which has
data-dependent timing.  An attacker may be able to use this as a timing
oracle to infer the value of the Pool Secret.

IMPACT
======

An unauthenticated attacker may be able to infer the value of the Pool
Secret, and gain full access to the pool.

VULNERABLE SYSTEMS
==================

Systems running all versions of XAPI are vulnerable.

MITIGATION
==========

There are no mitigations.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

After deploying the fixed XAPI to all pool members, the Pool Secret can
be regenerated by running `xe pool-secret-rotate`.

xsa529.patch           XAPI master

$ sha256sum xsa529*
a8a595891a113ce04665d6075c2ce2bf1a38d05b2df50e1509cadeabd0f525f2  xsa529.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrzWmgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZHtwIAIfiXHTw5h+h7UjrIWCuZN53ouEUdJE6V6cWCtsX
KSNBpwm9puAg4kVrqSDRF5Uvrwjx6uxFbNMml5OVsZsdOE7KChNZMDk9hhk9HYXC
yyObt/9gtRIyD84u9CSc66Oa1noIbrx+awMeX5Z8FWVOAMtNJ/Oiz4LQPmk7fNhv
dJCtYVIRBmcCS7AZj9W8H1oQuSd7GOgCLNB4/B0FEKMOWKIWBgzHPFOD4MGWAhFf
DTNi+mu7IjmtkXLqPda59C5vG/NMZ18caqSWTAkkihUDwlsuJvONY4F6Ifw8M1fe
tEniu0Ko+RfdE2EbsZFShdnrWFHvU459oBxhkI+S3PqXODE=
=MQpF
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa529.patch"
Content-Disposition: attachment; filename="xsa529.patch"
Content-Transfer-Encoding: base64

RnJvbTogTWluZyBMdSA8bWluZy5sdUBjaXRyaXguY29tPgpTdWJqZWN0OiBDQS00MzAwNzY6IFZh
cmlhYmxlLXRpbWUgY29tcGFyaXNvbiBvZiBwb29sX3NlY3JldAoKVGhlIFtTdHJpbmcuZXF1YWxd
IHdpbGwgdGFrZSB2YXJpYWJsZSB0aW1lIGFjY29yZGluZyB0byBob3cgc2ltaWxhciB0aGUKdHdv
IHN0cmluZ3MgYXJlIGluIGNvbXBhcmlzb24uIEFuIGF0dGFja2VyIGNhbiBoYXZlIGEgYnl0ZS1h
dC1hLXRpbWUKdGltaW5nIG9yYWNsZSBvbiB0aGUgcG9vbF9zZWNyZXQsIG1ha2luZyBwcmFjdGlj
YWwgc2VjcmV0IHJlY292ZXJ5IGF0dGFja3MKc2lnbmlmaWNhbnRseSBtb3JlIGZlYXNpYmxlLgoK
W0VxYWYuZXF1YWxdIGluc3RlYWQgaGFzIGRhdGEtaW52YXJpYW50IHRpbWluZyBpZiBhbmQgb25s
eSBpZiBib3RoCnN0cmluZ3MgYmVpbmcgY29tcGFyZWQgaGF2ZSB0aGUgc2FtZSBsZW5ndGguIElu
IHN1Y2ggY2FzZSwgaXQgZG9lcyBub3QKZGVwZW5kIG9uIHRoZSBjb250ZW50cyBvZiB0aGUgc3Ry
aW5ncyBiZWluZyBjb21wYXJlZCwgc28gdGhlIHRpbWUgdGFrZW4KdG8gcmVqZWN0IGEgZ3Vlc3Mg
cmV2ZWFscyBub3RoaW5nIGFib3V0IGhvdyBtdWNoIG9mIGl0IGlzIGNvcnJlY3QuCgpXaGVuIHRo
ZSBsZW5ndGhzIGRpZmZlciwgW0VxYWYuZXF1YWxdIHJldHVybnMgZWFybHksIHdoaWNoIHJldmVh
bHMKd2hldGhlciBhIGd1ZXNzIGhhcyB0aGUgc2FtZSBsZW5ndGggYXMgdGhlIHNlY3JldC4gVGhp
cyBpcyBub3QgbmV3LiBBbmQKZW5vdWdoIGVudHJvcHkgaW4gc2VjcmV0IGhhcyBiZWVuIGVuZm9y
Y2VkLiBTbyBpdCdzIG5vdCBhIGNyaXRpY2FsIGlzc3VlLgoKVGhpcyBpcyBYU0EtNTI5IC8gQ1ZF
LTIwMjYtMTAyNzA1LgoKU2lnbmVkLW9mZi1ieTogTWluZyBMdSA8bWluZy5sdUBjaXRyaXguY29t
PgpSZXZpZXdlZC1ieTogQW5kcmlpIFN1bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMudGVj
aD4KCmRpZmYgLS1naXQgYS9vY2FtbC94YXBpLXR5cGVzL2R1bmUgYi9vY2FtbC94YXBpLXR5cGVz
L2R1bmUKaW5kZXggODEyMjY3NGFjZjhlLi41YzcyZTBiOTc1MjYgMTAwNjQ0Ci0tLSBhL29jYW1s
L3hhcGktdHlwZXMvZHVuZQorKysgYi9vY2FtbC94YXBpLXR5cGVzL2R1bmUKQEAgLTE0LDYgKzE0
LDcgQEAKICAgKGZsYWdzICg6c3RhbmRhcmQgLXcgLTMzKSkKICAgKGxpYnJhcmllcwogICAgIGFz
dHJpbmcKKyAgICBlcWFmCiAgICAgcnBjbGliLmNvcmUKICAgICBycGNsaWIuanNvbgogICAgIHJw
Y2xpYi54bWwKZGlmZiAtLWdpdCBhL29jYW1sL3hhcGktdHlwZXMvc2VjcmV0U3RyaW5nLm1sIGIv
b2NhbWwveGFwaS10eXBlcy9zZWNyZXRTdHJpbmcubWwKaW5kZXggYjU1MmU0NmVkZmQ2Li43MTI5
MzlkZGU5MzkgMTAwNjQ0Ci0tLSBhL29jYW1sL3hhcGktdHlwZXMvc2VjcmV0U3RyaW5nLm1sCisr
KyBiL29jYW1sL3hhcGktdHlwZXMvc2VjcmV0U3RyaW5nLm1sCkBAIC0yMiw3ICsyMiw3IEBAIGxl
dCB3cml0ZV90b19maWxlID0gWGFwaV9zdGRleHRfdW5peC5Vbml4ZXh0LndyaXRlX3N0cmluZ190
b19maWxlIH5wZXJtczowbzYwMAogCiBsZXQgd3JpdGVfdG9fY2hhbm5lbCBjIHMgPSBvdXRwdXRf
c3RyaW5nIGMgcwogCi1sZXQgZXF1YWwgPSBTdHJpbmcuZXF1YWwKK2xldCBlcXVhbCA9IEVxYWYu
ZXF1YWwKIAogbGV0IGxlbmd0aCA9IFN0cmluZy5sZW5ndGgKIAo=

--=separator--

