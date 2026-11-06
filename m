Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECB606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:16:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1476740.1682737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfh-0003y9-TD; Fri, 06 Nov 2026 15:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476740.1682737; Fri, 06 Nov 2026 15:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfh-0003y2-PY; Fri, 06 Nov 2026 15:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1476740;
 Fri, 06 Nov 2026 15:16:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLff-0003fk-S0; Fri, 06 Nov 2026 15:16:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLff-007Zic-1B; Fri, 06 Nov 2026 16:16:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef1d-8faa-0a2a0a5109dd-0a2a4508a628-44
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:02 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef31-f659-0a2a45080019-6882d725d98c-3
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:02 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfb-00000001GcE-1tmf; Fri, 06 Nov 2026 15:15:59 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfb-0000000A5rj-1W0D; Fri, 06 Nov 2026 15:15:59 +0000
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
Subject: Xen Security Advisory 526 v1 (CVE-2026-100080) - Linux
 xen-netback: guest can trigger use-after-free for
Message-Id: <E1xPLfb-0000000A5rj-1W0D@xenbits.xenproject.org>
Date: Fri, 06 Nov 2026 15:15:59 +0000
X-purgate-ID: tlsNG-c1860d/1793978162-D437587B-E71D9501/0/0
X-purgate-type: clean
X-purgate-size: 4476
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

           Xen Security Advisory CVE-2026-100080 / XSA-526

          Linux xen-netback: guest can trigger use-after-free for
                        network statistics reads

ISSUE DESCRIPTION
=================

The network statistic data in the driver is protected by RCU.
Unfortunately when tearing down the queues after an error during
connecting to the frontend (e.g. due to illegal Xenstore data filled
in by the guest), the statistic data is being freed without
synchronizing the RCU state.  In case the data is being read via sysfs
in this phase, access to already freed memory or memory being in new
use is possible.

IMPACT
======

The most likely outcome is a driver crash, possibly escalated to a host
crash.  This then is a Denial of Service (DoS) affecting the entire host.

Information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 4.11 and newer are vulnerable.

MITIGATION
==========

Using a userspace PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by Yehyeong Lee of Hyundai Mobis.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa526-linux.patch           Linux

$ sha256sum xsa526*
88dd41b89b43fa1b14e68c1a40aa69a22309e0c57a1b5543168949a273627ca8  xsa526-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was disclosed in public.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrt7ssMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZq84H/02MP77ou0FS+9nAF8CWbGl79KfiUWO2xjXPEdKB
Mgyzk0Gtq+Q0/oTaxPC59f9Pxc4yiCnGuIjpVM2qPOfaHZD0uEnzzGEROxVNCABq
7wCxZ/9Uu3MXO+1rcMgVqUNoHEqYLxgSp3OZ7O48DFQtkulP6fp4EgR0xTUIgPwn
oKlWoSKORAXOkULt5Qn5xI0+YN0OgDMdHKj/BPkRIGeeqOHPRcUmeZU9VRnOiATh
v1lR6erAWEx/dwr5Yq6ZReA6GFgDNRRk7ersnc5mwxxUyDtJtNXPHUCmE8AZ/q4C
H2I/1SLzm6oa+v+0fngSasn9+lMZC6fzy0SxRJF3clRui+A=
=uEqL
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa526-linux.patch"
Content-Disposition: attachment; filename="xsa526-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBGcmksIDYgTm92IDIw
MjYgMTM6MDc6NTIgKzAxMDAKU3ViamVjdDogW1BBVENIXSB4ZW4tbmV0YmFjazogRml4IFVBRiB3
aGVuIHJlYWRpbmcgc3RhdGlzdGljcyBkYXRhCgpUaGUgbmV0d29yayBzdGF0aXN0aWMgZGF0YSBp
biB0aGUgZHJpdmVyIGlzIHByb3RlY3RlZCBieSBSQ1UuClVuZm9ydHVuYXRlbHkgd2hlbiB0ZWFy
aW5nIGRvd24gdGhlIHF1ZXVlcyBhZnRlciBhbiBlcnJvciBkdXJpbmcKY29ubmVjdGluZyB0byB0
aGUgZnJvbnRlbmQgKGUuZy4gZHVlIHRvIGlsbGVnYWwgWGVuc3RvcmUgZGF0YSBmaWxsZWQKaW4g
YnkgdGhlIGd1ZXN0KSwgdGhlIHN0YXRpc3RpYyBkYXRhIGlzIGJlaW5nIGZyZWVkIHdpdGhvdXQK
c3luY2hyb25pemluZyB0aGUgUkNVIHN0YXRlLiAgSW4gY2FzZSB0aGUgZGF0YSBpcyBiZWluZyBy
ZWFkIHZpYSBzeXNmcwppbiB0aGlzIHBoYXNlLCBhY2Nlc3MgdG8gYWxyZWFkeSBmcmVlZCBtZW1v
cnkgb3IgbWVtb3J5IGJlaW5nIGluIG5ldwp1c2UgaXMgcG9zc2libGUuCgpGaXggdGhhdCBieSBj
YWxsaW5nIHN5bmNocm9uaXplX25ldCgpIGJlZm9yZSBmcmVlaW5nIHRoZSBxdWV1ZSBkYXRhLgoK
VGhpcyBpcyBYU0EtNTI2IC8gQ1ZFLTIwMjYtMTAwMDgwCgpGaXhlczogYjE3MDc1ZDVjMTk4ICgi
eGVuLW5ldGJhY2s6IGZpeCByYWNlIGNvbmRpdGlvbiBvbiBYZW5CdXMgZGlzY29ubmVjdCIpClJl
cG9ydGVkLWJ5OiBZZWh5ZW9uZyBMZWUgPHlobGVlQGlzc2xhYi5rb3JlYS5hYy5rcj4KU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL3hlbmJ1cy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYyBiL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCmluZGV4IGUwMjBmNDRhYzJjNy4uYzEwMzRkOGY2
YmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYworKysgYi9k
cml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYwpAQCAtODM3LDYgKzgzNyw3IEBAIHN0YXRp
YyB2b2lkIGNvbm5lY3Qoc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUpCiBlcnI6CiAJaWYgKGJlLT52
aWYtPm51bV9xdWV1ZXMgPiAwKQogCQl4ZW52aWZfZGlzY29ubmVjdF9kYXRhKGJlLT52aWYpOyAv
KiBDbGVhbiB1cCBleGlzdGluZyBxdWV1ZXMgKi8KKwlzeW5jaHJvbml6ZV9uZXQoKTsKIAlmb3Ig
KHF1ZXVlX2luZGV4ID0gMDsgcXVldWVfaW5kZXggPCBiZS0+dmlmLT5udW1fcXVldWVzOyArK3F1
ZXVlX2luZGV4KQogCQl4ZW52aWZfZGVpbml0X3F1ZXVlKCZiZS0+dmlmLT5xdWV1ZXNbcXVldWVf
aW5kZXhdKTsKIAl2ZnJlZShiZS0+dmlmLT5xdWV1ZXMpOwotLSAKMi41Ni4wCgo=

--=separator--

