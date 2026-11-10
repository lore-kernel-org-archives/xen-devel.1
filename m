Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751C60A2606
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 18:01:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1482152.1686057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQq9H-0003JW-K5; Tue, 10 Nov 2026 18:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482152.1686057; Tue, 10 Nov 2026 18:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQq9H-0003JP-HV; Tue, 10 Nov 2026 18:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1482152;
 Tue, 10 Nov 2026 18:00:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq9F-00030t-Mx; Tue, 10 Nov 2026 18:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQq9C-000qOI-AU; Tue, 10 Nov 2026 19:00:42 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af35bbd-e002-0a2a0a5209dd-0a2a45069f10-22
 for <multiple-recipients>; Tue, 10 Nov 2026 19:00:41 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6af35bc8-195a-0a2a45060019-6882d725ac66-3
 for <multiple-recipients>; Tue, 10 Nov 2026 19:00:41 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq97-00000006HD4-0Mwj; Tue, 10 Nov 2026 18:00:37 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xQq97-00000003N8z-1NFl; Tue, 10 Nov 2026 18:00:37 +0000
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
Subject: Xen Security Advisory 524 v1 (CVE-2024-21963) - AMD IOMMU
 Out-of-Bounds Device Table Read
Message-Id: <E1xQq97-00000003N8z-1NFl@xenbits.xenproject.org>
Date: Tue, 10 Nov 2026 18:00:37 +0000
X-purgate-ID: tlsNG-16d1c6/1794333641-F7ACA77B-4209E8E8/0/0
X-purgate-type: clean
X-purgate-size: 10317
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

            Xen Security Advisory CVE-2024-21963 / XSA-524

               AMD IOMMU Out-of-Bounds Device Table Read

ISSUE DESCRIPTION
=================

With AMD IOMMUs, the OS or Hypervisor chooses the position and size of
the Device Table, which holds the main configuration information for
devices.

AMD have disclosed a vulnerability in some IOMMUs, whereby under
specific circumstances they read beyond the size chosen by the OS or
Hypervisor.  This gets interpreted as valid configuration data for
certain devices.

For more information, see:
  https://www.amd.com/en/resources/product-security/bulletin/amd-sb-3060.html

IMPACT
======

Depending on platform and system configuration, a domain might be able
to control the IOMMU configuration for a device.

If a domain can exercise such control, it can modify arbitrary host
memory and escalate it's privilege to that of Xen.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Only certain AMD systems are believed to be vulnerable.  Systems from
other manufacturers are not known to be affected.

A particular system is potentially vulnerable if:

 1) Any of the IOMMUs in the system have a Device Table size less than
    2MB.  i.e. the system's IVRS table describes that particular IOMMU
    as not covering a full PCI bus, and
 2) There is either:
    a) A real device behind the IOMMU which is the first function not
       covered by the IVRS description, or
    b) Any device behind the IOMMU which can be configured to use the
       initiator ID of the first function not covered by the IVRS
       description.

If the above situation holds, the IOMMU will read out of bounds from the
next sequential page in physical memory, and interpret it as valid
configuration data for the device.  This page may belong to a guest.

MITIGATION
==========

There are no mitigations.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa524.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa524*
01204a1bacc2bfb44506975a147fbf5f067831eebee37b7f8cf55f558adceb50  xsa524.patch
$

NOTE CONCERNING CVE
===================

