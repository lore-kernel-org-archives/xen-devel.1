From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: cpuerrata: Remove percpu.h include
Date: Mon, 22 Jan 2018 10:16:18 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801221016070.6440@sstabellini-ThinkPad-X260>
References: <20180122143542.1207-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5djl=er=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1edgdu-0004x9-2Z
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 18:16:26 +0000
In-Reply-To: <20180122143542.1207-1-julien.grall@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMiBKYW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBpbmNsdWRlIHBl
cmNwdS5oIHdhcyBhZGRlZCBieSBtaXN0YWtlIGluIGNwdWVycmF0YS5oIChzZWUgY29tbWl0Cj4g
NGM0ZmRkYzE2NiAieGVuL2FybTY0OiBBZGQgc2tlbGV0b24gdG8gaGFyZGVuIHRoZSBicmFuY2gg
YWxpYXNpbmcKPiBhdHRhY2tzIikuIFNvIHJlbW92ZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9pbmNs
dWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmggfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaCBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmgKPiBpbmRleCAyM2ViZjM2N2VhLi43ZGU2
ODM2MWZmIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4gQEAgLTEsNyArMSw2IEBACj4g
ICNpZm5kZWYgX19BUk1fQ1BVRVJSQVRBX0hfXwo+ICAjZGVmaW5lIF9fQVJNX0NQVUVSUkFUQV9I
X18KPiAgCj4gLSNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4gICNpbmNsdWRlIDxhc20vY3B1ZmVh
dHVyZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gIAo+IC0tIAo+IDIuMTEu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
