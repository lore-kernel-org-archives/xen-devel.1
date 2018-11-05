From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/7] x86: make traps.c build with
 !CONFIG_PV
Date: Mon, 5 Nov 2018 14:07:03 +0000
Message-ID: <f7340186-18e1-4aea-d515-3f1a24737547@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <cdcdb5e85a0681a000df6124cbd0ff0403e05fe3.1541174103.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y45x=nq=citrix.com=prvs=8403a2554=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gJfZl-000239-Sw
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 14:09:57 +0000
In-Reply-To: <cdcdb5e85a0681a000df6124cbd0ff0403e05fe3.1541174103.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTU6NTUsIFdlaSBMaXUgd3JvdGU6Cj4gQEAgLTIwNzgsNiArMjA5Miw3IEBA
IHZvaWQgYWN0aXZhdGVfZGVidWdyZWdzKGNvbnN0IHN0cnVjdCB2Y3B1ICpjdXJyKQo+ICAgICAg
fQo+ICB9Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1BWCj4gIC8qCj4gICAqIFVzZWQgYnkgaHlwZXJj
YWxscyBhbmQgdGhlIGVtdWxhdG9yLgo+ICAgKiAgLUVOT0RFViA9PiAjVUQKPiBAQCAtMjE5Myw2
ICsyMjA4LDcgQEAgbG9uZyBzZXRfZGVidWdyZWcoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4gIAo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAr
I2VuZGlmICAvKiBDT05GSUdfUFYgKi8KCnNldF9kZWJ1Z3JlZygpIGRvZXNuJ3QgcmVhbGx5IGJl
bG9uZyBoZXJlLsKgIEhvdyBhYm91dCBtb3ZpbmcgaXQgdG8KcHYvbWlzYy1oeXBlcmNhbGxzLmMg
PwoKRWl0aGVyIHdheSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