The use of a 2024 CVE on a 2026 disclosure was queried with AMD, and
confirmed to be correct.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrzWUUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZF3oIALkMaorBfSljZ7A0pDIjp9Ejy3vkQgMfMnyDpmnh
n/M0rdHDaX+hpavhsCThZd65j6fwLiLqeKC14FV9dxmb3VqdW7Efpc6J/LZ3Z3ZW
hbtej/hGRfjWGKF4El6FH4Lzx5AjDmKqDyvR71+TL2sXT80xvKmWfVhx8MGG+JGb
lKuBp0lS+72qhIGdMr3IWOebYi0h75JA0XgPlm2YGajn7CL0RpImO78gb5WvT5sU
/Bv9kUBhsZsitTEV8vXdF4A0ksZM9xIYQavsfq+4YyRGYmAYwQqR3mYHF2SJdq4R
MGsY5LxhFcktw+dfRq9rtfU/vnVkfxDBgzQrwRFts8YbCqI=
=bZvY
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa524.patch"
Content-Disposition: attachment; filename="xsa524.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBBTUQvSU9NTVU6
IGFsbG9jYXRlIChhdCBsZWFzdCkgb25lIHNwYXJlIGRldmljZSB0YWJsZSBlbnRyeQoKQ2VydGFp
biBJT01NVXMgaGF2ZSBhbiBvZmYtYnktb25lIGluIHRoZSB1cHBlciBib3VuZHMgY2hlY2sgb2Yg
ZGV2aWNlCnRhYmxlIGFjY2Vzc2VzLiBUaGVyZWZvcmUgYW4gZXh0cmEgZW50cnkgaXMgbmVlZGVk
LCB0byBhdm9pZCB0aGUgSU9NTVUKYWNjZXNzaW5nIHJhbmRvbSB1bnJlbGF0ZWQgbWVtb3J5LgoK
U2luY2UgdGhlIHNpemUgaXMgcmVwb3J0ZWQgdG8gdGhlIElPTU1VIGluIDRrIGdyYW51bGFyaXR5
LCBhbiBleHRyYSBwYWdlCm1heSBuZWVkIGFsbG9jYXRpbmcuIFRvIGtlZXAgdGhpbmdzIHNpbXBs
ZSAoYXMgYmVmb3JlOiBmdWxsIG9yZGVyLU4KYWxsb2NhdGlvbnMpLCBhcnJhbmdlIHRvIGFsbG9j
YXRlIHRoZSBuZXh0IGhpZ2hlciBvcmRlciBvZiBwYWdlcyBpZi9hcwpuZWNlc3NhcnkuIEF0IHRo
ZSBzYW1lIHRpbWUgYXZvaWQgdXNpbmcgLyByZXBvcnRpbmcgdGhlIGV4dHJhIGVudHJpZXMuCgpB
cyBzdHJ1Y3QgdGFibGVfc3RydWN0J3MgYWxsb2Nfc2l6ZSBmaWVsZCBpcyBub3cgb25seSBldmVy
IHdyaXR0ZW4sIGRyb3AKdGhlIGZpZWxkIHJpZ2h0IGF3YXkgKGlmIGZvciBub3RoaW5nIGVsc2Ug
dGhhbiB0byBhdm9pZCBwb3NzaWJsZSBNaXNyYQpjb25jZXJucykuCgpUaGlzIGlzIENWRS0yMDI0
LTIxOTYzIC8gWFNBLTUyNC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LWRlZnMu
aCBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS1kZWZzLmgKaW5kZXggMzBiMDk0
ZjE4NzY4Li43MmM3NTc5MTg1MzEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdS1kZWZzLmgKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
LWRlZnMuaApAQCAtMTA0LDcgKzEwNCw3IEBAIHN0cnVjdCBhbWRfaW9tbXVfZHRlIHsKICAgICAv
KiAwIC0gNjMgKi8KICAgICBib29sIHY6MTsKICAgICBib29sIHR2OjE7Ci0gICAgdW5zaWduZWQg
aW50IDo1OworICAgIHVuc2lnbmVkIGludCByc3ZkOjU7CiAgICAgdW5zaWduZWQgaW50IGhhZDoy
OwogI2RlZmluZSBJT01NVV9NQVhfUFRfTEVWRUxTIDYKICAgICB1bnNpZ25lZCBpbnQgcGFnaW5n
X21vZGU6MzsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5o
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmgKaW5kZXggNTJmNzQ4MzEwYmU0
Li4wNDJjNmVlZDU5YjIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdS5oCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5oCkBAIC01NCw3
ICs1NCw2IEBAIHR5cGVkZWYgc3RydWN0IGNtZF9lbnRyeQogc3RydWN0IHRhYmxlX3N0cnVjdCB7
CiAgICAgdm9pZCAqYnVmZmVyOwogICAgIHVuc2lnbmVkIGxvbmcgZW50cmllczsKLSAgICB1bnNp
Z25lZCBsb25nIGFsbG9jX3NpemU7CiB9OwogCiBzdHJ1Y3QgcmluZ19idWZmZXIgewpkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKaW5kZXggZTBjODkyNWMzM2Y3Li45Mzc2
Y2E2MTIwOTkgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAt
ODAsNyArODAsOSBAQCBzdGF0aWMgdm9pZCByZWdpc3Rlcl9pb21tdV9kZXZfdGFibGVfaW5fbW1p
b19zcGFjZShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKIAogICAgIGVudHJ5ID0gMDsKICAgICBp
b21tdV9zZXRfYWRkcl9sb190b19yZWcoJmVudHJ5LCBhZGRyX2xvID4+IFBBR0VfU0hJRlQpOwot
ICAgIHNldF9maWVsZF9pbl9yZWdfdTMyKChpb21tdS0+ZGV2X3RhYmxlLmFsbG9jX3NpemUgLyBQ
QUdFX1NJWkUpIC0gMSwKKyAgICBzZXRfZmllbGRfaW5fcmVnX3UzMihST1VORFVQKGlvbW11LT5k
ZXZfdGFibGUuZW50cmllcyAqCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01N
VV9ERVZfVEFCTEVfRU5UUllfU0laRSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFBBR0VfU0laRSkgLSAxLAogICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5LCBJT01NVV9E
RVZfVEFCTEVfU0laRV9NQVNLLAogICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0RFVl9U
QUJMRV9TSVpFX1NISUZULCAmZW50cnkpOwogICAgIHdyaXRlbChlbnRyeSwgaW9tbXUtPm1taW9f
YmFzZSArIElPTU1VX0RFVl9UQUJMRV9CQVNFX0xPV19PRkZTRVQpOwpAQCAtOTQ4LDggKzk1MCwy
MSBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQog
CiBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBkdF9hbGxvY19zaXplKHZvaWQpCiB7Ci0gICAg
cmV0dXJuIFBBR0VfU0laRSA8PCBnZXRfb3JkZXJfZnJvbV9ieXRlcyhpdnJzX2JkZl9lbnRyaWVz
ICoKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0RF
Vl9UQUJMRV9FTlRSWV9TSVpFKTsKKyAgICB1bnNpZ25lZCBpbnQgbnIgPSBST1VORFVQKGl2cnNf
YmRmX2VudHJpZXMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUgLyBJ
T01NVV9ERVZfVEFCTEVfRU5UUllfU0laRSk7CisKKyAgICAvKgorICAgICAqIEFNRCBTTi0zMDYw
IC8gQ1ZFLTIwMjQtMjE5NjMKKyAgICAgKgorICAgICAqIFNvbWUgSU9NTVVzIHJlYWQgYmV5b25k
IHRoZSBwcm9ncmFtbWVkIERldmljZSBUYWJsZSBsaW1pdC4gIFdoZW4gdGhlCisgICAgICogdG90
YWwgc2l6ZSBvZiB0aGUgRGV2aWNlIFRhYmxlIGlzIGxlc3MgdGhhbiAyTSAoY292ZXJpbmcgYWxs
IDJeMTYgQkRGcworICAgICAqIGluIGEgc2luZ2xlIFBDSSBTZWdtZW50KSwgd2UgbXVzdCBhbGxv
Y2F0ZSBvbmUgZXh0cmEgZW50cnkgdG8gYXZvaWQgdGhlCisgICAgICogSU9NTVUgcmVhZGluZyB1
bnJlbGF0ZWQgbWVtb3J5IGFuZCB0cmVhdGluZyBpdCBhcyBhIHZhbGlkIGVudHJ5LgorICAgICAq
LworICAgIGlmICggbnIgPCAoMVUgPDwgMTYpICkKKyAgICAgICAgKytucjsKKworICAgIHJldHVy
biBQQUdFX1NJWkUgPDwgZ2V0X29yZGVyX2Zyb21fYnl0ZXMobnIgKiBJT01NVV9ERVZfVEFCTEVf
RU5UUllfU0laRSk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBkZWFsbG9jYXRlX2J1ZmZlcih2
b2lkICpidWYsIHVuc2lnbmVkIGxvbmcgc3opCkBAIC0xMDg5LDkgKzExMDQsOCBAQCBzdGF0aWMg
aW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsIGJv
b2wgaW50cikKICAgICBpZiAoICFJVlJTX01BUFBJTkdTX0RFVlRBQihpdnJzX21hcHBpbmdzKSAp
CiAgICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogCi0gICAgaW9tbXUtPmRldl90YWJsZS5hbGxvY19z
aXplID0gZHRfYWxsb2Nfc2l6ZSgpOwotICAgIGlvbW11LT5kZXZfdGFibGUuZW50cmllcyA9IGlv
bW11LT5kZXZfdGFibGUuYWxsb2Nfc2l6ZSAvCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJWkU7CisgICAgLyogVGhlcmUgbWF5IGJlIHRyYWls
aW5nICJzY3JhdGNoIiBlbnRyaWVzLCB3aGljaCBzaG91bGQgbm90IGJlIHVzZWQuICovCisgICAg
aW9tbXUtPmRldl90YWJsZS5lbnRyaWVzID0gaXZyc19iZGZfZW50cmllczsKICAgICBpb21tdS0+
ZGV2X3RhYmxlLmJ1ZmZlciA9IElWUlNfTUFQUElOR1NfREVWVEFCKGl2cnNfbWFwcGluZ3MpOwog
CiAgICAgZW5hYmxlX2lvbW11KGlvbW11KTsKQEAgLTEyNTUsMTEgKzEyNjksMjEgQEAgc3RhdGlj
IGludCBfX2luaXQgY2ZfY2hlY2sgYW1kX2lvbW11X3NldHVwX2RldmljZV90YWJsZSgKICAgICAg
ICAgICogSU9NTVVfREVWX1RBQkxFX0lOVF9DT05UUk9MX0FCT1JURUQgYWxsIGJlaW5nIHplcm8s
IGFuZCB1cyBhbHNvCiAgICAgICAgICAqIHdhbnRpbmcgYXQgbGVhc3QgVFYsIEdWLCBJLCBhbmQg
RVggc2V0IHRvIGZhbHNlLgogICAgICAgICAgKi8KLSAgICAgICAgZm9yICggYmRmID0gMCwgc2l6
ZSAvPSBzaXplb2YoKmR0KTsgYmRmIDwgc2l6ZTsgKytiZGYgKQorICAgICAgICBmb3IgKCBiZGYg
PSAwOyBiZGYgPCBpdnJzX2JkZl9lbnRyaWVzOyArK2JkZiApCiAgICAgICAgICAgICBkdFtiZGZd
ID0gKHN0cnVjdCBhbWRfaW9tbXVfZHRlKXsKICAgICAgICAgICAgICAgICAgICAgICAgICAgLnYg
PSB0cnVlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSBpb21tdV9pbnRyZW1hcCwK
ICAgICAgICAgICAgICAgICAgICAgICB9OworCisgICAgICAgIC8qCisgICAgICAgICAqIFByZWZp
bGwgZXh0cmEgRFRFcyBzdWNoIHRoYXQgdGhlaXIgdXNlIHdpbGwgcmFpc2UgYW4KKyAgICAgICAg
ICogSUxMRUdBTF9ERVZfVEFCTEVfRU5UUlkgZXZlbnQuCisgICAgICAgICAqLworICAgICAgICBm
b3IgKCBzaXplIC89IHNpemVvZigqZHQpOyBiZGYgPCBzaXplOyArK2JkZiApCisgICAgICAgICAg
ICBkdFtiZGZdID0gKHN0cnVjdCBhbWRfaW9tbXVfZHRlKXsKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgLnYgPSB0cnVlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAucnN2ZCA9IDMsIC8q
IEFzIHBlciBBTUQgcmVjb21tZW5kYXRpb24uICovCisgICAgICAgICAgICAgICAgICAgICAgfTsK
ICAgICB9CiAKICAgICAvKiBBZGQgZGV2aWNlIHRhYmxlIGVudHJpZXMgKi8K

--=separator--

