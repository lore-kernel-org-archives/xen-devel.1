From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 43/49] ARM: new VGIC: Add preliminary stub
	implementations
Date: Fri,  9 Feb 2018 14:39:31 +0000
Message-ID: <20180209143937.28866-44-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qq-0001mu-B8
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:32 +0000
Received: by mail-wm0-x242.google.com with SMTP id r71so15884885wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:31 -0800 (PST)
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

VGhlIFhlbiBjb3JlIGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0
aW9uIHRvIGltcGxlbWVudAphcmNoX21vdmVfaXJxcygpLCB0byBtb3ZlIHRoZSBhZmZpbml0eSBv
ZiBhbiBoYXJkd2FyZSBtYXBwZWQgdmlydHVhbCBJUlEKdG8gYW5vdGhlciBjb3JlLiBJbiB0aGUg
bW9tZW50IHdlIGRvbid0IGltcGxlbWVudCB0aGlzCnBoeXNpY2FsLWZvbGxvdy12aXJ0dWFsIHJl
Z2ltZSBpbiBvdXIgbmV3IFZHSUMsIHNvIGp1c3QgcHJvdmlkZSBhbiBlbXB0eQpzdHViIGltcGxl
bWVudGF0aW9uIHRvIG1ha2UgdGhlIGxpbmtlciBoYXBweS4KU2ltaWxhcmlseSB2Z2ljX2NsZWFy
X3BlbmRpbmdfaXJxcygpIGlzIHJlcXVpcmVkIGJ5IHRoZSBBUk0gY29kZSwKYWx0aG91Z2ggaXQg
aXMgc3VzcGVjdGVkIHRoYXQgaXQgaXMgYWN0dWFsbHkgbm90IG5lY2Vzc2FyeS4gR28gd2l0aCBh
CnN0dWIgZm9yIG5vdy4KClNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5
d2FyYUBsaW5hcm8ub3JnPgotLS0KIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDEzICsrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCmluZGV4
IGQ5MTAyOGJkNDMuLjc3ZmE3NTYzMjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92Z2ljL3Zn
aWMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKQEAgLTc3MCw2ICs3NzAsMTkgQEAg
dm9pZCBnaWNfZHVtcF92Z2ljX2luZm8oc3RydWN0IHZjcHUgKnYpCiAgICAgICAgICAgICAgICBp
cnEtPmFjdGl2ZSA/ICIiIDogIm5vdCAiLCBpcnEtPmVuYWJsZWQgPyAiIiA6ICJub3QgIik7CiB9
CiAKK3ZvaWQgdmdpY19jbGVhcl9wZW5kaW5nX2lycXMoc3RydWN0IHZjcHUgKnYpCit7CisgICAg
LyoKKyAgICAgKiBUT0RPOiBJdCBpcyB1bmNsZWFyIHdoZXRoZXIgd2UgcmVhbGx5IG5lZWQgdGhp
cywgc28gd2UgbWlnaHQgaW5zdGVhZAorICAgICAqIHJlbW92ZSBpdCBvbiB0aGUgY2FsbGVyIHNp
dGUuCisgICAgICovCit9CisKK3ZvaWQgYXJjaF9tb3ZlX2lycXMoc3RydWN0IHZjcHUgKnYpCit7
CisgICAgLyogVE9ETzogaW1wbGVtZW50IHRoaXMgKD8pICovCit9CisKIHN0cnVjdCBpcnFfZGVz
YyAqdmdpY19nZXRfaHdfaXJxX2Rlc2Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2aXJx
KQogewotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
