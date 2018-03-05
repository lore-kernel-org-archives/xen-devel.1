From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 26/57] ARM: vPL011: Use the VGIC's level
	triggered IRQs handling if available
Date: Mon,  5 Mar 2018 16:03:44 +0000
Message-ID: <20180305160415.16760-27-andre.przywara@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1essba-0007jr-SS
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:04:50 +0000
Received: by mail-wm0-x241.google.com with SMTP id s206so13873376wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:04:49 -0800 (PST)
In-Reply-To: <20180305160415.16760-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGVtdWxhdGVkIEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBz
ZW1hbnRpY3MsCmhvd2V2ZXIgdGhlIGN1cnJlbnQgVkdJQyBjYW4gb25seSBoYW5kbGUgZWRnZSB0
cmlnZ2VyZWQgSVJRcywgcmVhbGx5LgpEaXNhYmxlIHRoZSBleGlzdGluZyB3b3JrYXJvdW5kIGZv
ciB0aGlzIHByb2JsZW0gaW4gY2FzZSB3ZSBoYXZlIHRoZQpuZXcgVkdJQyBpbiBwbGFjZSwgd2hp
Y2ggY2FuIHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KQ2hhbmdl
bG9nIFJGQyAuLi4gdjE6Ci0gbm8gY2hhbmdlcwoKIHhlbi9hcmNoL2FybS92cGwwMTEuYyB8IDQg
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92cGwwMTEuYyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwppbmRleCA1ZGNmNGJlYzE4
Li4xOTdlY2U4ODczIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMKKysrIGIveGVu
L2FyY2gvYXJtL3ZwbDAxMS5jCkBAIC01NCw2ICs1NCw3IEBAIHN0YXRpYyB2b2lkIHZwbDAxMV91
cGRhdGVfaW50ZXJydXB0X3N0YXR1cyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAqLwogICAgIEFT
U0VSVChzcGluX2lzX2xvY2tlZCgmdnBsMDExLT5sb2NrKSk7CiAKKyNpZm5kZWYgQ09ORklHX05F
V19WR0lDCiAgICAgLyoKICAgICAgKiBUT0RPOiBQTDAxMSBpbnRlcnJ1cHRzIGFyZSBsZXZlbCB0
cmlnZ2VyZWQgd2hpY2ggbWVhbnMKICAgICAgKiB0aGF0IGludGVycnVwdCBuZWVkcyB0byBiZSBz
ZXQvY2xlYXIgaW5zdGVhZCBvZiBiZWluZwpAQCAtNzEsNiArNzIsOSBAQCBzdGF0aWMgdm9pZCB2
cGwwMTFfdXBkYXRlX2ludGVycnVwdF9zdGF0dXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAg
dmdpY19pbmplY3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9TUEksIHRydWUpOwogCiAgICAg
dnBsMDExLT5zaGFkb3dfdWFydG1pcyA9IHVhcnRtaXM7CisjZWxzZQorICAgIHZnaWNfaW5qZWN0
X2lycShkLCBOVUxMLCBHVUVTVF9WUEwwMTFfU1BJLCAhIXVhcnRtaXMpOworI2VuZGlmCiB9CiAK
IHN0YXRpYyB1aW50OF90IHZwbDAxMV9yZWFkX2RhdGEoc3RydWN0IGRvbWFpbiAqZCkKLS0gCjIu
MTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
