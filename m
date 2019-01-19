From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Fail to boot Dom0 on Xen Arm64 after "dma-mapping:
 bypass indirect calls for dma-direct"
Date: Fri, 18 Jan 2019 16:43:59 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901181552090.18561__16402.455388061$1547858580$gmane$org@sstabellini-ThinkPad-X260>
References: <d3e4984f-f996-c38f-3cf1-c16450ef7a99@arm.com>
 <20190116181904.GA6228@infradead.org>
 <1855c743-becd-fd52-50b9-86398f6cb985@arm.com>
 <20190117141157.GA5184@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P1ns=P3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gkejx-00008I-Jt
 for xen-devel@lists.xenproject.org; Sat, 19 Jan 2019 00:44:01 +0000
In-Reply-To: <20190117141157.GA5184@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org, Julien Grall <julien.grall@arm.com>, leo.yan@linaro.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNyBKYW4gMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBK
YW4gMTcsIDIwMTkgYXQgMTE6NDM6NDlBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4g
TG9va2luZyBhdCB0aGUgY2hhbmdlIGZvciBhcm02NCwgeW91IHdpbGwgYWx3YXlzIGNhbGwgZG1h
LWRpcmVjdCBBUEkuIEluCj4gPiBwcmV2aW91cyBMaW51eCB2ZXJzaW9uLCB4ZW4tc3dpb3RsYiB3
aWxsIGNhbGwgZGV2LT5hcmNoZGF0YS5kZXZfZG1hX29wcyAoYQo+ID4gY29weSBvZiBkZXYtPmRt
YV9vcHMgYmVmb3JlIHNldHRpbmcgWGVuIERNQSBvcHMpIGlmIG5vdCBOVUxMLiBEb2VzIGl0IG1l
YW4KPiA+IHdlIGV4cGVjdCBkZXYtPmRtYV9vcHMgdG8gYWx3YXlzIGJlIE5VTEwgYW5kIGhlbmNl
IHVzaW5nIGRtYS1kaXJlY3QgQVBJPwo+IAo+IFRoZSB3YXkgSSB1bmRlcnN0b29kIHRoZSBjb2Rl
IGZyb20gaW5zcGVjdGluZyBpdCBhbmQgc2tpbmcgdGhlCj4gbWFpbnRhaW5lcnMgYSBmZXcgYXNr
aW5ncyBpcyB0aGF0IGZvciBET00wIHdlIGFsd2F5cyB1c2UgeGVuLXN3aW90bGIKPiBhcyB0aGUg
YWN0dWFsIGRtYV9tYXBfb3BzLCBidXQgdGhlbiB1c2UgdGhlIGZ1bmN0aW9ucyBpbiBwYWdlLWNv
aGVyZW50LmgKPiBvbmx5IHRvIGRlYWwgd2l0aCBjYWNoZSBtYWludGFpbmFuY2UsIHNvIGl0IHNo
b3VsZCBiZSBzYWZlLgoKWWVzLCB3aGF0IHlvdSB3cm90ZSBpcyBjb3JyZWN0LCB0aGUgc3R1ZmYg
aW4KaW5jbHVkZS94ZW4vYXJtL3BhZ2UtY29oZXJlbnQuaCBpcyBvbmx5IHRvIGRlYWwgd2l0aCBj
YWNoZSBtYWludGVuYW5jZSwKc3BlY2lmaWNhbGx5IGFueSBjYWNoZSBtYWludGVuYW5jZSBvcGVy
YXRpb25zIHRoYXQgbWlnaHQgYmUgcmVxdWlyZWQgYnkKbWFwL3VubWFwX3BhZ2UsIGRtYV9zeW5j
X3NpbmdsZV9mb3JfY3B1L2RldmljZS4KCkl0IGxvb2tzIGxpa2UgaXQgaXMgc2FmZSB0b2RheSB0
byBtYWtlIHRoZSBkbWFfZGlyZWN0IGNhbGxzIGRpcmVjdGx5LAplc3BlY2lhbGx5IGNvbnNpZGVy
aW5nIHRoYXQgb24gYXJtNjQgaXQgbG9va3MgbGlrZSB0aGUgb25seSBvdGhlciBvcHRpb24KaXMg
aW9tbXVfZG1hX29wcyB3aGljaCBoYXMgbmV2ZXIgYmVlbiB1c2VkIHdpdGggWGVuIHNvIGZhciAo
dGhlIElPTU1VCmhhcyBub3QgYmVlbiBleHBvc2VkIHRvIGd1ZXN0cyB5ZXQpLgoKT24gYXJtMzIg
d2UgZG9uJ3QgaGF2ZSB0aGlzIHByb2JsZW0gYmVjYXVzZSBkZXYtPmRtYV9vcHMgaXMgYWx3YXlz
ICE9Ck5VTEwgd2l0aCBNTVUgZW5hYmxlIChyZXF1aXJlZCBvbiBYZW4pLCByaWdodD8KClNvIHRo
ZSBwYXRjaCBsb29rcyBmaW5lLCBJIG9ubHkgaGF2ZSBhbiBvcHRpb25hbCBzdWdnZXN0aW9uIHRv
IGFkZCBhCmNoZWNrIG9uIGRtYV9vcHMgYmVpbmcgdW5zZXQuIEknbGwgcmVwbHkgdG8gdGhlIHBh
dGNoLiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
