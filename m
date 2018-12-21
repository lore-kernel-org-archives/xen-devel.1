From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] pvcalls-front: don't return error when the
 ring is full
Date: Fri, 21 Dec 2018 15:06:32 -0800
Message-ID: <1545433593-18874-4-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsL-00006X-GB
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

V2hlbiB0aGUgcmluZyBpcyBmdWxsLCBzaXplID09IGFycmF5X3NpemUuIEl0IGlzIG5vdCBhbiBl
cnJvciBjb25kaXRpb24sCnNvIHNpbXBseSByZXR1cm4gMCBpbnN0ZWFkIG9mIGFuIGVycm9yLgoK
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgot
LS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVu
L3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwppbmRleCAwMTU4
ODU4Li4xYTg5M2ExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKKysr
IGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCkBAIC00NzUsOCArNDc1LDEwIEBAIHN0YXRp
YyBpbnQgX193cml0ZV9yaW5nKHN0cnVjdCBwdmNhbGxzX2RhdGFfaW50ZiAqaW50ZiwKIAl2aXJ0
X21iKCk7CiAKIAlzaXplID0gcHZjYWxsc19xdWV1ZWQocHJvZCwgY29ucywgYXJyYXlfc2l6ZSk7
Ci0JaWYgKHNpemUgPj0gYXJyYXlfc2l6ZSkKKwlpZiAoc2l6ZSA+IGFycmF5X3NpemUpCiAJCXJl
dHVybiAtRUlOVkFMOworCWlmIChzaXplID09IGFycmF5X3NpemUpCisJCXJldHVybiAwOwogCWlm
IChsZW4gPiBhcnJheV9zaXplIC0gc2l6ZSkKIAkJbGVuID0gYXJyYXlfc2l6ZSAtIHNpemU7CiAK
LS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
