Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA07606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 15:28:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1492713.1693056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTL69-0008Q6-MZ; Tue, 17 Nov 2026 15:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492713.1693056; Tue, 17 Nov 2026 15:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTL69-0008Pv-Il; Tue, 17 Nov 2026 15:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1492713;
 Tue, 17 Nov 2026 15:27:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xTL68-0008MI-0k; Tue, 17 Nov 2026 15:27:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTL67-002Naw-D9; Tue, 17 Nov 2026 16:27:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6afc7276-2eae-0a2a0a5409dd-0a2a4501ba12-6
 for <multiple-recipients>; Tue, 17 Nov 2026 16:27:51 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6afc7275-5984-0a2a45010019-6882d725a810-3
 for <multiple-recipients>; Tue, 17 Nov 2026 16:27:51 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xTL62-00000002z1Y-1CR2; Tue, 17 Nov 2026 15:27:46 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xTL62-0000000Cr98-21cp; Tue, 17 Nov 2026 15:27:46 +0000
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
Subject: Xen Security Advisory 524 v2 (CVE-2024-21963) - AMD IOMMU
 Out-of-Bounds Device Table Read
Message-Id: <E1xTL62-0000000Cr98-21cp@xenbits.xenproject.org>
Date: Tue, 17 Nov 2026 15:27:46 +0000
X-purgate-ID: tlsNG-d62444/1794929271-BCB45757-97C6D35E/0/0
X-purgate-type: clean
X-purgate-size: 12075
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
                               version 2

               AMD IOMMU Out-of-Bounds Device Table Read

UPDATES IN VERSION 2
====================

Original (buggy) patch updated and new incremental patch added.

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

Applying the first of the attached patches to a tree not previously
patched for this XSA resolves this issue.  Applying the second of the
attached patches on top of the originally distributed one, which was
meanwhile also committed to the respective git branches, also
resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa524.patch           xen-unstable - Xen 4.17.x
xsa524-fix.patch       xen-unstable - Xen 4.17.x

$ sha256sum xsa524*
74d593768da3b9303b984d3f65439510138c8d1ccd2ed84b9abc2867881dfee5  xsa524.patch
8ca9e4ea59b17ad6003dc6f512c049840c722f78cc379f32337c8a698b779bd2  xsa524-fix.patch
$

NOTE CONCERNING CVE
===================

