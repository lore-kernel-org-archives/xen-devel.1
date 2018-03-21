From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 33/39] ARM: new VGIC: Add preliminary stub
 implementation
Date: Wed, 21 Mar 2018 16:32:29 +0000
Message-ID: <20180321163235.12529-34-andre.przywara@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ro=gl=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eygg1-0002us-9M
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:33:25 +0000
Received: by mail-wm0-x242.google.com with SMTP id t7so10892673wmh.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 09:33:24 -0700 (PDT)
In-Reply-To: <20180321163235.12529-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIEFSTSBhcmNoIGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0
aW9uIHRvIGltcGxlbWVudAp2Z2ljX2NsZWFyX3BlbmRpbmdfaXJxcygpLCBhbHRob3VnaCBpdCBp
cyBzdXNwZWN0ZWQgdGhhdCBpdCBpcyBhY3R1YWxseQpub3QgbmVjZXNzYXJ5LiBHbyB3aXRoIGEg
c3R1YiBmb3Igbm93IHRvIG1ha2UgdGhlIGxpbmtlciBoYXBweS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy92
Z2ljLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdp
Yy5jCmluZGV4IDIzYjhhYmZjNWUuLmI3MGZkYWFlY2IgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS92Z2ljL3ZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKQEAgLTc5MSw2ICs3
OTEsMTQgQEAgdm9pZCBnaWNfZHVtcF92Z2ljX2luZm8oc3RydWN0IHZjcHUgKnYpCiAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmdi0+YXJjaC52Z2ljLmFwX2xpc3RfbG9jaywgZmxhZ3MpOwog
fQogCit2b2lkIHZnaWNfY2xlYXJfcGVuZGluZ19pcnFzKHN0cnVjdCB2Y3B1ICp2KQoreworICAg
IC8qCisgICAgICogVE9ETzogSXQgaXMgdW5jbGVhciB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRo
aXMsIHNvIHdlIG1pZ2h0IGluc3RlYWQKKyAgICAgKiByZW1vdmUgaXQgb24gdGhlIGNhbGxlciBz
aXRlLgorICAgICAqLworfQorCiAvKioKICAqIGFyY2hfbW92ZV9pcnFzKCkgLSBtaWdyYXRlIHRo
ZSBwaHlzaWNhbCBhZmZpbml0eSBvZiBoYXJkd2FyZSBtYXBwZWQgdklSUXMKICAqIEB2OiAgdGhl
IHZDUFUsIGFscmVhZHkgYXNzaWduZWQgdG8gdGhlIG5ldyBwQ1BVCi0tIAoyLjE0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
