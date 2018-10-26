From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Fri, 26 Oct 2018 16:54:28 +0800
Message-ID: <10301c25-5bbf-51b6-6cb2-77e30bcd9a99__38148.1883618564$1540543998$gmane$org@oracle.com>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
 <20181026074802.GA4768@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2car=ng=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gFxtA-0004Ju-CW
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 08:54:40 +0000
In-Reply-To: <20181026074802.GA4768@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

SGkgSm9lLAoKT24gMTAvMjYvMjAxOCAwMzo0OCBQTSwgQ2hyaXN0b3BoIEhlbHdpZyB3cm90ZToK
PiBPbiBUaHUsIE9jdCAyNSwgMjAxOCBhdCAxMTo1NjowMkFNIC0wNzAwLCBKb2UgSmluIHdyb3Rl
Ogo+PiBJIGp1c3QgZGlzY3Vzc2VkIHRoaXMgcGF0Y2ggd2l0aCBCb3JpcyBpbiBwcml2YXRlLCBo
aXMgb3BpbmlvbnMoQm9yaXMsCj4+IHBsZWFzZSBjb3JyZWN0IG1lIGlmIGFueSBtaXN1bmRlcnN0
b29kKSBhcmU6Cj4+Cj4+IDEuIFdpdGgvd2l0aG91dCB0aGUgY2hlY2ssIGJvdGggYXJlIGluY29y
cmVjdCwgaGUgdGhvdWdodCB3ZSBuZWVkIHRvCj4+ICAgIHByZXZlbnRlZCB1bmFsbG9jJ2QgZnJl
ZSBhdCBoZXJlLiAKPj4gMi4gT24gZnJlZWluZywgaWYgdXBwZXIgbGF5ZXIgYWxyZWFkeSBjaGVj
a2VkIHRoZSBtZW1vcnkgd2FzIERNQS1hYmxlLAo+PiAgICB0aGUgY2hlY2tpbmcgYXQgaGVyZSBk
b2VzIG5vdCBtYWtlIHNlbnNlLCB3ZSBjYW4gcmVtb3ZlIGFsbCBjaGVja3MuCj4+IDMuIHhlbl9j
cmVhdGVfY29udGlndW91c19yZWdpb24oKSBhbmQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdp
b24oKQo+PiAgICB0byBjb21lIGluIHBhaXJzLgo+Pgo+PiBGb3IgIzEgYW5kICMzLCBJIHRoaW5r
IHdlIG5lZWQgc29tZXRoaW5nIGFzc29jaWF0ZSBpdCwgbGlrZSBhIGxpc3QsIG9uCj4+IGFsbG9j
YXRpbmcsIGFkZCBhZGRyIHRvIGl0LCBvbiBmcmVlaW5nLCBjaGVjayBpZiBpbiB0aGUgbGlzdC4K
CklmIGRvbTAgKG9yIGFueSBkb21haW4pIGlzIGhhcHB5LCBhbHRob3VnaCBpdCBjb3VsZCB0cnkg
dG8gZXhjaGFuZ2UgYWxsIGl0cwpjb250aW51b3VzIGRtYSBwYWdlcyBiYWNrIHRvIHhlbiBoeXBl
cnZpc29yLiBGcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiBlYWNoCmRvbWFpbiwgdGhleSBhbHdheXMg
d291bGQgbGlrZSB0byBrZWVwIGFzIG11Y2ggY29udGludW91cyBkbWEgcGFnZSBhcyBwb3NzaWJs
ZS4KCkkgYW0gdGhpbmtpbmcgc29tZXRoaW5nIGRpZmZlcmVudC4gSWYgdGhlcmUgaXMgbWFsaWNp
b3VzIGRvbVUga2VlcCBleGNoYW5naW5nCm1lbW9yeSBhbmQgYWxsb2NhdGluZyBjb250aW51b3Vz
IHBhZ2VzIGZyb20geGVuIGh5cGVydmlzb3IsIHdpbGwgdGhlCmNvbnRpbnVvdXNseSBkbWEgcGFn
ZXMgYmUgdXNlZCB1cCAoc29ydCBvZiBEb1MgYXR0YWNrKT8KCkkgYW0gbm90IHN1cmUgaWYgdGhl
cmUgaXMgYW55dGhpbmcgaW4geGVuIGh5cGVydmlzb3IgdG8gcHJldmVudCBzdWNoIGJlaGF2aW9y
PwoKRG9uZ2xpIFpoYW5nCgo+IAo+IElzIHRoZXJlIGFueSB3YXkgdG8gZmlndXJlIG91dCBiYXNl
ZCBvbiBhbiBhZGRyZXNzIGlmIHRoZSBleGNoYW5nZQo+IG9wZXJhdGlvbiBoYXBwZW5lZD8KPiAK
Pj4gRm9yICMyLCBJJ20gd2FzIG5vdCBmb3VuZCBhbnl3aGVyZSB2YWxpZGF0ZWQgdGhlIGFkZHJl
c3Mgb24gCj4+IGRtYV9mcmVlX2NvaGVyZW50KCkgY2FsbHBhdGgsIG5vdCBqdXN0IHhlbi1zd2lv
dGxiLgo+IAo+IEF0IGxlYXN0IGZvciBzaW1wbGUgZGlyZWN0IG1hcHBpbmdzIHRoZXJlIGlzIG5v
IGVhc3kgd2F5IHRvIHZlcmlmeSB0aGF0Cj4gd2l0aG91dCBrZWVwaW5nIGEgbGlzdCwgYW5kIGZv
ciBzb21lIG9mIHRoZSBvcHMgdGhhdCBkbyB2bWFwIGxpa2UKPiBvcGVyYXRpb25zIHdlIGhhdmUg
YmFzaWMgc2FudGl5IGNoZWNrcywgYnV0IG5vdGhpbmcgdGhhdCByZWFsbHkgY2F0Y2hlcwo+IGEg
d3JvbmcgZnJlZS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
