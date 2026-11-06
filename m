Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5F606A339
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:16:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1476748.1682807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfn-0005Vo-Bh; Fri, 06 Nov 2026 15:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476748.1682807; Fri, 06 Nov 2026 15:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLfn-0005Uy-2t; Fri, 06 Nov 2026 15:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1476748;
 Fri, 06 Nov 2026 15:16:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfl-0004y1-Ms; Fri, 06 Nov 2026 15:16:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLfk-000GUT-RI; Fri, 06 Nov 2026 16:16:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef2e-bab6-0a2a0a5309dd-0a2a45018d98-22
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:08 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6aedef37-5984-0a2a45010019-6882d725dc6a-3
 for <multiple-recipients>; Fri, 06 Nov 2026 16:16:08 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfh-00000001GdW-1Cvs; Fri, 06 Nov 2026 15:16:05 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xPLfh-0000000A5vb-11J3; Fri, 06 Nov 2026 15:16:05 +0000
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
Subject: Xen Security Advisory 528 v1 (CVE-2026-100082) - Linux
 xen-blkback: guest can trigger use-after-free for reading statistic data
Message-Id: <E1xPLfh-0000000A5vb-11J3@xenbits.xenproject.org>
Date: Fri, 06 Nov 2026 15:16:05 +0000
X-purgate-ID: tlsNG-d62444/1793978168-BD146757-8A31FDDE/0/0
X-purgate-type: clean
X-purgate-size: 7764
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

           Xen Security Advisory CVE-2026-100082 / XSA-528

 Linux xen-blkback: guest can trigger use-after-free for reading statistic data

ISSUE DESCRIPTION
=================

he driver does not serialise reads of the device I/O statistics
against the freeing of the memory that holds them. This leads to a
use-after-free when reading statistical counters while the device is
being torn down.

IMPACT
======

This most likely crashes the driver, and possibly the host, causing a
Denial of Service (DoS) for the entire host.

Information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 4.5 and newer are vulnerable.

MITIGATION
==========

Using a userspace PV block backend (e.g. the qemu based "qdisk" backend)
will mitigate the problem.

Using a dedicated block driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by Yehyeong Lee of Hyundai Mobis.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa528-linux.patch           Linux

$ sha256sum xsa528*
848d5cc56a7b31e84399ac00d616c36bd2b5efdcc0f23017a7590b1b58900c19  xsa528-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

