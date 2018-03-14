From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 11/12] hvmloader: use libacpi to build
	MCFG table
Date: Thu, 15 Mar 2018 03:48:27 +1000
Message-ID: <20180315034827.0000786e@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <d9da7e43b56986b7aca9c84ee93e41587f9d5ac1.1520867741.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/0apbG0V_.zAm=ueqKjBOhiU"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dmrx=ge=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1ewAW2-0002hA-4l
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 17:48:42 +0000
Received: by mail-lf0-x241.google.com with SMTP id y2-v6so3983013lfc.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 10:48:40 -0700 (PDT)
In-Reply-To: <d9da7e43b56986b7aca9c84ee93e41587f9d5ac1.1520867741.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--MP_/0apbG0V_.zAm=ueqKjBOhiU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, 13 Mar 2018 04:33:56 +1000
Alexey Gerasimenko <x1917x@gmail.com> wrote:

>This patch extends hvmloader_acpi_build_tables() with code which
>detects if MMCONFIG is available -- i.e. initialized and enabled
>(+we're running on Q35), obtains its base address and size and asks
>libacpi to build MCFG table for it via setting the flag ACPI_HAS_MCFG
>in a manner similar to other optional ACPI tables building.
>
>Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
>---
> tools/firmware/hvmloader/util.c | 70
> +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 70
> insertions(+)

Looks like I missed the patch for reserving MMCONFIG area in E820 map,
it is required for Linux guests (otherwise MMCONFIG info will be
rejected by linux kernel). Windows guests allow to use MMCONFIG without
a corresponding E820 entry.

Following lines need to be added to /hvmloader/e820.c:

+    /* mark MMCONFIG area */
+    if ( is_mmconfig_used() )
+    {
+        e820[nr].addr = mmconfig_get_base();
+        e820[nr].size = mmconfig_get_size();
+        e820[nr].type = E820_RESERVED;
+        nr++;
+    }

The corresponding patch-file is attached, will include it in v2 patches.
--MP_/0apbG0V_.zAm=ueqKjBOhiU
Content-Type: application/octet-stream;
 name=hvmloader-mark-MMCONFIG-in-E820-map.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=hvmloader-mark-MMCONFIG-in-E820-map.patch

RnJvbSBjMTYxODZlMGMxYWQzODgzNjJmNjExMzZiOGRhMmUwMmU3NmQxODQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4ZXkgR2VyYXNpbWVua28gPHgxOTE3eEBnbWFpbC5jb20+
CkRhdGU6IFRodSwgMTUgTWFyIDIwMTggMDM6MDY6MzkgKzEwMDAKU3ViamVjdDogW1BBVENIXSBo
dm1sb2FkZXI6IG1hcmsgTU1DT05GSUcgaW4gRTgyMCBtYXAKCi0tLQogdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL2U4MjAuYyB8IDkgKysrKysrKysrCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIv
dXRpbC5jIHwgNiArKystLS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmggfCA1ICsr
KysrCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2U4MjAuYyBiL3Rvb2xzL2Zpcm13
YXJlL2h2bWxvYWRlci9lODIwLmMKaW5kZXggNGQxYzk1NWEwMi4uOWNmZTg2ZTc4ZSAxMDA2NDQK
LS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2U4MjAuYworKysgYi90b29scy9maXJtd2Fy
ZS9odm1sb2FkZXIvZTgyMC5jCkBAIC0yMzMsNiArMjMzLDE1IEBAIGludCBidWlsZF9lODIwX3Rh
YmxlKHN0cnVjdCBlODIwZW50cnkgKmU4MjAsCiAgICAgICAgIG5yKys7CiAgICAgfQogCisgICAg
LyogbWFyayBNTUNPTkZJRyBhcmVhICovCisgICAgaWYgKCBpc19tbWNvbmZpZ191c2VkKCkgKQor
ICAgIHsKKyAgICAgICAgZTgyMFtucl0uYWRkciA9IG1tY29uZmlnX2dldF9iYXNlKCk7CisgICAg
ICAgIGU4MjBbbnJdLnNpemUgPSBtbWNvbmZpZ19nZXRfc2l6ZSgpOworICAgICAgICBlODIwW25y
XS50eXBlID0gRTgyMF9SRVNFUlZFRDsKKyAgICAgICAgbnIrKzsKKyAgICB9CisKICAgICAvKiBM
b3cgUkFNIGdvZXMgaGVyZS4gUmVzZXJ2ZSBzcGFjZSBmb3Igc3BlY2lhbCBwYWdlcy4gKi8KICAg
ICBCVUdfT04obG93X21lbV9lbmQgPCBNQigyKSk7CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13
YXJlL2h2bWxvYWRlci91dGlsLmMgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jCmlu
ZGV4IGM2ZmM4MWQ1MmEuLmEzMmFkYTk2MTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci91dGlsLmMKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuYwpAQCAt
Nzg4LDcgKzc4OCw3IEBAIGludCBnZXRfcGNfbWFjaGluZV90eXBlKHZvaWQpCiAjZGVmaW5lIFBD
SUVYQkFSX0xFTkdUSF9CSVRTKHJlZykgICAoKChyZWcpID4+IDEpICYgMykKICNkZWZpbmUgUENJ
RVhCQVJFTiAgICAgICAgICAgICAgICAgIDEKIAotc3RhdGljIHVpbnQ2NF90IG1tY29uZmlnX2dl
dF9iYXNlKHZvaWQpCit1aW50NjRfdCBtbWNvbmZpZ19nZXRfYmFzZSh2b2lkKQogewogICAgIHVp
bnQ2NF90IGJhc2U7CiAgICAgdWludDMyX3QgcmVnID0gcGNpX3JlYWRsKFBDSV9NQ0hfREVWRk4s
IFBDSV9NQ0hfUENJRVhCQVIpOwpAQCAtODEzLDcgKzgxMyw3IEBAIHN0YXRpYyB1aW50NjRfdCBt
bWNvbmZpZ19nZXRfYmFzZSh2b2lkKQogICAgIHJldHVybiBiYXNlOwogfQogCi1zdGF0aWMgdWlu
dDMyX3QgbW1jb25maWdfZ2V0X3NpemUodm9pZCkKK3VpbnQzMl90IG1tY29uZmlnX2dldF9zaXpl
KHZvaWQpCiB7CiAgICAgdWludDMyX3QgcmVnID0gcGNpX3JlYWRsKFBDSV9NQ0hfREVWRk4sIFBD
SV9NQ0hfUENJRVhCQVIpOwogCkBAIC04MzQsNyArODM0LDcgQEAgc3RhdGljIHVpbnQzMl90IG1t
Y29uZmlnX2lzX2VuYWJsZWQodm9pZCkKICAgICByZXR1cm4gcGNpX3JlYWRsKFBDSV9NQ0hfREVW
Rk4sIFBDSV9NQ0hfUENJRVhCQVIpICYgUENJRVhCQVJFTjsKIH0KIAotc3RhdGljIGludCBpc19t
bWNvbmZpZ191c2VkKHZvaWQpCitpbnQgaXNfbW1jb25maWdfdXNlZCh2b2lkKQogewogICAgIGlm
IChnZXRfcGNfbWFjaGluZV90eXBlKCkgPT0gTUFDSElORV9UWVBFX1EzNSkKICAgICB7CmRpZmYg
LS1naXQgYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oIGIvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL3V0aWwuaAppbmRleCBmZDJkODg1Yzk2Li44OTJhYjM4OTdhIDEwMDY0NAotLS0g
YS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oCisrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci91dGlsLmgKQEAgLTI5Niw2ICsyOTYsMTEgQEAgc3RydWN0IGFjcGlfY29uZmlnOwog
dm9pZCBodm1sb2FkZXJfYWNwaV9idWlsZF90YWJsZXMoc3RydWN0IGFjcGlfY29uZmlnICpjb25m
aWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGh5c2lj
YWwpOwogCisvKiBNTUNPTkZJRy1yZWxhdGVkICovCit1aW50NjRfdCBtbWNvbmZpZ19nZXRfYmFz
ZSh2b2lkKTsKK3VpbnQzMl90IG1tY29uZmlnX2dldF9zaXplKHZvaWQpOworaW50IGlzX21tY29u
ZmlnX3VzZWQodm9pZCk7CisKICNlbmRpZiAvKiBfX0hWTUxPQURFUl9VVElMX0hfXyAqLwogCiAv
KgotLSAKMi4xMS4wCgo=

--MP_/0apbG0V_.zAm=ueqKjBOhiU
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--MP_/0apbG0V_.zAm=ueqKjBOhiU--
