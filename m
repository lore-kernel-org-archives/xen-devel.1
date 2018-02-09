From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 19/49] ARM: vPL011: Use the VGIC's level
	triggered IRQs handling if available
Date: Fri,  9 Feb 2018 14:39:07 +0000
Message-ID: <20180209143937.28866-20-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qR-0000Tw-7A
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:07 +0000
Received: by mail-wr0-x242.google.com with SMTP id k32so1971055wrk.4
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:06 -0800 (PST)
In-Reply-To: <20180209143937.28866-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGVtdWxhdGVkIEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBz
ZW1hbnRpY3MsCmhvd2V2ZXIgdGhlIGN1cnJlbnQgVkdJQyBjYW4gb25seSBoYW5kbGUgZWRnZSB0
cmlnZ2VyZWQgSVJRcywgcmVhbGx5LgpEaXNhYmxlIHRoZSBleGlzdGluZyB3b3JrYXJvdW5kIGZv
ciB0aGlzIHByb2JsZW0gaW4gY2FzZSB3ZSBoYXZlIHRoZQpuZXcgVkdJQyBpbiBwbGFjZSwgd2hp
Y2ggY2FuIHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KIHhlbi9h
cmNoL2FybS92cGwwMTEuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGwwMTEuYyBiL3hlbi9hcmNoL2FybS92cGww
MTEuYwppbmRleCA1ZGNmNGJlYzE4Li4xOTdlY2U4ODczIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vdnBsMDExLmMKKysrIGIveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCkBAIC01NCw2ICs1NCw3IEBA
IHN0YXRpYyB2b2lkIHZwbDAxMV91cGRhdGVfaW50ZXJydXB0X3N0YXR1cyhzdHJ1Y3QgZG9tYWlu
ICpkKQogICAgICAqLwogICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmdnBsMDExLT5sb2NrKSk7
CiAKKyNpZm5kZWYgQ09ORklHX05FV19WR0lDCiAgICAgLyoKICAgICAgKiBUT0RPOiBQTDAxMSBp
bnRlcnJ1cHRzIGFyZSBsZXZlbCB0cmlnZ2VyZWQgd2hpY2ggbWVhbnMKICAgICAgKiB0aGF0IGlu
dGVycnVwdCBuZWVkcyB0byBiZSBzZXQvY2xlYXIgaW5zdGVhZCBvZiBiZWluZwpAQCAtNzEsNiAr
NzIsOSBAQCBzdGF0aWMgdm9pZCB2cGwwMTFfdXBkYXRlX2ludGVycnVwdF9zdGF0dXMoc3RydWN0
IGRvbWFpbiAqZCkKICAgICAgICAgdmdpY19pbmplY3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAx
MV9TUEksIHRydWUpOwogCiAgICAgdnBsMDExLT5zaGFkb3dfdWFydG1pcyA9IHVhcnRtaXM7Cisj
ZWxzZQorICAgIHZnaWNfaW5qZWN0X2lycShkLCBOVUxMLCBHVUVTVF9WUEwwMTFfU1BJLCAhIXVh
cnRtaXMpOworI2VuZGlmCiB9CiAKIHN0YXRpYyB1aW50OF90IHZwbDAxMV9yZWFkX2RhdGEoc3Ry
dWN0IGRvbWFpbiAqZCkKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
