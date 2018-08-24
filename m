From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v2 6/6] xen/arm: introduce NO_PLAT
Date: Fri, 24 Aug 2018 09:35:51 +0100
Message-ID: <b577990a-65a3-051f-0631-42d3e3c22aa7@linaro.org>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <1535067220-16825-6-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pfei=lh=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ft7ZS-0004x0-Lu
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 08:35:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id u12-v6so5503666wrr.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 01:35:53 -0700 (PDT)
In-Reply-To: <1535067220-16825-6-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wOC8xOCAwMDozMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEFkZCBh
IEtjb25maWcgb3B0aW9uIHRvIHNlbGVjdCBubyBzcGVjaWZpYyBwbGF0Zm9ybSBzdXBwb3J0LgoK
VGhhdCdzIG5vdCBlbnRpcmVseSB0cnVlLiBBZnRlciB0aGlzIHNlcmllcyBhcHBsaWVkLCB0aGVy
ZSBhcmUgc3RpbGwgCnNvbWUgb2JqLXkgcHJlc2VudCBpbiB0aGUgTWFrZWZpbGUuCgpDaGVlcnMs
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54
LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyB8IDUgKysrKysK
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29u
ZmlnCj4gaW5kZXggNjQ4NmJmNi4uNGM4YjIyNSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL0tjb25maWcKPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcK
PiBAQCAtNjcsNiArNjcsMTEgQEAgY29uZmlnIE9NQVA1Cj4gICAJLS0taGVscC0tLQo+ICAgCUVu
YWJsZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMgZm9yIFRJIE9NQVA1IGJhc2VkIHBsYXRmb3Jt
cy4KPiAgIAo+ICtjb25maWcgTk9fUExBVAo+ICsJYm9vbCAiTm8gUGxhdGZvcm1zIgo+ICsJLS0t
aGVscC0tLQo+ICsJRG8gbm90IGVuYWJsZSBzcGVjaWZpYyBzdXBwb3J0IGZvciBhbnkgcGxhdGZv
cm0uCj4gKwo+ICAgZW5kY2hvaWNlCj4gICAKPiAgIGNvbmZpZyBBTEw2NF9QTEFUCj4gCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
