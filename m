Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75955606A32D
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1482554.1686370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQqqs-0004Kb-Bg; Tue, 10 Nov 2026 18:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482554.1686370; Tue, 10 Nov 2026 18:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQqqs-0004KH-6r; Tue, 10 Nov 2026 18:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1482554;
 Tue, 10 Nov 2026 18:45:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqqq-0004F5-FZ; Tue, 10 Nov 2026 18:45:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQqqp-00Fcvp-Sj; Tue, 10 Nov 2026 19:45:47 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af3662e-8faa-0a2a0a5109dd-0a2a4509cf50-48
 for <multiple-recipients>; Tue, 10 Nov 2026 19:45:47 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af3665a-be1a-0a2a45090019-6882d725a67c-3
 for <multiple-recipients>; Tue, 10 Nov 2026 19:45:47 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqql-00000006IBX-3iRw; Tue, 10 Nov 2026 18:45:44 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqqm-00000003kLo-0iQo; Tue, 10 Nov 2026 18:45:44 +0000
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
Subject: Xen Security Advisory 532 v1 (CVE-2026-99287) - Linux
 xen-netback: guest can trigger double unmap of memory
Message-Id: <E1xQqqm-00000003kLo-0iQo@xenbits.xenproject.org>
Date: Tue, 10 Nov 2026 18:45:44 +0000
X-purgate-ID: tlsNG-bad1c0/1794336347-BFCD7034-C17A7A21/0/0
X-purgate-type: clean
X-purgate-size: 4680
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

            Xen Security Advisory CVE-2026-99287 / XSA-532

      Linux xen-netback: guest can trigger double unmap of memory

ISSUE DESCRIPTION
=================

When xen-netback is setting up the connection to a frontend, it is
mapping the ring pages and then validating the ring pages' contents.
In case the ring index values are illegal, xen-netback tries to unmap
all allocated resources of the connection.  Due to a missing test for
already unmapped memory, the unmap can happen twice, resulting in a
potential unmap of another guest's memory page.

IMPACT
======

The most likely outcome is a driver crash, possibly escalated to a host
crash.  This then is a Denial of Service (DoS) affecting the entire host.

Information leaks or privilege escalations cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 5.5 and newer are vulnerable.

MITIGATION
==========

Using a userspace PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by Tu Dinh of Vates.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa532-linux.patch           Linux

$ sha256sum xsa532*
4d835bd07ca645ee9b9dadfffd1224bdfaa28d609c6af3666b38df54486bc9f6  xsa532-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

