Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B7606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1482557.1686396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQqqt-0004ku-Lh; Tue, 10 Nov 2026 18:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482557.1686396; Tue, 10 Nov 2026 18:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQqqt-0004iy-CS; Tue, 10 Nov 2026 18:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1482557;
 Tue, 10 Nov 2026 18:45:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqqr-0004Gj-Ka; Tue, 10 Nov 2026 18:45:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQqqr-00F44A-1K; Tue, 10 Nov 2026 19:45:49 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af36658-e002-0a2a0a5209dd-0a2a450ba9fe-12
 for <multiple-recipients>; Tue, 10 Nov 2026 19:45:48 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af3665b-b7e8-0a2a450b0019-6882d725ecf0-3
 for <multiple-recipients>; Tue, 10 Nov 2026 19:45:48 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqqi-00000006IB2-24tC; Tue, 10 Nov 2026 18:45:40 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQqqi-00000003kKJ-2oLd; Tue, 10 Nov 2026 18:45:40 +0000
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
Subject: Xen Security Advisory 531 v1 (CVE-2026-99286) - Linux
 xen-netback: guest can trigger use-after-free for network statistics reads
Message-Id: <E1xQqqi-00000003kKJ-2oLd@xenbits.xenproject.org>
Date: Tue, 10 Nov 2026 18:45:40 +0000
X-purgate-ID: tlsNG-42698a/1794336348-AAAD89EA-E9BB33C8/0/0
X-purgate-type: clean
X-purgate-size: 5336
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

            Xen Security Advisory CVE-2026-99286 / XSA-531

 Linux xen-netback: guest can trigger use-after-free for network statistics reads

ISSUE DESCRIPTION
=================

The network statistic data in the driver is protected by RCU.
Unfortunately when tearing down the queues after an error during
connecting to the frontend (e.g. due to illegal Xenstore data filled
in by the guest), there was missing RCU synchronization before freeing
the memory holding the statistic data.  This was meant to be fixed by
the patch of XSA-526, but that patch failed to set the indication that
the data should no longer be accessed, before waiting for RCU to have
finished accesses.  In case the data is being read via sysfs in this
phase, access to already freed memory or memory being in new use is
possible.

IMPACT
======

The most likely outcome is a driver crash, possibly escalated to a host
crash.  This then is a Denial of Service (DoS) affecting the entire host.

Information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 4.11 and newer are vulnerable. Note that the patch
for XSA-526 is still needed.

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

xsa531-linux.patch           Linux

$ sha256sum xsa531*
1da1dc0543ad3b61698e6d9afc90720bb54f314b6fbc58ab83b8ee0b86fda086  xsa531-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

