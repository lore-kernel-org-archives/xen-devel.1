From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/5] pvcalls-front: properly allocate sk
Date: Fri, 21 Dec 2018 15:06:31 -0800
Message-ID: <1545433593-18874-3-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsL-00006W-HI
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 23:06:37 +0000
In-Reply-To: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

RG9uJ3QgdXNlIGt6YWxsb2M6IGl0IGVuZHMgdXAgbGVhdmluZyBzay0+c2tfcHJvdCBub3QgcHJv
cGVybHkKaW5pdGlhbGl6ZWQuIFVzZSBza19hbGxvYyBpbnN0ZWFkIGFuZCBkZWZpbmUgb3VyIG93
biB0cml2aWFsIHN0cnVjdApwcm90by4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFub3NAeGlsaW54LmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMg
fCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIGIvZHJpdmVycy94
ZW4vcHZjYWxscy1mcm9udC5jCmluZGV4IDRmM2Q2NjQuLjAxNTg4NTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250
LmMKQEAgLTMxLDYgKzMxLDEyIEBACiAjZGVmaW5lIFBWQ0FMTFNfTlJfUlNQX1BFUl9SSU5HIF9f
Q09OU1RfUklOR19TSVpFKHhlbl9wdmNhbGxzLCBYRU5fUEFHRV9TSVpFKQogI2RlZmluZSBQVkNB
TExTX0ZST05UX01BWF9TUElOIDUwMDAKIAorc3RhdGljIHN0cnVjdCBwcm90byBwdmNhbGxzX3By
b3RvID0geworCS5uYW1lCT0gIlBWQ2FsbHMiLAorCS5vd25lcgk9IFRISVNfTU9EVUxFLAorCS5v
Ympfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc29jayksCit9OworCiBzdHJ1Y3QgcHZjYWxsc19iZWRh
dGEgewogCXN0cnVjdCB4ZW5fcHZjYWxsc19mcm9udF9yaW5nIHJpbmc7CiAJZ3JhbnRfcmVmX3Qg
cmVmOwpAQCAtODM3LDcgKzg0Myw3IEBAIGludCBwdmNhbGxzX2Zyb250X2FjY2VwdChzdHJ1Y3Qg
c29ja2V0ICpzb2NrLCBzdHJ1Y3Qgc29ja2V0ICpuZXdzb2NrLCBpbnQgZmxhZ3MpCiAKIHJlY2Vp
dmVkOgogCW1hcDItPnNvY2sgPSBuZXdzb2NrOwotCW5ld3NvY2stPnNrID0ga3phbGxvYyhzaXpl
b2YoKm5ld3NvY2stPnNrKSwgR0ZQX0tFUk5FTCk7CisJbmV3c29jay0+c2sgPSBza19hbGxvYyhz
b2NrX25ldChzb2NrLT5zayksIFBGX0lORVQsIEdGUF9LRVJORUwsICZwdmNhbGxzX3Byb3RvLCBm
YWxzZSk7CiAJaWYgKCFuZXdzb2NrLT5zaykgewogCQliZWRhdGEtPnJzcFtyZXFfaWRdLnJlcV9p
ZCA9IFBWQ0FMTFNfSU5WQUxJRF9JRDsKIAkJbWFwLT5wYXNzaXZlLmluZmxpZ2h0X3JlcV9pZCA9
IFBWQ0FMTFNfSU5WQUxJRF9JRDsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