The issue is affecting the same driver as XSA-531, which has no
embargo, too.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrzZgcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZwDEH/AyWeZ/6Ej8kaE1nqKU740uF2dPKn9zrcazgcNlW
gkisqJn+RQm2b3SRoYrnxWMLQOTvWpPQTbKrJmVUk4ehPUr8OJrpyTwihX5iA7zs
q995XWsDraOAGL6vw3msrPJBqERB2JFmJG2XcqxlqFpSdhAXpb7nSM2YBm3EhjQp
xJnZ6t8dBEaB+lOsP5sD3KtXUIlui7crrwkuwFQmosWkGfbAIHoyvYVLqWedA8yy
Dm+9Wtze82oPy9dvn8qLF2Q9xsehkOw3o9A6lROWJk73ExlA0xHLwhuns8Q/86y/
bRKjybJ7wZXX3Rjtzupjs6/68nzGNyN/1aAmwCFOo+eP9UQ=
=O99r
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa532-linux.patch"
Content-Disposition: attachment; filename="xsa532-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogVHUgRGluaCA8bmdvYy10dS5kaW5oQHZhdGVzLnRlY2g+CkRhdGU6IFNhdCwgNyBOb3Yg
MjAyNiAxMjozNTo1MSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi1uZXRiYWNrOiBaZXJvIG91
dCBzcmluZyBwb2ludGVycyBvbiB1bm1hcAoKSWYgeGVudmlmX21hcF9mcm9udGVuZF9kYXRhX3Jp
bmdzKCkgZmFpbHMgd2hlbiBhIHJpbmcgaXMgYWxyZWFkeSBtYXBwZWQsCml0IHVubWFwcyB0aGVt
IHZpYSB4ZW52aWZfdW5tYXBfZnJvbnRlbmRfZGF0YV9yaW5ncygpIHdoaWNoIGtlZXBzIHRoZQpy
aW5nIHBvaW50ZXJzIHVuY2hhbmdlZC4geGVudmlmX2Nvbm5lY3RfZGF0YSgpJ3MgY2xlYW51cCBw
YXRoIGNhbGxzCnhlbnZpZl9kaXNjb25uZWN0X3F1ZXVlKCkgd2hpY2ggaW4gdHVybiBjYWxscwp4
ZW52aWZfdW5tYXBfZnJvbnRlbmRfZGF0YV9yaW5ncygpIGFnYWluLCB3aGljaCB3aWxsIGF0dGVt
cHQgdG8gdW5tYXAgdGhlCnBvaW50ZXJzIGEgc2Vjb25kIHRpbWUuCgpaZXJvIG91dCB0aGUgcmlu
ZyBwb2ludGVycyBhZnRlciB0aGV5IGFyZSB1bm1hcHBlZCB0byBhdm9pZCB0aGlzIGlzc3VlLgoK
VGhpcyBpcyBYU0EtNTMyCgpGaXhlczogMmFjMDYxY2U5N2Y0ICgieGVuL25ldGJhY2s6IGNsZWFu
dXAgaW5pdCBhbmQgZGVpbml0IGNvZGUiKQpTaWduZWQtb2ZmLWJ5OiBUdSBEaW5oIDxuZ29jLXR1
LmRpbmhAdmF0ZXMudGVjaD4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgfCA5ICsrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9uZXRiYWNrLmMKaW5kZXggM2NkYjdmZDY1OWRiLi5kYzIyOTc1NmJkYzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYworKysgYi9kcml2ZXJz
L25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMKQEAgLTE1MzAsMTIgKzE1MzAsMTcgQEAgc3RhdGlj
IGlubGluZSBib29sIHR4X2RlYWxsb2Nfd29ya190b2RvKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1
ZXVlKQogCiB2b2lkIHhlbnZpZl91bm1hcF9mcm9udGVuZF9kYXRhX3JpbmdzKHN0cnVjdCB4ZW52
aWZfcXVldWUgKnF1ZXVlKQogewotCWlmIChxdWV1ZS0+dHguc3JpbmcpCisJaWYgKHF1ZXVlLT50
eC5zcmluZykgewogCQl4ZW5idXNfdW5tYXBfcmluZ192ZnJlZSh4ZW52aWZfdG9feGVuYnVzX2Rl
dmljZShxdWV1ZS0+dmlmKSwKIAkJCQkJcXVldWUtPnR4LnNyaW5nKTsKLQlpZiAocXVldWUtPnJ4
LnNyaW5nKQorCQlxdWV1ZS0+dHguc3JpbmcgPSBOVUxMOworCX0KKworCWlmIChxdWV1ZS0+cngu
c3JpbmcpIHsKIAkJeGVuYnVzX3VubWFwX3JpbmdfdmZyZWUoeGVudmlmX3RvX3hlbmJ1c19kZXZp
Y2UocXVldWUtPnZpZiksCiAJCQkJCXF1ZXVlLT5yeC5zcmluZyk7CisJCXF1ZXVlLT5yeC5zcmlu
ZyA9IE5VTEw7CisJfQogfQogCiBpbnQgeGVudmlmX21hcF9mcm9udGVuZF9kYXRhX3JpbmdzKHN0
cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAotLSAKMi41Ni4wCgo=

--=separator--