The use of a 2024 CVE on a 2026 disclosure was queried with AMD, and
confirmed to be correct.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmr8clAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKwIH/itoSkHwzCASmVBAdsxVJ7PrziOBOs3CI2dkTfqn
zqLzrx6PwgjnPCGUvhUinTrjR9W68DNFnwi4fSUHOvpErXVq9OPj/XFEahDQ90fZ
Rsjff4+XwhZUk4SWjsamFwrPTyKId/fGESWI53jMDlVMjfh5qHSuXcIbF1F/PIgO
5WKZiX6mIL1T/pzMg7Q7prQSpEhWz+kKSvPEUy2CgYGJzIIkANxcls2sdDAj6FSW
FXWHlNLNnRD9n3LbWHktZktkgnz4cTwxL0Z62vB8viWMtN+SC1vN6lftCWVhTXeI
mwtKAR56TYZaJ8vw/LKKCQmu0PFNYyOcvEKw+1bxokBPyZs=
=TFmn
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
b20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5oCisrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS1kZWZzLmgKQEAgLTEwNCw3ICsxMDQs
NyBAQCBzdHJ1Y3QgYW1kX2lvbW11X2R0ZSB7CiAgICAgLyogMCAtIDYzICovCiAgICAgYm9vbCB2
OjE7CiAgICAgYm9vbCB0djoxOwotICAgIHVuc2lnbmVkIGludCA6NTsKKyAgICB1bnNpZ25lZCBp
bnQgcnN2ZDo1OwogICAgIHVuc2lnbmVkIGludCBoYWQ6MjsKICNkZWZpbmUgSU9NTVVfTUFYX1BU
X0xFVkVMUyA2CiAgICAgdW5zaWduZWQgaW50IHBhZ2luZ19tb2RlOjM7Ci0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5oCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdS5oCkBAIC01NCw3ICs1NCw2IEBAIHR5cGVkZWYgc3RydWN0IGNtZF9lbnRyeQog
c3RydWN0IHRhYmxlX3N0cnVjdCB7CiAgICAgdm9pZCAqYnVmZmVyOwogICAgIHVuc2lnbmVkIGxv
bmcgZW50cmllczsKLSAgICB1bnNpZ25lZCBsb25nIGFsbG9jX3NpemU7CiB9OwogCiBzdHJ1Y3Qg
cmluZ19idWZmZXIgewotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTgw
LDcgKzgwLDggQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfaW9tbXVfZGV2X3RhYmxlX2luX21taW9f
c3BhY2Uoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCiAKICAgICBlbnRyeSA9IDA7CiAgICAgaW9t
bXVfc2V0X2FkZHJfbG9fdG9fcmVnKCZlbnRyeSwgYWRkcl9sbyA+PiBQQUdFX1NISUZUKTsKLSAg
ICBzZXRfZmllbGRfaW5fcmVnX3UzMigoaW9tbXUtPmRldl90YWJsZS5hbGxvY19zaXplIC8gUEFH
RV9TSVpFKSAtIDEsCisgICAgc2V0X2ZpZWxkX2luX3JlZ191MzIoUEZOX1VQKGlvbW11LT5kZXZf
dGFibGUuZW50cmllcyAqCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0RF
Vl9UQUJMRV9FTlRSWV9TSVpFKSAtIDEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgZW50cnks
IElPTU1VX0RFVl9UQUJMRV9TSVpFX01BU0ssCiAgICAgICAgICAgICAgICAgICAgICAgICAgSU9N
TVVfREVWX1RBQkxFX1NJWkVfU0hJRlQsICZlbnRyeSk7CiAgICAgd3JpdGVsKGVudHJ5LCBpb21t
dS0+bW1pb19iYXNlICsgSU9NTVVfREVWX1RBQkxFX0JBU0VfTE9XX09GRlNFVCk7CkBAIC05NDgs
OCArOTQ5LDIxIEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfaW9tbXUoc3RydWN0IGFtZF9pb21tdSAq
aW9tbXUpCiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19pbml0IGR0X2FsbG9jX3NpemUodm9pZCkK
IHsKLSAgICByZXR1cm4gUEFHRV9TSVpFIDw8IGdldF9vcmRlcl9mcm9tX2J5dGVzKGl2cnNfYmRm
X2VudHJpZXMgKgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJWkUpOworICAgIHVuc2lnbmVkIGludCBuciA9IFJPVU5E
VVAoaXZyc19iZGZfZW50cmllcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0Vf
U0laRSAvIElPTU1VX0RFVl9UQUJMRV9FTlRSWV9TSVpFKTsKKworICAgIC8qCisgICAgICogQU1E
IFNOLTMwNjAgLyBDVkUtMjAyNC0yMTk2MworICAgICAqCisgICAgICogU29tZSBJT01NVXMgcmVh
ZCBiZXlvbmQgdGhlIHByb2dyYW1tZWQgRGV2aWNlIFRhYmxlIGxpbWl0LiAgV2hlbiB0aGUKKyAg
ICAgKiB0b3RhbCBzaXplIG9mIHRoZSBEZXZpY2UgVGFibGUgaXMgbGVzcyB0aGFuIDJNIChjb3Zl
cmluZyBhbGwgMl4xNiBCREZzCisgICAgICogaW4gYSBzaW5nbGUgUENJIFNlZ21lbnQpLCB3ZSBt
dXN0IGFsbG9jYXRlIG9uZSBleHRyYSBlbnRyeSB0byBhdm9pZCB0aGUKKyAgICAgKiBJT01NVSBy
ZWFkaW5nIHVucmVsYXRlZCBtZW1vcnkgYW5kIHRyZWF0aW5nIGl0IGFzIGEgdmFsaWQgZW50cnku
CisgICAgICovCisgICAgaWYgKCBuciA8ICgxVSA8PCAxNikgKQorICAgICAgICArK25yOworCisg
ICAgcmV0dXJuIFBBR0VfU0laRSA8PCBnZXRfb3JkZXJfZnJvbV9ieXRlcyhuciAqIElPTU1VX0RF
Vl9UQUJMRV9FTlRSWV9TSVpFKTsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IGRlYWxsb2NhdGVf
YnVmZmVyKHZvaWQgKmJ1ZiwgdW5zaWduZWQgbG9uZyBzeikKQEAgLTEwODksOSArMTEwMyw4IEBA
IHN0YXRpYyBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0X29uZShzdHJ1Y3QgYW1kX2lvbW11ICpp
b21tdSwgYm9vbCBpbnRyKQogICAgIGlmICggIUlWUlNfTUFQUElOR1NfREVWVEFCKGl2cnNfbWFw
cGluZ3MpICkKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAKLSAgICBpb21tdS0+ZGV2X3RhYmxl
LmFsbG9jX3NpemUgPSBkdF9hbGxvY19zaXplKCk7Ci0gICAgaW9tbXUtPmRldl90YWJsZS5lbnRy
aWVzID0gaW9tbXUtPmRldl90YWJsZS5hbGxvY19zaXplIC8KLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBJT01NVV9ERVZfVEFCTEVfRU5UUllfU0laRTsKKyAgICAvKiBUaGVyZSBtYXkg
YmUgdHJhaWxpbmcgInNjcmF0Y2giIGVudHJpZXMsIHdoaWNoIHNob3VsZCBub3QgYmUgdXNlZC4g
Ki8KKyAgICBpb21tdS0+ZGV2X3RhYmxlLmVudHJpZXMgPSBpdnJzX2JkZl9lbnRyaWVzOwogICAg
IGlvbW11LT5kZXZfdGFibGUuYnVmZmVyID0gSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBw
aW5ncyk7CiAKICAgICBlbmFibGVfaW9tbXUoaW9tbXUpOwpAQCAtMTI1NSwxMSArMTI2OCwyMSBA
QCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBhbWRfaW9tbXVfc2V0dXBfZGV2aWNlX3RhYmxl
KAogICAgICAgICAgKiBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfQUJPUlRFRCBhbGwgYmVp
bmcgemVybywgYW5kIHVzIGFsc28KICAgICAgICAgICogd2FudGluZyBhdCBsZWFzdCBUViwgR1Ys
IEksIGFuZCBFWCBzZXQgdG8gZmFsc2UuCiAgICAgICAgICAqLwotICAgICAgICBmb3IgKCBiZGYg
PSAwLCBzaXplIC89IHNpemVvZigqZHQpOyBiZGYgPCBzaXplOyArK2JkZiApCisgICAgICAgIGZv
ciAoIGJkZiA9IDA7IGJkZiA8IGl2cnNfYmRmX2VudHJpZXM7ICsrYmRmICkKICAgICAgICAgICAg
IGR0W2JkZl0gPSAoc3RydWN0IGFtZF9pb21tdV9kdGUpewogICAgICAgICAgICAgICAgICAgICAg
ICAgICAudiA9IHRydWUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IGlvbW11X2lu
dHJlbWFwLAogICAgICAgICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAgLyoKKyAgICAgICAg
ICogUHJlZmlsbCBleHRyYSBEVEVzIHN1Y2ggdGhhdCB0aGVpciB1c2Ugd2lsbCByYWlzZSBhbgor
ICAgICAgICAgKiBJTExFR0FMX0RFVl9UQUJMRV9FTlRSWSBldmVudC4KKyAgICAgICAgICovCisg
ICAgICAgIGZvciAoIHNpemUgLz0gc2l6ZW9mKCpkdCk7IGJkZiA8IHNpemU7ICsrYmRmICkKKyAg
ICAgICAgICAgIGR0W2JkZl0gPSAoc3RydWN0IGFtZF9pb21tdV9kdGUpeworICAgICAgICAgICAg
ICAgICAgICAgICAgICAudiA9IHRydWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgIC5yc3Zk
ID0gMywgLyogQXMgcGVyIEFNRCByZWNvbW1lbmRhdGlvbi4gKi8KKyAgICAgICAgICAgICAgICAg
ICAgICB9OwogICAgIH0KIAogICAgIC8qIEFkZCBkZXZpY2UgdGFibGUgZW50cmllcyAqLwo=

