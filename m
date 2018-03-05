From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 51/57] ARM: new VGIC: Add preliminary stub
	implementation
Date: Mon,  5 Mar 2018 16:04:09 +0000
Message-ID: <20180305160415.16760-52-andre.przywara@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1essc0-0000ai-Mh
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:05:16 +0000
Received: by mail-wr0-x242.google.com with SMTP id f14so17816986wre.8
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:05:15 -0800 (PST)
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

VGhlIEFSTSBhcmNoIGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0
aW9uIHRvIGltcGxlbWVudAp2Z2ljX2NsZWFyX3BlbmRpbmdfaXJxcygpLCBhbHRob3VnaCBpdCBp
cyBzdXNwZWN0ZWQgdGhhdCBpdCBpcyBhY3R1YWxseQpub3QgbmVjZXNzYXJ5LiBHbyB3aXRoIGEg
c3R1YiBmb3Igbm93IHRvIG1ha2UgdGhlIGxpbmtlciBoYXBweS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KQ2hhbmdlbG9nIFJG
QyAuLi4gdjE6Ci0gc3BsaXQgb2ZmIGZyb20gZm9ybWVyIHBhdGNoLCBvdGhlcndpc2UgdW5jaGFu
Z2VkCgogeGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMu
YyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwppbmRleCA1ZTc2NzkyN2MwLi41ZDg0YTRkODFh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJt
L3ZnaWMvdmdpYy5jCkBAIC03OTAsNiArNzkwLDE0IEBAIHZvaWQgZ2ljX2R1bXBfdmdpY19pbmZv
KHN0cnVjdCB2Y3B1ICp2KQogICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnYtPmFyY2gudmdp
Yy5hcF9saXN0X2xvY2ssIGZsYWdzKTsKIH0KIAordm9pZCB2Z2ljX2NsZWFyX3BlbmRpbmdfaXJx
cyhzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICAvKgorICAgICAqIFRPRE86IEl0IGlzIHVuY2xlYXIg
d2hldGhlciB3ZSByZWFsbHkgbmVlZCB0aGlzLCBzbyB3ZSBtaWdodCBpbnN0ZWFkCisgICAgICog
cmVtb3ZlIGl0IG9uIHRoZSBjYWxsZXIgc2l0ZS4KKyAgICAgKi8KK30KKwogLyoqCiAgKiBhcmNo
X21vdmVfaXJxcygpIC0gbWlncmF0ZSB0aGUgcGh5c2ljYWwgYWZmaW5pdHkgb2YgaGFyZHdhcmUg
bWFwcGVkIHZJUlFzCiAgKiBAdjogIHRoZSB2Q1BVLCBhbHJlYWR5IGFzc2lnbmVkIHRvIHRoZSBu
ZXcgcENQVQotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
