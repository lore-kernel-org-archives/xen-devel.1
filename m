From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v2 13/45] ARM: vPL011: Use the VGIC's level
	triggered IRQs handling if available
Date: Thu, 15 Mar 2018 20:30:18 +0000
Message-ID: <20180315203050.19791-14-andre.przywara@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jxrf=gf=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewZWz-0003DV-93
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:31:21 +0000
Received: by mail-wm0-x241.google.com with SMTP id h76so12875029wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 13:31:20 -0700 (PDT)
In-Reply-To: <20180315203050.19791-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGVtdWxhdGVkIEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBz
ZW1hbnRpY3MsCmhvd2V2ZXIgdGhlIGN1cnJlbnQgVkdJQyBjYW4gb25seSBoYW5kbGUgZWRnZSB0
cmlnZ2VyZWQgSVJRcywgcmVhbGx5LgpEaXNhYmxlIHRoZSBleGlzdGluZyB3b3JrYXJvdW5kIGZv
ciB0aGlzIHByb2JsZW0gaW4gY2FzZSB3ZSBoYXZlIHRoZQpuZXcgVkdJQyBpbiBwbGFjZSwgd2hp
Y2ggY2FuIHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KQ2hhbmdl
bG9nIHYxIC4uLiB2MjoKLSByZW1vdmUgdW5uZWVkZWQgIiEhIgoKIHhlbi9hcmNoL2FybS92cGww
MTEuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS92cGwwMTEuYyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwppbmRleCA1
ZGNmNGJlYzE4Li5hMjgxZWFiZDdlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMK
KysrIGIveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCkBAIC01NCw2ICs1NCw3IEBAIHN0YXRpYyB2b2lk
IHZwbDAxMV91cGRhdGVfaW50ZXJydXB0X3N0YXR1cyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAq
LwogICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmdnBsMDExLT5sb2NrKSk7CiAKKyNpZm5kZWYg
Q09ORklHX05FV19WR0lDCiAgICAgLyoKICAgICAgKiBUT0RPOiBQTDAxMSBpbnRlcnJ1cHRzIGFy
ZSBsZXZlbCB0cmlnZ2VyZWQgd2hpY2ggbWVhbnMKICAgICAgKiB0aGF0IGludGVycnVwdCBuZWVk
cyB0byBiZSBzZXQvY2xlYXIgaW5zdGVhZCBvZiBiZWluZwpAQCAtNzEsNiArNzIsOSBAQCBzdGF0
aWMgdm9pZCB2cGwwMTFfdXBkYXRlX2ludGVycnVwdF9zdGF0dXMoc3RydWN0IGRvbWFpbiAqZCkK
ICAgICAgICAgdmdpY19pbmplY3RfaXJxKGQsIE5VTEwsIEdVRVNUX1ZQTDAxMV9TUEksIHRydWUp
OwogCiAgICAgdnBsMDExLT5zaGFkb3dfdWFydG1pcyA9IHVhcnRtaXM7CisjZWxzZQorICAgIHZn
aWNfaW5qZWN0X2lycShkLCBOVUxMLCBHVUVTVF9WUEwwMTFfU1BJLCB1YXJ0bWlzKTsKKyNlbmRp
ZgogfQogCiBzdGF0aWMgdWludDhfdCB2cGwwMTFfcmVhZF9kYXRhKHN0cnVjdCBkb21haW4gKmQp
Ci0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
