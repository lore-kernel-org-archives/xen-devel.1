From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arm64/xen: fix xen-swiotlb cache flushing
Date: Sat, 19 Jan 2019 10:43:01 +0100
Message-ID: <20190119094301.GB21653__46174.7886649848$1547890957$gmane$org@lst.de>
References: <20190117171842.26173-1-hch@lst.de>
 <alpine.DEB.2.10.1901181612150.18561@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G6nO=P3=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gknA7-00010b-II
 for xen-devel@lists.xenproject.org; Sat, 19 Jan 2019 09:43:35 +0000
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1901181612150.18561@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, iommu@lists.linux-foundation.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Christoph Hellwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

W2Z1bGwgcXVvdGUgZGVsZXRlZCwgcGxlYXNlIHRha2UgYSBsaXR0bGUgbW9yZSBjYXJlIHdoZW4g
cXVvdGluZ10KCk9uIEZyaSwgSmFuIDE4LCAyMDE5IGF0IDA0OjQ0OjIzUE0gLTA4MDAsIFN0ZWZh
bm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ICAjaWZkZWYgQ09ORklHX1hFTgo+ID4gLQlpZiAoeGVu
X2luaXRpYWxfZG9tYWluKCkpIHsKPiA+IC0JCWRldi0+YXJjaGRhdGEuZGV2X2RtYV9vcHMgPSBk
ZXYtPmRtYV9vcHM7Cj4gPiArCWlmICh4ZW5faW5pdGlhbF9kb21haW4oKSkKPiA+ICAJCWRldi0+
ZG1hX29wcyA9IHhlbl9kbWFfb3BzOwo+ID4gLQl9Cj4gPiAgI2VuZGlmCj4gPiAgfQo+IAo+IFRo
aXMgaXMgYW4gb3B0aW9uYWwgc3VnZ2VzdGlvbiwgYnV0IGl0IHdvdWxkIGJlIG5pY2UgdG8gYWRk
IGEgY2hlY2sgb24KPiBkZXYtPmRtYV9vcHMgYmVpbmcgdW5zZXQgaGVyZSwgc29tZXRoaW5nIGxp
a2U6Cj4gCj4gICAjaWZkZWYgQ09ORklHX1hFTgo+ICAgaWYgKHhlbl9pbml0aWFsX2RvbWFpbigp
KSB7Cj4gICAgICAgaWYgKGRldi0+ZG1hX29wcyAhPSBOVUxMKQo+ICAgICAgICAgICB3YXJuaW5n
L2Vycm9yCj4gICAgICAgZGV2LT5kbWFfb3BzID0geGVuX2RtYV9vcHM7Cj4gICB9Cj4gCj4gRG9l
cyBpdCBtYWtlIHNlbnNlPwoKV2VsbCwgbm8gc3VjaCBjaGVjayBleGlzdGVkIGJlZm9yZSwgc28g
dGhpcyBwcm9iYWJseSBzaG91bGQgYmUgYQpzZXBhcmF0ZSBwYXRjaCBpZiB3ZSBjYXJlIGVub3Vn
aC4gIEkgaGF2ZSBhIHNlcmllcyBmb3IgNS4xIHBlbmRpbmcKdGhhdCBtb3ZlcyB0aGUgSU9NTVUg
aGFuZGxpbmcgdG8gdGhlIGNvbW1lbnQgY29kZSB3aGljaCB3aWxsIG1ha2UKdGhlIG9wcyBhc3Nn
aW5tZW50IGEgbG90IGNsZWFuZXIsIGFuZCBJIGd1ZXNzIEkgY291bGQgZm9sZCBzdWNoCmEgY2hl
Y2sgaW4gdGhhdC4gIERvaW5nIGl0IG5vdyB3aWxsIGp1c3QgY3JlYXRlIGNodXJuIGFzIGl0IHdv
dWxkCmhhdmUgdG8gZ2V0IHJld29ya2VkIGFueXdheQoKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKV2hlcmUgc2hvdWxkIHdlIHBpY2sg
dGhpcyB1cD8gIEkgY291bGQgcGljayBpdCB1cCB0aHJvdWdoIHRoZSBkbWEtbWFwcGluZwp0cmVl
IGdpdmVuIHRoYXQgaXMgd2hlcmUgdGhlIHByb2JsZW0gaXMgaW50cm9kdWNlZCwgYnV0IHRoZSBY
ZW4gb3IgYXJtNjQKdHJlZXMgd291bGQgYWxzbyBmaXQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
