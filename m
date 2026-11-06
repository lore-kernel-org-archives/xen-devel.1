Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CE606A329
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:16:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1476744.1682776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfk-0004qp-TL; Fri, 06 Nov 2026 15:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476744.1682776; Fri, 06 Nov 2026 15:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfk-0004qg-P5; Fri, 06 Nov 2026 15:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1476744;
 Fri, 06 Nov 2026 15:16:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfi-0004Gd-Sh; Fri, 06 Nov 2026 15:16:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLfi-00447Q-9G; Fri, 06 Nov 2026 16:16:06 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef2d-2eae-0a2a0a5409dd-0a2a450c88d0-20
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:06 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef34-f479-0a2a450c0019-6882d725be5a-3
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:05 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfe-00000001Gd5-1DVm; Fri, 06 Nov 2026 15:16:02 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfe-0000000A5tc-0wMP; Fri, 06 Nov 2026 15:16:02 +0000
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
Subject: Xen Security Advisory 527 v1 (CVE-2026-100081) - Linux
 xen-netback: guest can trigger use-after-free for reading multicast data
Message-Id: <E1xPLfe-0000000A5tc-0wMP@xenbits.xenproject.org>
Date: Fri, 06 Nov 2026 15:16:02 +0000
X-purgate-ID: tlsNG-d25034/1793978166-770D9A5B-658D72A8/0/0
X-purgate-type: clean
X-purgate-size: 4580
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

           Xen Security Advisory CVE-2026-100081 / XSA-527

 Linux xen-netback: guest can trigger use-after-free for reading multicast data

ISSUE DESCRIPTION
=================

Multicast handling in the driver is implemented as a lookup early on the
transmit (guest receive) path.  The respective function can be invoked in
parallel with teardown of a device.  Thus the lookup may access data which
was already freed, with that memory perhaps already being in new use
elsewhere.

IMPACT
======

The most likely outcome is a driver crash, possibly escalated to a host
crash.  This then is a Denial of Service (DoS) affecting the entire host.
Information leaks and, with very low likelihood, privilege escalation
cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 4.3 and newer are vulnerable.

MITIGATION
==========

Using a userspace PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by kerhunt.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa527-linux.patch           Linux 7.4-rc - 5.5

$ sha256sum xsa527*
f68ebd9c262ac005043c9832bc8f73d70f5e083d1c9435b55d4dccadbb3e40df  xsa527-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

A closely related issue was disclosed in public.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrt7s4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZeNAH/j1BrfAQ6QeYh/fzh1ql5EG2e2hE3m3cP6k84uBh
ZIVNAcqat+6UsxF/jaHRyTV49cts4HVHDBu9mpoi1vWkLhoSK7kkLl37oh0ar71P
XpCtLfgqzCPd/0F19at2l5sigXwZA/GvRbn4aEVp4s+dC5U/a67IZJtj/xMvTGVB
oOeIEenbIQHrWMCQmXaLHa2Ht2qCgJyyt0LzAFZf2pTbcl6tnCt8yQFVHh2ABa7e
5rXgH3bJRp6AOod3nsAkL+al2l8ShAx/TTIvDUxZw+qD6bELMDBwGYWSTMCRogAH
JcqEMRgZWL87gx2ubKJkG57pGuoXv8ydhD2o0/9WrBPRbzs=
=dUnZ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa527-linux.patch"
Content-Disposition: attachment; filename="xsa527-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiB4ZW4tbmV0YmFj
azogZGVmZXIgeGVudmlmX21jYXN0X2FkZHJfbGlzdF9mcmVlKCkKCkluIG9yZGVyIGZvciB0aGUg
ZnVuY3Rpb24gdG8gbGVnaXRpbWF0ZWx5IGF2b2lkIGxvY2tpbmcvUkNVLCBpdCBuZWVkcyB0bwpy
dW4gYWZ0ZXIgYWxsIFRYL1JYIHByb2Nlc3NpbmcgaGFzIGZpbmlzaGVkL3N0b3BwZWQ6IExvb2t1
cHMgaGFwcGVuIGZyb20KeGVudmlmX3N0YXJ0X3htaXQoKSwgd2hpbGUgYWRkcy9yZW1vdmVzIGhh
cHBlbiBmcm9tIHhlbnZpZl90eF9hY3Rpb24oKQooY2FsbGVkIG91dCBvZiB4ZW52aWZfcG9sbCgp
KS4KCk1vdmUgdGhlIGNhbGwgb3V0IG9mIHhlbnZpZl9kaXNjb25uZWN0X2RhdGEoKSAodGhlIGNh
bGwgdG8gdGhlIGZ1bmN0aW9uCmZyb20gY29ubmVjdCgpJ3MgZXJyb3IgcGF0aCBkb2Vzbid0IHJl
cXVpcmUgYW55IGNsZWFuaW5nIHVwIHRoZXJlKSwgYW5kCnB1dCBpdCBwYXN0IHRoZSBzeW5jaHJv
bml6YXRpb24gcG9pbnQgaW4gYmFja2VuZF9kaXNjb25uZWN0KCkuCgpUaGlzIGlzIFhTQS01Mjcg
LyBDVkUtMjAyNi0xMDAwODEuCgpGaXhlczogYjE3MDc1ZDVjMTk4ICgieGVuLW5ldGJhY2s6IGZp
eCByYWNlIGNvbmRpdGlvbiBvbiBYZW5CdXMgZGlzY29ubmVjdCIpClJlcG9ydGVkLWJ5OiBrZXJo
dW50IDxrZXJodW50QHByb3Rvbi5tZT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKKysrIGIvZHJpdmVy
cy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKQEAgLTgxMiw4ICs4MTIsNiBAQCB2b2lkIHhl
bnZpZl9kaXNjb25uZWN0X2RhdGEoc3RydWN0IHhlbnZpCiAKIAkJeGVudmlmX2Rpc2Nvbm5lY3Rf
cXVldWUocXVldWUpOwogCX0KLQotCXhlbnZpZl9tY2FzdF9hZGRyX2xpc3RfZnJlZSh2aWYpOwog
fQogCiB2b2lkIHhlbnZpZl9kaXNjb25uZWN0X2N0cmwoc3RydWN0IHhlbnZpZiAqdmlmKQotLS0g
YS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay94ZW5idXMuYwpAQCAtMjY3LDYgKzI2Nyw4IEBAIHN0YXRpYyB2b2lkIGJhY2tlbmRf
ZGlzY29ubmVjdChzdHJ1Y3QgYmEKIAkJdmlmLT5udW1fcXVldWVzID0gMDsKIAkJc3luY2hyb25p
emVfbmV0KCk7CiAKKwkJeGVudmlmX21jYXN0X2FkZHJfbGlzdF9mcmVlKHZpZik7CisKIAkJZm9y
IChxdWV1ZV9pbmRleCA9IDA7IHF1ZXVlX2luZGV4IDwgbnVtX3F1ZXVlczsgKytxdWV1ZV9pbmRl
eCkKIAkJCXhlbnZpZl9kZWluaXRfcXVldWUoJnZpZi0+cXVldWVzW3F1ZXVlX2luZGV4XSk7CiAK

--=separator--

