From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 17/17] xen/arm: Track page
 accessed between batch of Set/Way operations
Date: Fri, 7 Dec 2018 13:24:16 +0000
Message-ID: <b0f5aa89-1762-04c7-8196-ea969ebfbc2f@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-18-julien.grall@arm.com>
 <5C078E40020000780020305C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IgRO=OQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gVG7B-0002T5-DY
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 13:24:21 +0000
In-Reply-To: <5C078E40020000780020305C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDUvMTIvMjAxOCAwODozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDQuMTIuMTggYXQgMjE6MjYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEF0IHRo
ZSBtb21lbnQsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBTZXQvV2F5IG9wZXJhdGlvbnMgd2lsbCBn
byB0aHJvdWdoCj4+IGFsbCB0aGUgZW50cmllcyBvZiB0aGUgZ3Vlc3QgUDJNIGFuZCBmbHVzaCB0
aGVtLiBIb3dldmVyLCB0aGlzIGlzIHZlcnkKPj4gZXhwZW5zaXZlIGFuZCBtYXkgcmVuZGVyIHVu
dXNhYmxlIGEgZ3Vlc3QgT1MgdXNpbmcgdGhlbS4KPj4KPj4gRm9yIGluc3RhbmNlLCBMaW51eCAz
Mi1iaXQgd2lsbCB1c2UgU2V0L1dheSBvcGVyYXRpb25zIGR1cmluZyBzZWNvbmRhcnkKPj4gQ1BV
IGJyaW5nLXVwLiBBcyB0aGUgaW1wbGVtZW50YXRpb24gaXMgcmVhbGx5IGV4cGVuc2l2ZSwgaXQg
bWF5IGJlIHBvc3NpYmxlCj4+IHRvIGhpdCB0aGUgQ1BVIGJyaW5nLXVwIHRpbWVvdXQuCj4+Cj4+
IFRvIGxpbWl0IHRoZSBTZXQvV2F5IGltcGFjdCwgd2UgdHJhY2sgd2hhdCBwYWdlcyBoYXMgYmVl
biBvZiB0aGUgZ3Vlc3QKPj4gaGFzIGJlZW4gYWNjZXNzZWQgYmV0d2VlbiBiYXRjaCBvZiBTZXQv
V2F5IG9wZXJhdGlvbnMuIFRoaXMgaXMgZG9uZQo+PiB1c2luZyBiaXRbMF0gKGFrYSB2YWxpZCBi
aXQpIG9mIHRoZSBQMk0gZW50cnkuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwZXItYXJj
aCBoZWxwZXIgaXMgaW50cm9kdWNlZCB0byBwZXJmb3JtIGFjdGlvbnMganVzdAo+PiBiZWZvcmUg
dGhlIGd1ZXN0IGlzIGZpcnN0IHVucGF1c2VkLiBUaGlzIHdpbGwgYmUgdXNlZCB0byBpbnZhbGlk
YXRlIHRoZQo+PiBQMk0gdG8gdHJhY2sgYWNjZXNzIGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBndWVz
dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPj4KPj4gLS0tCj4+Cj4+IFdoaWxlIHdlIGNhbiBzcHJlYWQgZC0+Y3JlYXRpb25fZmluaXNo
ZWQgYWxsIG92ZXIgdGhlIGNvZGUsIHRoZSBwZXItYXJjaAo+PiBoZWxwZXIgdG8gcGVyZm9ybSBh
Y3Rpb25zIGp1c3QgYmVmb3JlIHRoZSBndWVzdCBpcyBmaXJzdCB1bnBhdXNlZCBjYW4KPj4gYnJp
bmcgYSBsb3Qgb2YgYmVuZWZpdCBmb3IgYm90aCBhcmNoaXRlY3R1cmUuIEZvciBpbnN0YW5jZSwg
b24gQXJtLCB0aGUKPj4gZmx1c2ggdG8gdGhlIGluc3RydWN0aW9uIGNhY2hlIGNvdWxkIGJlIGRl
bGF5ZWQgdW50aWwgdGhlIGRvbWFpbiBpcwo+PiBmaXJzdCBydW4uIFRoaXMgd291bGQgaW1wcm92
ZSBncmVhdGx5IHRoZSBwZXJmb3JtYW5jZSBvZiBjcmVhdGluZyBndWVzdC4KPiAKPiBKdXN0IHRo
ZSBvdGhlciBkYXkgd2UgaGFkIGZvdW5kIGEgcG90ZW50aWFsIHVzZSBvbiB4ODYgYXMgd2VsbAo+
IChldmVuIGlmIEkgYWxyZWFkeSBkb24ndCByZWNhbGwgYW55bW9yZSB3aGF0IGl0IHdhcyksIHNv
IHRoZQo+IGFkZGl0aW9uIGlzIGNlcnRhaW5seSBoZWxwZnVsLiBJdCBtaWdodCBoYXZlIGJlZW4g
bmljZSB0byBzcGxpdAo+IGludHJvZHVjdGlvbiBvZiB0aGUgaW50ZXJmYWNlIGZyb20gd2hhdCB5
b3UgYWN0dWFsbHkgd2FudCBpdCB0bwo+IGRvIG9uIEFybSwgYnV0IGlycmVzcGVjdGl2ZSBvZiB0
aGF0Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBmb3Ig
dGhlIG5vbi1Bcm0gcGllY2VzIGhlcmUuCgpJIGFtIGV4cGVjdGluZyB0aGUgcGF0Y2ggdG8gYmUg
bWVyZ2VkIGluIHRoZSBuZXh0IGNvdXBsZSBvZiB3ZWVrcy4gQnV0IEkgYW0gCmhhcHB5IHRvIHNw
bGl0IGl0IGlmIHlvdSBuZWVkIGl0IGJlZm9yZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