--=separator
Content-Type: application/octet-stream; name="xsa524-fix.patch"
Content-Disposition: attachment; filename="xsa524-fix.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBBTUQvSU9NTVU6
IGNvcnJlY3QgZGV2dGFiIHNpemUgd3JpdGluZwoKVGhlIGZpeCBmb3IgWFNBLTUyNCBpbmFkdmVy
dGVudGx5IGNvbnZlcnRlZCBhIHBhZ2UtZ3JhbnVsYXIgdmFsdWUgdG8gYQpieXRlLWdyYW51bGFy
IG9uZSwgdGh1cyBhbHdheXMgc2V0dGluZyBtYXhpbXVtIHNpemUgKDJNYikgd2l0aG91dCB0aGUK
dGFibGUgYWx3YXlzIGJlaW5nIHRoYXQgc2l6ZS4KCkZpeGVzOiBkNzM3ODkzMmIxZmMgKCJBTUQv
SU9NTVU6IGFsbG9jYXRlIChhdCBsZWFzdCkgb25lIHNwYXJlIGRldmljZSB0YWJsZSBlbnRyeSIp
ClJlcG9ydGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGFtZC5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMKQEAgLTgwLDkgKzgwLDggQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfaW9t
bXVfZGV2X3RhYmxlX2luXwogCiAgICAgZW50cnkgPSAwOwogICAgIGlvbW11X3NldF9hZGRyX2xv
X3RvX3JlZygmZW50cnksIGFkZHJfbG8gPj4gUEFHRV9TSElGVCk7Ci0gICAgc2V0X2ZpZWxkX2lu
X3JlZ191MzIoUk9VTkRVUChpb21tdS0+ZGV2X3RhYmxlLmVudHJpZXMgKgotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJWkUsCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUpIC0gMSwKKyAgICBzZXRfZmllbGRf
aW5fcmVnX3UzMihQRk5fVVAoaW9tbXUtPmRldl90YWJsZS5lbnRyaWVzICoKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJWkUpIC0gMSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbnRyeSwgSU9NTVVfREVWX1RBQkxFX1NJWkVfTUFTSywK
ICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9ERVZfVEFCTEVfU0laRV9TSElGVCwgJmVu
dHJ5KTsKICAgICB3cml0ZWwoZW50cnksIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9ERVZfVEFC
TEVfQkFTRV9MT1dfT0ZGU0VUKTsK

--=separator--