A very similar issue was disclosed in public.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrt7tAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZTFkH/jRhPRPUnQb/2KV42fKAPvQtffdEIWr72wc5ogYm
d6rTBU81hLdZAyq+Zo2jwhgggjXNeurD84z1Lnr8X6YgnRBAHfWhOd28V583K83j
BzmWsbFeUsMLjiaWuftzdr1RdpqB1ajk6NRAnR5Eb4jrWltIOekDgSviJupMfbRs
iq9pM0J/zbFBcIu21Lor4R5F8wYLx3cbzE0LuSq0j+D5uCMFIAhkea+7ReadQYxr
+L3LbEJIdcGpfZlcf9SRgJ8KKJr6d3JlHAVx2fpq8w/buwRFv3M87VL64MPUk7Tr
kJ/Wpl+hpvnTNE0m88eF1x3pMkdco6fwzz/xg7lvxm1k2Ho=
=CcMW
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa528-linux.patch"
Content-Disposition: attachment; filename="xsa528-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBUaHUsIDUgTm92IDIw
MjYgMDg6Mjc6MzggKzAxMDAKU3ViamVjdDogW1BBVENIXSB4ZW4tYmxrYmFjazogQXZvaWQgVUFG
IHdoZW4gcmVhZGluZyBJL08gc3RhdGlzdGljcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAoKUmVhZGluZyBJL08gc3RhdGlzdGljcyB2aWEgc3lzZnMgY29uY3VycmVudGx5IHdpdGgg
dGVhcmluZyBkb3duIGEKZnJvbnRlbmQgZGV2aWNlIG1pZ2h0IHJlc3VsdCBpbiBVQUYgb3IgYSBO
VUxMIGRlcmVmZXJlbmNlLCBhcyB0aGUKcmVhZGluZyBvZiB0aGUgc3RhdGlzdGljcyBkYXRhIGlz
IG5vdCBzeW5jaHJvbml6ZWQgd2l0aCBmcmVlaW5nIHRoZQpkYXRhLgoKVXNlIGEgcndsb2NrIGZv
ciBzeW5jaHJvbml6aW5nLgoKVGhpcyBpcyBYU0EtNTI4IC8gQ1ZFLTIwMjYtMTAwMDgyCgpGaXhl
czogZGI2ZmJjMTA2Nzg2ICgieGVuL2Jsa2JhY2s6IG1ha2Ugc3RfIHN0YXRpc3RpY3MgcGVyIHJp
bmciKQpSZXBvcnRlZC1ieTogWWVoeWVvbmcgTGVlIDx5aGxlZUBpc3NsYWIua29yZWEuYWMua3I+
ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyQHhlbnByb2plY3Qub3JnPgotLS0KIGRyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2svY29tbW9uLmggfCAgMiArKwogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay94ZW5idXMuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2NvbW1vbi5oCmluZGV4IGI0MjdkNTRiYzEyMC4uZjU4OTBiM2YxZGY5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCisrKyBiL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svY29tbW9uLmgKQEAgLTMxOCw4ICszMTgsMTAgQEAgc3RydWN0IHhlbl9ibGtp
ZiB7CiAJdW5zaWduZWQgaW50CQlucl9yaW5nX3BhZ2VzOwogCWJvb2wJCQltdWx0aV9yZWY7CiAJ
LyogQWxsIHJpbmdzIGZvciB0aGlzIGRldmljZS4gKi8KKwlyd2xvY2tfdAkJcmluZ3NfbG9jazsK
IAlzdHJ1Y3QgeGVuX2Jsa2lmX3JpbmcJKnJpbmdzOwogCXVuc2lnbmVkIGludAkJbnJfcmluZ3M7
CisKIAl1bnNpZ25lZCBsb25nCQlidWZmZXJfc3F1ZWV6ZV9lbmQ7CiB9OwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay94ZW5idXMuYwppbmRleCA0Yjg2NWVmODAwYjEuLjhkMGZmOGZjYWMyMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL2Js
b2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCkBAIC0xMjcsMTQgKzEyNywyMyBAQCBzdGF0aWMgdm9p
ZCB4ZW5fdXBkYXRlX2Jsa2lmX3N0YXR1cyhzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZikKIAlyZXR1
cm47CiB9CiAKLXN0YXRpYyBpbnQgeGVuX2Jsa2lmX2FsbG9jX3JpbmdzKHN0cnVjdCB4ZW5fYmxr
aWYgKmJsa2lmKQorc3RhdGljIGludCB4ZW5fYmxraWZfYWxsb2NfcmluZ3Moc3RydWN0IHhlbl9i
bGtpZiAqYmxraWYsCisJCQkJIHVuc2lnbmVkIGludCBucl9yaW5ncykKIHsKIAl1bnNpZ25lZCBp
bnQgcjsKKwlzdHJ1Y3QgeGVuX2Jsa2lmX3JpbmcgKnJpbmdzOwogCi0JYmxraWYtPnJpbmdzID0g
a3phbGxvY19vYmpzKHN0cnVjdCB4ZW5fYmxraWZfcmluZywgYmxraWYtPm5yX3JpbmdzKTsKLQlp
ZiAoIWJsa2lmLT5yaW5ncykKKwlyaW5ncyA9IGt6YWxsb2Nfb2JqcyhzdHJ1Y3QgeGVuX2Jsa2lm
X3JpbmcsIG5yX3JpbmdzKTsKKwlpZiAoIXJpbmdzKQogCQlyZXR1cm4gLUVOT01FTTsKIAorCXdy
aXRlX2xvY2soJmJsa2lmLT5yaW5nc19sb2NrKTsKKworCWJsa2lmLT5yaW5ncyA9IHJpbmdzOwor
CWJsa2lmLT5ucl9yaW5ncyA9IG5yX3JpbmdzOworCisJd3JpdGVfdW5sb2NrKCZibGtpZi0+cmlu
Z3NfbG9jayk7CisKIAlmb3IgKHIgPSAwOyByIDwgYmxraWYtPm5yX3JpbmdzOyByKyspIHsKIAkJ
c3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nID0gJmJsa2lmLT5yaW5nc1tyXTsKIApAQCAtMTc0
LDYgKzE4Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgeGVuX2Jsa2lmICp4ZW5fYmxraWZfYWxsb2MoZG9t
aWRfdCBkb21pZCkKIAlibGtpZi0+ZG9taWQgPSBkb21pZDsKIAlhdG9taWNfc2V0KCZibGtpZi0+
cmVmY250LCAxKTsKIAlpbml0X2NvbXBsZXRpb24oJmJsa2lmLT5kcmFpbl9jb21wbGV0ZSk7CisJ
cndsb2NrX2luaXQoJmJsa2lmLT5yaW5nc19sb2NrKTsKIAogCS8qCiAJICogQmVjYXVzZSBmcmVl
aW5nIGJhY2sgdG8gdGhlIGNhY2hlIG1heSBiZSBkZWZlcnJlZCwgaXQgaXMgbm90CkBAIC0yNjgs
NiArMjc4LDcgQEAgc3RhdGljIGludCB4ZW5fYmxraWZfZGlzY29ubmVjdChzdHJ1Y3QgeGVuX2Js
a2lmICpibGtpZikKIAlzdHJ1Y3QgcGVuZGluZ19yZXEgKnJlcSwgKm47CiAJdW5zaWduZWQgaW50
IGosIHI7CiAJYm9vbCBidXN5ID0gZmFsc2U7CisJc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5n
czsKIAogCWZvciAociA9IDA7IHIgPCBibGtpZi0+bnJfcmluZ3M7IHIrKykgewogCQlzdHJ1Y3Qg
eGVuX2Jsa2lmX3JpbmcgKnJpbmcgPSAmYmxraWYtPnJpbmdzW3JdOwpAQCAtMzM0LDEwICszNDUs
MTYgQEAgc3RhdGljIGludCB4ZW5fYmxraWZfZGlzY29ubmVjdChzdHJ1Y3QgeGVuX2Jsa2lmICpi
bGtpZikKIAkgKiBibGtpZi0+cmluZ3Mgd2FzIGFsbG9jYXRlZCBpbiBjb25uZWN0X3JpbmcsIHNv
IHdlIHNob3VsZCBmcmVlIGl0IGluCiAJICogaGVyZS4KIAkgKi8KLQlrZnJlZShibGtpZi0+cmlu
Z3MpOworCXdyaXRlX2xvY2soJmJsa2lmLT5yaW5nc19sb2NrKTsKKworCXJpbmdzID0gYmxraWYt
PnJpbmdzOwogCWJsa2lmLT5yaW5ncyA9IE5VTEw7CiAJYmxraWYtPm5yX3JpbmdzID0gMDsKIAor
CXdyaXRlX3VubG9jaygmYmxraWYtPnJpbmdzX2xvY2spOworCisJa2ZyZWUocmluZ3MpOworCiAJ
cmV0dXJuIDA7CiB9CiAKQEAgLTM4NSw2ICs0MDIsNyBAQCB2b2lkIHhlbl9ibGtpZl9pbnRlcmZh
Y2VfZmluaSh2b2lkKQogCQl1bnNpZ25lZCBpbnQgaTsJCQkJCQlcCiAJCXVuc2lnbmVkIGxvbmcg
bG9uZyByZXN1bHQgPSAwOwkJCQlcCiAJCQkJCQkJCQlcCisJCXJlYWRfbG9jaygmYmxraWYtPnJp
bmdzX2xvY2spOwkJCQlcCiAJCWlmICghYmxraWYtPnJpbmdzKQkJCQlcCiAJCQlnb3RvIG91dDsJ
CQkJCVwKIAkJCQkJCQkJCVwKQEAgLTM5NSw2ICs0MTMsNyBAQCB2b2lkIHhlbl9ibGtpZl9pbnRl
cmZhY2VfZmluaSh2b2lkKQogCQl9CQkJCQkJCVwKIAkJCQkJCQkJCVwKIG91dDoJCQkJCQkJCQlc
CisJCXJlYWRfdW5sb2NrKCZibGtpZi0+cmluZ3NfbG9jayk7CQkJXAogCQlyZXR1cm4gc3ByaW50
ZihidWYsIGZvcm1hdCwgcmVzdWx0KTsJCQlcCiAJfQkJCQkJCQkJXAogCXN0YXRpYyBERVZJQ0Vf
QVRUUihuYW1lLCAwNDQ0LCBzaG93XyMjbmFtZSwgTlVMTCkKQEAgLTExMDIsOCArMTEyMSw3IEBA
IHN0YXRpYyBpbnQgY29ubmVjdF9yaW5nKHN0cnVjdCBiYWNrZW5kX2luZm8gKmJlKQogCQkJCXJl
cXVlc3RlZF9udW1fcXVldWVzLCB4ZW5ibGtfbWF4X3F1ZXVlcyk7CiAJCXJldHVybiAtRU5PU1lT
OwogCX0KLQlibGtpZi0+bnJfcmluZ3MgPSByZXF1ZXN0ZWRfbnVtX3F1ZXVlczsKLQlpZiAoeGVu
X2Jsa2lmX2FsbG9jX3JpbmdzKGJsa2lmKSkKKwlpZiAoeGVuX2Jsa2lmX2FsbG9jX3JpbmdzKGJs
a2lmLCByZXF1ZXN0ZWRfbnVtX3F1ZXVlcykpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJcHJfaW5m
bygiJXM6IHVzaW5nICVkIHF1ZXVlcywgcHJvdG9jb2wgJWQgKCVzKSAlc1xuIiwgZGV2LT5ub2Rl
bmFtZSwKLS0gCjIuNTYuMAoK

--=separator--