The issue is directly related to the recent XSA-526 fix and easy to find.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrzZgUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZLHgH/i0+e6pRQkH5mI9w/GPnPDy/QGSVjEaLqj72Oo/9
NOi1fEwHibm7JPOO/NpZHDcGvh2Y5PT7DRlVw1+1EV2+lbLzbxHX2BWVySQx9cPk
jBKem0k1udcCsKGxe09/wPW53NPmfw3KARs9L1KEJZl5/akXTUX3ZjSIOyoRg9oE
nCmbgcfg2m+KfFGnrieQaiiMOO2iD2KZmeJFLsGaT007wVkeFx2vJBxEdTayiMvF
A6BwRTc8gBd3iLxgBMO7Wdz5h3uWlgjDYq8E52tzMFbII3OeYCiiyStYlYFMk3la
sVr8bYFcctn1xm4/XukqoS00EVcNVYqaQl1yxkDf8im9qZs=
=KIyG
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa531-linux.patch"
Content-Disposition: attachment; filename="xsa531-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogVHUgRGluaCA8bmdvYy10dS5kaW5oQHZhdGVzLnRlY2g+Cgp4ZW4tbmV0YmFjazogRml4
IFhlbkJ1cyBjb25uZWN0aW9uIGZhaWx1cmUgY2xlYW51cAoKeGVudmlmX2dldF9zdGF0cyBhbmQg
eGVudmlmX2dldF9ldGh0b29sX3N0YXRzIGNhcHR1cmUgdmlmLT5udW1fcXVldWVzCnVuZGVyIHJj
dV9yZWFkX2xvY2suIFdlIG5lZWQgdG8gdW5wdWJsaXNoIHZpZi0+bnVtX3F1ZXVlcyBiZWZvcmUK
c3luY2hyb25pemVfbmV0IHRvIGVuc3VyZSB0aGF0IHJlYWRlcnMgdGhhdCBjb21lIGFmdGVyd2Fy
ZHMgd2lsbCBub3QKcmVhZCBhIG5vbi16ZXJvIHZpZi0+bnVtX3F1ZXVlcyBhbmQgYXR0ZW1wdCB0
byBhY2Nlc3MgaW52YWxpZCBxdWV1ZXMuCgpUaGlzIGlzIHRoZSBzYW1lIGNsZWFudXAgYWxnb3Jp
dGhtIGFzIHVzZWQgaW4gYmFja2VuZF9kaXNjb25uZWN0IGFuZAphZGRlZCBpbiBjb21taXQgYjE3
MDc1ZDVjMTk4ICgieGVuLW5ldGJhY2s6IGZpeCByYWNlIGNvbmRpdGlvbiBvbiBYZW5CdXMKZGlz
Y29ubmVjdCIpLgoKVGhpcyBpcyBYU0EtNTMxCgpGaXhlczogNWZiNzU2ZjFiYmVjICgieGVuLW5l
dGJhY2s6IEZpeCBVQUYgd2hlbiByZWFkaW5nIHN0YXRpc3RpY3MgZGF0YSIpClNpZ25lZC1vZmYt
Ynk6IFR1IERpbmggPG5nb2MtdHUuZGluaEB2YXRlcy50ZWNoPgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hl
bmJ1cy5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMu
YyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCmluZGV4IGE4MjZmYTI0MjU4Yi4u
NzRjMjc0NTA4NmJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMu
YworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYwpAQCAtNzMxLDYgKzczMSw3
IEBAIHN0YXRpYyB2b2lkIGNvbm5lY3Qoc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUpCiAJdW5zaWdu
ZWQgaW50IHF1ZXVlX2luZGV4OwogCXVuc2lnbmVkIGludCByZXF1ZXN0ZWRfbnVtX3F1ZXVlczsK
IAlzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZTsKKwl1bnNpZ25lZCBpbnQgbnVtX3F1ZXVlczsK
IAogCS8qIENoZWNrIHdoZXRoZXIgdGhlIGZyb250ZW5kIHJlcXVlc3RlZCBtdWx0aXBsZSBxdWV1
ZXMKIAkgKiBhbmQgcmVhZCB0aGUgbnVtYmVyIHJlcXVlc3RlZC4KQEAgLTgzNywxNCArODM4LDE1
IEBAIHN0YXRpYyB2b2lkIGNvbm5lY3Qoc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUpCiAJcmV0dXJu
OwogCiBlcnI6Ci0JaWYgKGJlLT52aWYtPm51bV9xdWV1ZXMgPiAwKQorCW51bV9xdWV1ZXMgPSBi
ZS0+dmlmLT5udW1fcXVldWVzOworCWlmIChudW1fcXVldWVzID4gMCkKIAkJeGVudmlmX2Rpc2Nv
bm5lY3RfZGF0YShiZS0+dmlmKTsgLyogQ2xlYW4gdXAgZXhpc3RpbmcgcXVldWVzICovCisJYmUt
PnZpZi0+bnVtX3F1ZXVlcyA9IDA7CiAJc3luY2hyb25pemVfbmV0KCk7Ci0JZm9yIChxdWV1ZV9p
bmRleCA9IDA7IHF1ZXVlX2luZGV4IDwgYmUtPnZpZi0+bnVtX3F1ZXVlczsgKytxdWV1ZV9pbmRl
eCkKKwlmb3IgKHF1ZXVlX2luZGV4ID0gMDsgcXVldWVfaW5kZXggPCBudW1fcXVldWVzOyArK3F1
ZXVlX2luZGV4KQogCQl4ZW52aWZfZGVpbml0X3F1ZXVlKCZiZS0+dmlmLT5xdWV1ZXNbcXVldWVf
aW5kZXhdKTsKIAl2ZnJlZShiZS0+dmlmLT5xdWV1ZXMpOwogCWJlLT52aWYtPnF1ZXVlcyA9IE5V
TEw7Ci0JYmUtPnZpZi0+bnVtX3F1ZXVlcyA9IDA7CiAJeGVudmlmX2Rpc2Nvbm5lY3RfY3RybChi
ZS0+dmlmKTsKIAlyZXR1cm47CiB9Ci0tIAoyLjU2LjAK

--=separator--

