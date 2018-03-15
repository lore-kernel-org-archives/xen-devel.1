From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v5 03/16] xen/arm: mm: Use gaddr_to_gfn
 rather than _gfn(paddr_to_pfn(...))
Date: Thu, 15 Mar 2018 16:15:26 +0000
Message-ID: <CAFLBxZZ+vvqF=t=uJ63MQvSmeUJuTc_zg68GYGAY=nyvU4hJLw@mail.gmail.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgNjoxOSBQTSwgIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g
d3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPgo+IFRo
ZSBjb25zdHJ1Y3Rpb24gX2dmbihwYWRkcl90b19wZm4oLi4uKSkgY2FuIGJlIHNpbXBsaWZpZWQg
YnkgdXNpbmcKPiBnYWRkcl90b19nZm4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKTm90IHN1cmUgaWYgInNpbXBsaWZpZWQiIGlzIHRoZSBy
aWdodCB3b3JkIGhlcmUgKGFuZCBpbiB0aGUgcHJldmlvdXMKcGF0Y2gpOyBzaW1wbGlmaWVkIGlt
cGxpZXMgZmV3ZXIgc3RlcHMgaW4gdGhlIGNhbGN1bGF0aW9uLCBidXQgaXQKbG9va3MgbGlrZSB0
aGUgc3RlcHMgc28gZmFyIGFyZSBpZGVudGljYWwuICBVc2luZyBhIG1hY3JvIHJhdGhlciB0aGFu
CmhhbmQtY29kaW5nIHN0dWZmIGlzIGNsZWFuZXIgYW5kIG1vcmUgbWFpbnRhaW5hYmxlOyBkb24n
dCB0aGluayBpdApyZWFsbHkgbmVlZHMgdG8gYmUganVzdGlmaWVkLgoKSW4gYW55IGNhc2U6CgpS
ZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
