From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH] remove dead code in allocate_memory
Date: Mon, 15 Jan 2018 18:06:54 +0000
Message-ID: <7f6cec19-7883-5494-0809-f547fc4a3ae3@linaro.org>
References: <alpine.DEB.2.10.1801121619160.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=92s9=ek=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebAkK-0003eR-Ib
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 19:48:40 +0000
Received: by mail-wr0-x243.google.com with SMTP id e41so12575579wre.9
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 11:48:38 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1801121619160.5767@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDAxLzEzLzIwMTggMTI6MjkgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBsb3dtZW0gaXMgdW5jaGFuZ2VkIHVudGlsIGFmdGVyIHRoaXMgbG9vcCwgdGhlcmUg
aXMgbm8gcG9pbnQgaW4gdGVzdGluZwo+IGZvciBpdHMgdmFsdWUuIE1vcmVvdmVyLCBDb3Zlcml0
eSBjb21wbGFpbnMgYWJvdXQgZGVhZCBjb2RlLgo+IAo+IFJlbW92ZSB0aGUgbG93bWVtIHRlc3Qg
aW4gdGhlIGZpcnN0IGxvb3AuCgpXaGlsZSBJIHVuZGVyc3RhbmQgQ292ZXJpdHkgY29tcGxhaW5z
IGFib3V0IGRlYWQgY29kZSwgaW4gdGhhdCAKcGFydGljdWxhciBjYXNlIEkgZG9uJ3QgdGhpbmsg
cmVtb3ZpbmcgdGhpcyB0ZXN0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KCkl0IGlzIHZlcnkg
ZWFzeSB0byB0b2dnbGUgbG93bWVuIHRvIGZhbHNlIGluIHRoZSBkZWNsYXJhdGlvbiBhcyB0aGlz
IHdhcyAKZG9uZSBiZWZvcmUgYWI1YjAwYSAieGVuL2FybTogZG9tYWluX2J1aWxkOiBhbGxvY2F0
ZSBsb3dtZW0gZm9yIGRvbTAgYXMgCm11Y2ggYXMgcG9zc2libGUiLiBPbmUgZXhhbXBsZSB3b3Vs
ZCBiZSBrZWVwIGxvdyBtZW1vcnkgZnJlZSBmb3Igb3RoZXIgCnB1cnBvc2UuCgpDaGVlcnMsCgo+
IAo+IENJRDogMTM4MTgzMgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggMTU1Yzk1Mi4u
ZmE1ODkwNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMjc3LDcgKzI3Nyw3IEBAIHN0YXRp
YyB2b2lkIGFsbG9jYXRlX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2lu
Zm8gKmtpbmZvKQo+ICAgICAgICAqLwo+ICAgICAgIHdoaWxlICggb3JkZXIgPj0gbWluX2xvd19v
cmRlciApCj4gICAgICAgewo+IC0gICAgICAgIGZvciAoIGJpdHMgPSBvcmRlciA7IGJpdHMgPD0g
KGxvd21lbSA/IDMyIDogUEFERFJfQklUUyk7IGJpdHMrKyApCj4gKyAgICAgICAgZm9yICggYml0
cyA9IG9yZGVyIDsgYml0cyA8PSAzMjsgYml0cysrICkKPiAgICAgICAgICAgewo+ICAgICAgICAg
ICAgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2VzKGQsIG9yZGVyLCBNRU1GX2JpdHMoYml0cykp
Owo+ICAgICAgICAgICAgICAgaWYgKCBwZyAhPSBOVUxMICkKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
