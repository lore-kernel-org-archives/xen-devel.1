From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range_buggy
Date: Mon, 14 Jan 2019 18:31:12 -0500
Message-ID: <8b0e0809-8e66-079d-1186-90b3f2df7a38__3711.501035332$1547508616$gmane$org@oracle.com>
References: <20190111151326.GA2853@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bjvR=PW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gjBhg-0000Me-JB
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 23:31:36 +0000
In-Reply-To: <20190111151326.GA2853@jordon-HP-15-Notebook-PC>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, jgross@suse.com, linux@armlinux.org.uk, robin.murphy@arm.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

T24gMS8xMS8xOSAxMDoxMyBBTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBDb252ZXJ0IHRv
IHVzZSB2bV9pbnNlcnRfcmFuZ2VfYnVnZ3koKSB0byBtYXAgcmFuZ2Ugb2Yga2VybmVsCj4gbWVt
b3J5IHRvIHVzZXIgdm1hLgo+Cj4gVGhpcyBkcml2ZXIgaGFzIGlnbm9yZWQgdm1fcGdvZmYuIFdl
IGNvdWxkIGxhdGVyICJmaXgiIHRoZXNlIGRyaXZlcnMKPiB0byBiZWhhdmUgYWNjb3JkaW5nIHRv
IHRoZSBub3JtYWwgdm1fcGdvZmYgb2Zmc2V0dGluZyBzaW1wbHkgYnkKPiByZW1vdmluZyB0aGUg
X2J1Z2d5IHN1ZmZpeCBvbiB0aGUgZnVuY3Rpb24gbmFtZSBhbmQgaWYgdGhhdCBjYXVzZXMKPiBy
ZWdyZXNzaW9ucywgaXQgZ2l2ZXMgdXMgYW4gZWFzeSB3YXkgdG8gcmV2ZXJ0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMgfCA4ICsrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4vcHJpdmNtZC1idWYuYyBiL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKPiBpbmRleCBk
ZTAxYTZkLi5hOWQ3ZTk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMK
PiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jCj4gQEAgLTE2NiwxMiArMTY2LDggQEAg
c3RhdGljIGludCBwcml2Y21kX2J1Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCWlmICh2bWFfcHJpdi0+bl9wYWdlcyAhPSBjb3VudCkKPiAg
CQlyZXQgPSAtRU5PTUVNOwo+ICAJZWxzZQo+IC0JCWZvciAoaSA9IDA7IGkgPCB2bWFfcHJpdi0+
bl9wYWdlczsgaSsrKSB7Cj4gLQkJCXJldCA9IHZtX2luc2VydF9wYWdlKHZtYSwgdm1hLT52bV9z
dGFydCArIGkgKiBQQUdFX1NJWkUsCj4gLQkJCQkJICAgICB2bWFfcHJpdi0+cGFnZXNbaV0pOwo+
IC0JCQlpZiAocmV0KQo+IC0JCQkJYnJlYWs7Cj4gLQkJfQo+ICsJCXJldCA9IHZtX2luc2VydF9y
YW5nZV9idWdneSh2bWEsIHZtYV9wcml2LT5wYWdlcywKPiArCQkJCQkJdm1hX3ByaXYtPm5fcGFn
ZXMpOwoKVGhpcyBjYW4gdXNlIHRoZSBub24tYnVnZ3kgdmVyc2lvbi4gQnV0IHNpbmNlIHRoZSBv
cmlnaW5hbCBjb2RlIHdhcwppbmRlZWQgYnVnZ3kgaW4gdGhpcyByZXNwZWN0IEkgY2FuIHN1Ym1p
dCB0aGlzIGFzIGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIuCgpTbwoKUmV2aWV3ZWQtYnk6IEJvcmlz
IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKPiAgCj4gIAlpZiAocmV0
KQo+ICAJCXByaXZjbWRfYnVmX3ZtYXByaXZfZnJlZSh2bWFfcHJpdik7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
